"""Luraph v14 key-schedule scrambler, recovered from CloverHub(StealAnEgg).lua.

The VM's `x = function (u)` handler returns a closure that advances a
* scheduled * linear congruential generator:

        state <- (A[k] * state + B[k]) mod 2**24

with a different (A, B) pair for each of the 37 rounds, cycling back to k = 0.
The 24-bit state is the raw key material the constant-pool decoder consumes.

`state` lives at J[1][J[3]] in the VM, where J = u[0] (the state table).

Nothing here decrypts on its own - the *seed* (initial state) and the byte
mapping live elsewhere in the VM.  This module exists so that once a seed
candidate is known (or brute-forced against a known-plaintext prefix) the
keystream can be reproduced offline.

Usage:
    python luraph_keystream.py --seed 12345678 --count 24
"""

import argparse
import json
import os

MOD = 1 << 24  # 16777216

# (A, B) pairs, in execution order, extracted from the `x` handler body.
SCHEDULE = [
    (494889, 10992712), (176321, 4304560), (446975, 7610952), (73831, 5900539),
    (517367, 10901646), (730347, 1622266), (216013, 10342430), (930201, 4062287),
    (483255, 3877977), (442069, 5733698), (838897, 11418662), (1008645, 4345895),
    (915389, 2935044), (838537, 227488), (894773, 14586949), (453915, 5523393),
    (74723, 9427371), (685673, 16022583), (736583, 10138635), (447575, 525319),
    (161133, 1088461), (467061, 3554178), (539111, 2177129), (13953, 3827578),
    (904261, 2209058), (405145, 7993569), (988269, 5244597), (577631, 14513755),
    (820927, 14017210), (403153, 2671716), (853209, 9888481), (231419, 14319387),
    (226405, 15809879), (182655, 8863959), (915709, 9892087), (882069, 13866757),
    (550205, 14814988),
]

ROUNDS = len(SCHEDULE)


def advance(state, k):
    """One round of the schedule."""
    a, b = SCHEDULE[k % ROUNDS]
    return (a * state + b) % MOD


def keystream(seed, count):
    """Yield `count` successive 24-bit states, starting *after* the seed."""
    state = seed % MOD
    out = []
    for k in range(count):
        state = advance(state, k)
        out.append(state)
    return out


def keystream_bytes(seed, count, order="big"):
    """Yield the states unpacked as 3-byte groups."""
    buf = bytearray()
    for v in keystream(seed, count):
        buf += v.to_bytes(3, order)
    return bytes(buf)


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--seed", type=int, required=True, help="initial 24-bit state")
    ap.add_argument("--count", type=int, default=24, help="number of rounds to print")
    ap.add_argument("--bytes", action="store_true", help="print packed 3-byte groups")
    ap.add_argument("--order", default="big", choices=("big", "little"))
    ap.add_argument("--json", metavar="PATH", help="write the schedule as JSON and exit")
    args = ap.parse_args()

    if args.json:
        with open(args.json, "w", encoding="utf-8") as fh:
            json.dump({"mod": MOD, "rounds": ROUNDS,
                       "schedule": [list(p) for p in SCHEDULE]}, fh, indent=1)
        print(f"wrote {args.json}")
        return

    if args.bytes:
        data = keystream_bytes(args.seed, args.count, args.order)
        print(data.hex())
        return

    for k, v in enumerate(keystream(args.seed, args.count)):
        a, b = SCHEDULE[k % ROUNDS]
        print(f"  k={k:<3} A={a:<8} B={b:<9} state=0x{v:06x} ({v})")


if __name__ == "__main__":
    main()
