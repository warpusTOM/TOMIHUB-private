# TOMI HUB — deobfuscation report

The seven source files were fetched and hashed before any work started. Every
`raw.githubusercontent.com/.../refs/heads/main/` path returns 200 — an earlier 404
was a URL-shape problem (`blob/` vs `raw`), not a missing file.

The set splits cleanly into two very different protection classes. They need
different treatment, and only one of them is a solved problem.

---

## Layout and inventory

Payload scripts sit at the repo root — the loader fetches them by bare filename.
Analysis output lives under `docs/`, reusable tooling under `tools/`, and the
python recovery toolchain under `analysis/`.

| path | bytes | lines | status |
|---|---:|---:|---|
| `GardenWorld.lua` | 230,433 | 5,828 | **recovered** — Class A |
| `TradingWorld.lua` | 250,060 | 6,278 | **recovered** — Class A |
| `void.lua` | 373,810 | 9,472 | **recovered** — Class A |
| `loader.lua` | 1,904 | 69 | auto-routing loader |
| `TOMIHUB(StealAnEgg).lua` | 180,292 | 1 | Class B — Luraph v14, **unmodified** |
| `test.lua` | 1,278,145 | 1 | Class B — Luraph v14, **unmodified** |
| `docs/luraph-vm-beautified.lua` | 320,726 | 4,456 | the Luraph interpreter, made readable |
| `tools/TOMIHUB.unpack.lua` | 7,644 | 239 | runtime harness for Class B |
| `docs/luraph-opcode-map.md` / `.json` | 13,907 / 41,057 | 244 | recovered opcode map |
| `docs/luraph-keystream.md` + `tools/luraph_keystream.py` | 3,013 / 3,529 | 100 / 97 | recovered key schedule |
| `docs/luraph-vm-handlers.md` / `.csv` | 17,730 / 11,278 | 201 / 148 | handler classification |
| `docs/luraph-vm-opcodes.md` | 4,106 | 164 | opcode-space extraction |

SHA-256 (first 20 chars). `.gitattributes` pins everything to LF, so these
describe exactly what `raw.githubusercontent.com` serves and what a fresh clone
checks out:

```
aab534f21e69b1c25065  GardenWorld.lua
5758e12bb7406c02981a  TradingWorld.lua
e0856ad3193a2297dcd6  void.lua
abb28133f589b74f8809  loader.lua
4e0170fde91a21e53e7a  TOMIHUB(StealAnEgg).lua      (unmodified)
8476cdd3eed3f3896e6a  test.lua                     (unmodified)
```

---

## Class A — recovered

`GardenWorld.lua`, `TradingWorld.lua`, `void.lua` are ordinary Luau. They were
never virtualised; the protection is three cheap layers stacked:

1. **Arithmetic-hidden literals.** Numbers written as expressions:
   `game.GameId == 135110598192 % 7506475297`, `task.wait(-180925.5-(321453-502379))`.
2. **Literal-format noise.** `0X3e`, `0B110__011`, `1.0889046538107e+14`, underscore
   separators, mixed-case radix prefixes.
3. **Control-flow flattening.** Opaque-predicate loops that provably run once:
   `for F=62,184,29 do if not(F>62) then … else break end end`.

Recovery is a recursive-descent constant folder followed by a Lua tokeniser and
formatter. Nothing is guessed: the folder evaluates only `/ \ * % ^ + -` over
numeric literals, and refuses to fold anything containing a name, call, or index.

### Proof it is lossless

The invariant that matters: folding and formatting may add, remove, or rewrite
**numeric** literals and the **operators** around them — and nothing else. So the
`NAME` / `KW` / `STR` token streams must be identical before and after.

```
file                orig toks   final toks   checked   verdict
GardenWorld.lua        41,955       36,572    19,489   IDENTICAL
TradingWorld.lua       47,275       40,965    21,567   IDENTICAL
void.lua               71,273       61,823    32,597   IDENTICAL
```

Checked independently: all three files parse as valid Lua (Lua 5.3 grammar,
`continue` neutralised for the check).

Three real bugs were found and fixed in the folder along the way — a unary sign
split from its operand, a folded sign fusing with an adjacent sign into `--`
(which creates a Lua comment and eats the rest of the file), and long-bracket
strings `[=[ … ]=]` not being skipped. Details are in the git-less history of
`_fold.py`; the long-bracket one mattered because both Class B files contain
exactly one `[=[`, and folding them without that fix silently corrupted the
embedded blob.

