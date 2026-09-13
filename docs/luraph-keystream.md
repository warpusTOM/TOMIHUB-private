# Luraph v14 - recovered key-schedule scrambler

Extracted from the `x` handler of `CloverHub(StealAnEgg).lua` (the Luraph VM).

## What it is

```lua
x = function (u)          -- returns a closure
  local J = u[0];         -- J[1] = state table, J[3] = slot index
  return function ()
    local u = 494889;
    local P = J[1][J[3]];
    u = u * P;            -- state <- A * state
    P = 10992712;
    u = u + P;            -- state <- state + B
    P = 16777216;
    u = u % P;            -- state <- state mod 2^24
    J[1][J[3]] = u;
    -- ... 36 more identical blocks, each with its own (A, B) ...
  end;
end
```

One call advances the generator **37 rounds** and writes the final 24-bit
state back into `J[1][J[3]]`. The state itself is the key material the
constant-pool decoder consumes.

## The recurrence

```
state[k+1] = (A[k] * state[k] + B[k]) mod 2**24
```

- modulus: **2^24 = 16777216**
- rounds per call: **37**
- A, B: two constants per round, all embedded as plain integers

## Extracted schedule

| k | A | B |
|---|---|---|
| 0 | `494889` | `10992712` |
| 1 | `176321` | `4304560` |
| 2 | `446975` | `7610952` |
| 3 | `73831` | `5900539` |
| 4 | `517367` | `10901646` |
| 5 | `730347` | `1622266` |
| 6 | `216013` | `10342430` |
| 7 | `930201` | `4062287` |
| 8 | `483255` | `3877977` |
| 9 | `442069` | `5733698` |
| 10 | `838897` | `11418662` |
| 11 | `1008645` | `4345895` |
| 12 | `915389` | `2935044` |
| 13 | `838537` | `227488` |
| 14 | `894773` | `14586949` |
| 15 | `453915` | `5523393` |
| 16 | `74723` | `9427371` |
| 17 | `685673` | `16022583` |
| 18 | `736583` | `10138635` |
| 19 | `447575` | `525319` |
| 20 | `161133` | `1088461` |
| 21 | `467061` | `3554178` |
| 22 | `539111` | `2177129` |
| 23 | `13953` | `3827578` |
| 24 | `904261` | `2209058` |
| 25 | `405145` | `7993569` |
| 26 | `988269` | `5244597` |
| 27 | `577631` | `14513755` |
| 28 | `820927` | `14017210` |
| 29 | `403153` | `2671716` |
| 30 | `853209` | `9888481` |
| 31 | `231419` | `14319387` |
| 32 | `226405` | `15809879` |
| 33 | `182655` | `8863959` |
| 34 | `915709` | `9892087` |
| 35 | `882069` | `13866757` |
| 36 | `550205` | `14814988` |

## Why this alone does not decrypt the pool

Three things are still needed, and none of them are constants:

1. **The seed** - the initial value of `J[1][J[3]]`, written by the VM setup
   chain (`u:s -> u:l -> ... -> u:zo`) before `x` is ever called.
2. **The byte mapping** - how a 24-bit state becomes output bytes (endianness,
   and whether it is XORed, added, or used to index an alphabet).
3. **The consumption order** - how many states per decoded byte.

`luraph_keystream.py` reproduces the schedule exactly, so once a seed
candidate exists (from a runtime trace, or brute-forced against a
known-plaintext prefix) the keystream can be generated offline.

## Usage

```
python luraph_keystream.py --seed 12345678 --count 24
python luraph_keystream.py --seed 12345678 --count 24 --bytes
python luraph_keystream.py --seed 0 --json schedule.json
```