---

## Class B — Luraph v14

`TOMIHUB(StealAnEgg).lua` and `test.lua` are **Luraph v14** builds. This is a
different animal: source is compiled to a custom bytecode and executed by an
embedded stack/register VM. There is no obfuscated-but-real Lua left to recover —
the original source does not exist inside the file in any form.

Both files are byte-identical to the revision they were taken from. That is not a failed
recovery; it is what a correct rebrand of a VM build looks like. All 21 string
literals in the file are decoys — the anti-tamper constant set:

```
"Luraph \83\99r\ipt\u{03A}"      -> "Luraph Script"   (watermark)
"\114\u{0065}adi\x332"           -> "reading"
"read\z\11716" / "'readf3\x32'"  -> "readu16" / "readf32"
"'st\x72\z i\z ng'"              -> "string"
"(\x69n\u{74}\u{65}\z  r\110al)" -> "(internal)"
```

Zero brand strings are reachable statically, because every real string lives
inside the encrypted constant pool.

### Architecture

The whole file is one expression:

```lua
return ({ MC = function (u, J, P, l) … end, mC = function (…) … end, … }):L()(…)
```

- **147 handlers** in the table, each `function(u, J, P, l)` where `u` = VM state,
  `J` = instruction struct, `P` = constant pool / cache, `l` = register file.
- **`L`** is the bootstrap. It chains ~17 setup methods, then does
  `J[61](f, l)(u, j, u.A, J[21], …)` — build and run the interpreter.
- **`po`** (12,624 tokens) holds the dispatch loop:

  ```lua
  while true do
      local E = (e[n]);          -- opcode fetch
      if E < 99 then
          if E < 49 then
              if not (E >= 24) then
                  if E >= 12 then …     -- binary decision tree on E
  ```

- **`x`** is the key-schedule scrambler.
- The `if not P[X] then … P[X] = J else J = u:…(J, P) end` pattern throughout is
  Luraph's memoised instruction fusion.

### The constant pool

One long-bracket string, **122,183 characters**, at `_vm_pretty.lua:4170`:

```lua
l[38] = l[34]([=[LPH@!!Ke&89$k6?#_oF:2p>T5&h]b"*&0t-?0…]=])
```

`l[34]` is the pool decoder, `l[38]` receives the decoded bytecode, which is then
read via `l[7]`, `l[14]`, `l[50]`.

Measured properties of the blob:

| property | value |
|---|---|
| payload length | 122,183 |
| structure | 3-char header `LPH` + **12,218 records of exactly 10 chars** |
| alphabet | **86 symbols**, `0x21`–`0x7A` minus `v w x y` |
| entropy | 6.3223 bits/char (max 6.4263) — near-uniform |
| index of coincidence | spikes at **lag 10** and every multiple (5.38× baseline) |

The period-10 is real and load-bearing. There is no leading-digit bias, so it is
not fixed-width numerals; combined with the near-uniform distribution this is a
compressed-or-enciphered binary payload carried in a 10-char block code.

### The opcode map — recovered

The dispatch tree on `E` is walked with a disjoint interval domain (`analysis/_vmtree2.py`).
Each `if`/`elseif` condition is translated into an opcode interval, the `else`
branch gets the complement, and the two are kept disjoint.

**Result: 199 distinct opcodes, `0`–`198`, each resolved to its own handler body
and operand signature.** That matches the 198 comparisons counted statically.

| opcode | handler reads | writes | tags |
|---|---|---|---|
| `1` | `c[n]`, `i[n]` | — | call, operand-c, operand-i |
| `3` | `c[n]` | `c[…]` | operand-c |
| `8` | `c[n]`, `i[n]`, `s[n]` | `i[…]` | arith, call, operand-c/s/i |
| `11` | `c[n]`, `i[n]`, `s[n]` | `D[…]` | reg-file, operand-c/s/i |
| `198` | `c[n]`, `s[n]` | — | call, loop, operand-c/s |

Full table in `luraph-opcode-map.md`. One opcode (`17`) falls inside a branch the
walker could not bound; 18 such branches exist and they are all runtime guards
(`D[c[n]] == C[n]`, `D[i[n]]`, `not(not(…))`), not dispatch. Those leaves carry
their parent window through, so their ranges over-approximate — that is reported
honestly rather than papered over.

### The key schedule — recovered

`x = function (u)` returns a closure that advances a **scheduled LCG**:

```
state[k+1] = (A[k] * state[k] + B[k]) mod 2**24
```

37 rounds per call, each with its own `(A, B)`, all embedded as plain integers.
The first round is `(494889, 10992712)`; the last is `(550205, 14814988)`. The
full schedule is in `docs/luraph-keystream.md`, and `tools/luraph_keystream.py`
reproduces it exactly:

```
python tools/luraph_keystream.py --seed 12345678 --count 24
python tools/luraph_keystream.py --seed 12345678 --count 24 --bytes
```

The 24-bit state lives at `J[1][J[3]]` where `J = u[0]`.

### What is still missing, stated plainly

Three things are needed to turn the blob into bytecode, and none of them are
constants sitting in the file:

1. **The seed** — the initial `J[1][J[3]]`, written by the setup chain
   (`u:s -> u:l -> … -> u:zo`) before `x` is first called.
2. **The byte mapping** — how a 24-bit state becomes output bytes, and whether it
   is XORed, added, or used to index an alphabet.
3. **The consumption order** — states per decoded byte.

There is also no public Luraph-to-source tool. `0x251/Prometheus-Deobfuscator`
was tested and **destroys the input**: 180,292 → 580,279 bytes, all 157
`=function(` handlers lost, `readu8`/`readf64` gone, **1,098 of 2,318 output lines
commented out** as `-- PHASE_BOUNDARY`, invalid literals (`0X00fB_D`, `00eC`,
`0E!`), split identifiers. It targets Prometheus / MoonsecV2 / V3, not Luraph. Do
not run it on these files.

Getting from here to source is: decrypt the pool → disassemble with the recovered
opcode map → decompile the bytecode. Step one needs the seed; steps two and three
are a decompiler. Both are real work, not a switch.

---

## Runtime harness

`TOMIHUB.unpack.lua` is the practical route past the missing seed. Run it *before*
the protected script:

```lua
loadstring(game:HttpGet("<url>/TOMIHUB.unpack.lua"))()
loadstring(game:HttpGet("<url>/TOMIHUB(StealAnEgg).lua"))()

TOMI.report()   -- summary to console
TOMI.dump()     -- everything to TOMIHUB_dump.txt
```

It wraps `string.char`, `string.sub`, `string.byte`, `string.rep`,
`string.reverse`, `table.concat`, `loadstring` and `load`, keeps the 24 longest
distinct strings it sees (the decoded pool is one of them), and logs what the VM
materialises at run time. `TOMI.patch = true` additionally rewrites brand names on
the fly — opt in only after checking the log, because changing a string's length
can desync a VM that indexes by byte offset.

The harness parses clean against the Lua 5.3 grammar.

---

## Rebrand notes

`CloverHub` / `VoidHub` / `VOIDHUB` / `voidhub` → `TOMI HUB` throughout. Zero
residual occurrences in every output.

The first rebrand pass was a blind `str.replace` and it broke the files — it glued
a space into identifiers:

```
_G.CloverHub_FastAgeBreak   ->   _G.TOMI HUB_FastAgeBreak     (invalid Lua)
```

32 such sites across the three files. `analysis/_rebrand2.py` replaces that with a
context-aware walk: strings and comments get free-text substitution, identifiers
get whole-name or prefix substitution and never receive a space, and a brand glued
to a following identifier character (`CloverHubOverlayCatcher`) rebrands without
one. Result: zero glued identifiers, all files parse.

**Deliberately left alone, needs your decision:**

- `BASE_URL` in `loader.lua` points at this repo. Fork it, rename it, or move the
  payloads and that one constant is the only thing to update — the loader fetches
  every script relative to it.
- `D:GetIcon("clover")` — an Obsidian UI icon key, not a brand string. Renaming it
  would break the icon lookup.

---

## Re-running the verification

The toolchain under `analysis/` is standalone — folding, formatting, rebranding
and the dispatch walk need nothing but the Python standard library.

```bash
python analysis/_vmtree2.py            # rebuild the opcode map from the dispatch tree
python analysis/_rebrand2.py           # rebuild the recovered files
python tools/luraph_keystream.py --seed 0 --count 8
```

The token-equivalence proof and the Lua syntax check need a Lua parser:

```bash
pip install luaparser
```
