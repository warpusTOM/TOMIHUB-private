# Luraph v14 VM - opcode map (recovered by walking the dispatch tree)

Interpreter core `po` - 12,624 tokens. The `while true` loop fetches
`E = e[n]` and dispatches through a nested if/elseif/else binary decision tree.
Walking that tree with disjoint opcode intervals yields the map below.

- leaves reached: **209**
- distinct opcodes covered: **255**
- unparseable (non-`E`) branch conditions: **18**

Branches the walker could not bound (window carried through, so those
leaves over-approximate their opcode range):

- `D [ c [ n ] ] == C [ n ]`
- `D [ c [ n ] ] ~= D [ i [ n ] ]`
- `D [ c [ n ] ] ~= D [ s [ n ] ]`
- `D [ i [ n ] ]`
- `D [ i [ n ] ] ~= t [ n ]`
- `U`
- `not ( D [ c [ n ] ] <= t [ n ] )`
- `not ( D [ i [ n ] ] <= D [ c [ n ] ] )`
- `not ( U )`
- `not ( X [ n ] < D [ s [ n ] ] )`
- `not ( not ( D [ c [ n ] ] < D [ s [ n ] ] ) )`
- `not ( not ( D [ s [ n ] ] < C [ n ] ) )`
- `not ( not ( X [ n ] <= D [ i [ n ] ] ) )`
- `not ( not D [ i [ n ] ] )`

- opcodes claimed by more than one leaf: **11**

| opcode(s) | handler reads | writes | body ops | toks |
|---|---|---|---|---|
| `0` | `B[S]`, `t[n]` | - | - | 14 |
| `1` | `c[n]`, `i[n]` | - | call, operand-c, operand-i | 20 |
| `2` | `T[d]` | - | call | 9 |
| `3` | `c[n]` | `c[…]` | operand-c | 10 |
| `4` | - | - | call | 14 |
| `5` | `c[n]`, `i[n]`, `t[n]` | `c[…]` | operand-c, operand-i | 21 |
| `6` | `V[T]` | - | - | 7 |
| `7` | - | - | - | 8 |
| `8` | `c[n]`, `i[n]`, `s[n]` | `i[…]` | arith, call, operand-c, operand-i, operand-s | 28 |
| `9` | - | - | - | 0 |
| `9` | `s[n]` | - | operand-s | 7 |
| `10` | `C[n]`, `c[n]` | - | call, operand-c | 23 |
| `11` | `c[n]`, `i[n]`, `s[n]` | `D[…]` | operand-c, operand-i, operand-s, reg-file | 25 |
| `12` | - | - | - | 4 |
| `13` | `T[d]` | - | - | 12 |
| `14` | `c[n]`, `s[n]` | - | call, operand-c, operand-s | 24 |
| `15` | `B[S]`, `s[n]` | - | call, operand-s | 18 |
| `16` | - | - | call | 12 |
| `18` | `c[n]`, `i[n]`, `t[n]` | `c[…]` | call, operand-c, operand-i | 23 |
| `19` | `i[n]` | - | operand-i | 7 |
| `20` | - | - | - | 0 |
| `20` | `i[n]` | - | operand-i | 7 |
| `21` | `c[n]`, `i[n]`, `s[n]` | `i[…]` | arith, operand-c, operand-i, operand-s | 24 |
| `22` | `D[L]`, `c[n]`, `s[n]` | - | arith, call, loop, operand-c, operand-s, reg-file | 45 |
| `23` | `c[n]`, `i[n]`, `s[n]` | `i[…]` | arith, call, operand-c, operand-i, operand-s | 28 |
| `24` | - | - | - | 0 |
| `24` | `c[n]` | - | call, operand-c | 9 |
| `25` | `R[1]`, `R[3]`, `R[4]`, `R[5]` | - | call | 32 |
| `26` | `i[n]` | `i[…]` | call, operand-i | 14 |
| `27` | `c[n]`, `i[n]`, `s[n]` | `s[…]` | call, cmp, operand-c, operand-i, operand-s | 26 |
| `28` | `c[n]`, `i[n]`, `s[n]` | `i[…]` | call, cmp, operand-c, operand-i, operand-s | 28 |
| `29` | `T[1]`, `T[3]`, `c[n]`, `i[n]` | `i[…]` | call, operand-c, operand-i | 31 |
| `30` | `i[n]` | - | call, operand-i | 20 |
| `31` | `i[n]`, `s[n]` | - | call, operand-i, operand-s | 20 |
| `32` | `J[38]`, `s[n]` | `s[…]` | call, operand-s | 15 |
| `33` | `B[S]`, `T[d]`, `c[n]` | - | call, operand-c | 23 |
| `34` | `S[V]` | - | call | 17 |
| `35` | `S[V]` | - | call | 18 |
| `36` | `C[n]`, `D[r]`, `J[9]`, `N[r]`, `S[1]`, `S[3]` | `c[…]` | arith, call, cmp, len, loop, operand-c, reg-file | 215 |
| `37` | `s[n]` | `s[…]` | operand-s | 10 |
| `38` | `i[n]` | `i[…]` | operand-i | 10 |
| `39` | - | - | - | 8 |
| `40` | `i[n]` | - | operand-i | 15 |
| `41` | `B[T]` | - | - | 11 |
| `42` | `D[T]`, `i[n]` | - | arith, call, operand-i, reg-file | 37 |
| `43` | `c[n]`, `i[n]`, `s[n]` | `c[…]` | call, cmp, operand-c, operand-i, operand-s | 26 |
| `44` | `X[n]` | - | - | 7 |
| `45` | `i[n]` | - | operand-i | 7 |
| `46` | `s[n]` | `s[…]` | operand-s | 10 |
| `47` | `X[n]`, `i[n]`, `s[n]` | `i[…]` | arith, call, operand-i, operand-s | 23 |
| `48` | `C[n]`, `c[n]` | - | call, operand-c | 22 |
| `49` | `c[n]`, `t[n]` | `c[…]` | call, operand-c | 20 |
| `50` | `B[S]`, `s[n]` | - | call, operand-s | 16 |
| `51` | `B[V]`, `H[p]`, `J[31]`, `T[d]`, `V[r]`, `c[n]` | - | argpack?, arith, call, cmp, loop, operand-c, operand-i | 1247 |
| `52` | `J[35]`, `i[n]` | `i[…]` | call, operand-i | 17 |
| `53` | `C[n]`, `T[1]`, `T[3]`, `s[n]` | `T[…]` | operand-s | 26 |
| `54` | `T[1]`, `T[3]`, `c[n]`, `i[n]`, `s[n]` | `D[…]` | call, operand-c, operand-i, operand-s, reg-file | 40 |
| `55` | `C[n]`, `c[n]`, `s[n]` | `s[…]` | call, operand-c, operand-s | 23 |
| `56` | `D[T]`, `J[25]`, `i[n]`, `s[n]` | - | arith, call, operand-i, operand-s, reg-file | 47 |
| `57` | `c[n]`, `s[n]` | - | operand-c, operand-s | 18 |
| `58` | `i[n]` | - | operand-i | 11 |
| `59` | `c[n]`, `i[n]`, `s[n]` | `i[…]` | call, operand-c, operand-i, operand-s | 26 |
| `60` | `D[T]`, `J[26]`, `s[n]` | - | argpack?, arith, call, operand-s, reg-file | 37 |
| `61` | `c[n]` | - | operand-c | 11 |
| `62` | `D[T]`, `J[26]`, `c[n]`, `i[n]` | - | argpack?, arith, call, operand-c, operand-i, reg-file | 50 |
| `63` | `D[T]`, `i[n]` | - | arith, call, operand-i, reg-file | 31 |
| `64` | - | - | - | 4 |
| `65` | `s[n]` | - | call, operand-s | 9 |
| `66` | - | - | - | 0 |
| `66` | `A[3]`, `D[q]` | - | call, cmp, loop, reg-file | 61 |
| `67` | `A[1]`, `A[2]`, `A[3]`, `D[q]` | - | call, cmp, loop, reg-file | 51 |
| `68` | `t[n]` | - | call | 26 |
| `69` | - | - | - | 0 |
| `70` | `C[n]`, `c[n]`, `s[n]` | `c[…]` | arith, call, operand-c, operand-s | 23 |
| `71` | `X[n]`, `i[n]`, `t[n]` | `X[…]` | operand-i | 19 |
| `72` | - | - | - | 0 |
| `72` | `A[1]`, `A[3]`, `D[q]`, `U[q]` | - | call, cmp, loop, reg-file | 55 |
| `73` | `T[1]`, `T[3]`, `c[n]`, `i[n]`, `t[n]` | `c[…]` | call, operand-c, operand-i | 37 |
| `74` | `D[T]`, `J[25]`, `c[n]`, `i[n]`, `s[n]` | - | arith, call, operand-c, operand-i, operand-s, reg-file | 48 |
| `75` | `X[n]`, `i[n]`, `s[n]` | `s[…]` | arith, call, operand-i, operand-s | 23 |
| `76` | `D[T]`, `J[26]`, `c[n]` | - | argpack?, arith, call, operand-c, reg-file | 38 |
| `77` | `B[S]`, `T[d]` | - | call | 16 |
| `78` | `T[d]`, `s[n]` | - | call, operand-s | 16 |
| `79` | `S[V]`, `c[n]` | - | call, operand-c | 20 |
| `80` | `B[S]` | - | - | 7 |
| `81` | `D[M]`, `c[n]` | - | call, operand-c, reg-file | 22 |
| `82` | `c[n]`, `i[n]`, `s[n]` | `i[…]` | operand-c, operand-i, operand-s | 25 |
| `83` | `c[n]` | - | call, operand-c | 9 |
| `84` | `B[S]`, `J[31]`, `T[d]`, `c[n]`, `e[n]`, `s[n]` | - | arith, call, cmp, loop, operand-c, operand-s | 895 |
| `85` | `c[n]` | - | operand-c | 15 |
| `86` | `S[V]` | - | call | 20 |
| `87` | `Z[q]`, `c[n]` | - | arith, call, const-table, loop, operand-c | 36 |
| `88` | `T[1]`, `T[3]`, `X[n]`, `i[n]`, `s[n]` | `X[…]` | call, operand-i, operand-s | 37 |
| `89` | - | - | - | 4 |
| `90` | `c[n]`, `i[n]`, `t[n]` | `D[…]` | call, operand-c, operand-i, reg-file | 26 |
| `91` | `X[n]`, `i[n]`, `s[n]` | `i[…]` | call, cmp, operand-i, operand-s | 25 |
| `92` | `c[n]`, `i[n]` | `i[…]` | call, operand-c, operand-i | 18 |
| `93` | `s[n]` | - | call, operand-s | 19 |
| `94` | `T[d]`, `c[n]` | - | call, operand-c | 20 |
| `95` | `D[T]`, `i[n]`, `s[n]` | - | arith, call, operand-i, operand-s, reg-file | 79 |
| `96` | `c[n]`, `i[n]`, `s[n]` | `s[…]` | arith, operand-c, operand-i, operand-s | 24 |
| `97` | `c[n]` | - | call, operand-c | 17 |
| `98` | `T[d]`, `s[n]` | - | operand-s | 14 |
| `99` | `B[S]`, `C[n]`, `H[p]`, `J[31]`, `S[r]`, `T[d]` | - | arith, call, cmp, loop, operand-c, operand-s | 1360 |
| `100` | `c[n]`, `i[n]`, `t[n]` | `c[…]` | arith, call, operand-c, operand-i | 23 |
| `101` | `B[S]`, `s[n]` | - | call, operand-s | 22 |
| `102` | `c[n]`, `s[n]` | `c[…]` | call, len, operand-c, operand-s | 21 |
| `103` | `T[1]`, `T[3]`, `i[n]`, `s[n]` | `T[…]` | call, operand-i, operand-s | 33 |
| `104` | `C[n]`, `c[n]`, `s[n]` | `c[…]` | operand-c, operand-s | 22 |
| `105` | `i[n]`, `s[n]` | - | arith, call, operand-i, operand-s | 53 |
| `106` | `T[1]`, `T[3]`, `c[n]`, `i[n]`, `s[n]` | `i[…]` | call, operand-c, operand-i, operand-s | 44 |
| `107` | `c[n]` | - | operand-c | 7 |
| `108` | `d[B]` | - | call | 19 |
| `109` | `X[n]`, `i[n]`, `s[n]` | `s[…]` | call, cmp, operand-i, operand-s | 23 |
| `110` | `D[T]`, `s[n]` | - | arith, call, operand-s, reg-file | 40 |
| `111` | - | - | - | 0 |
| `111` | `D[q]`, `f[2]` | - | call, cmp, loop, reg-file | 57 |
| `112` | `c[n]`, `s[n]` | `c[…]` | arith, call, operand-c, operand-s | 19 |
| `113` | - | - | call | 9 |
| `114` | `s[n]` | `s[…]` | call, operand-s | 12 |
| `115` | `D[q]`, `Z[q]`, `s[n]` | - | const-table, loop, operand-s, reg-file | 22 |
| `116` | `B[V]`, `H[p]`, `J[31]`, `V[r]`, `X[n]`, `e[n]` | - | arith, call, cmp, loop, operand-i, operand-s | 1586 |
| `117` | - | - | call | 6 |
| `118` | `i[n]` | - | call, operand-i | 13 |
| `119` | `B[S]`, `C[n]` | - | call | 18 |
| `120` | `T[d]`, `i[n]` | - | operand-i | 19 |
| `121` | `t[n]` | - | - | 7 |
| `122` | `s[n]` | - | operand-s | 7 |
| `123` | - | - | call | 6 |
| `124` | `c[n]` | - | call, operand-c | 15 |
| `125` | `D[T]`, `D[q]`, `J[26]`, `J[60]`, `V[d]`, `c[n]` | - | argpack?, arith, call, cmp, loop, operand-c, operand-i, operand-s, reg-file | 185 |
| `126` | `C[n]`, `c[n]`, `s[n]` | `s[…]` | arith, call, operand-c, operand-s | 23 |
| `127` | `c[n]` | - | call, operand-c | 9 |
| `128` | `T[d]` | - | call | 17 |
| `129` | `B[S]`, `i[n]` | - | call, operand-i | 16 |
| `130` | `D[M]`, `J[28]`, `J[30]`, `c[n]`, `i[n]` | - | arith, call, loop, operand-c, operand-i, reg-file | 120 |
| `131` | `C[n]` | - | call | 18 |
| `132` | `X[n]`, `i[n]`, `s[n]` | `i[…]` | arith, call, operand-i, operand-s | 25 |
| `133` | `D[f]`, `U[f]`, `c[n]`, `y[1]`, `y[2]` | - | call, cmp, loop, operand-c, reg-file | 70 |
| `134` | `J[37]`, `c[n]`, `i[n]`, `s[n]` | `s[…]` | call, operand-c, operand-i, operand-s | 32 |
| `135` | - | - | - | 8 |
| `136` | `D[T]`, `i[n]` | - | arith, call, operand-i, reg-file | 28 |
| `137` | `c[n]` | - | call, operand-c | 19 |
| `138` | `T[d]`, `s[n]` | - | call, operand-s | 22 |
| `139` | `J[36]`, `c[n]`, `i[n]`, `t[n]` | `c[…]` | call, operand-c, operand-i | 29 |
| `140` | `i[n]` | `i[…]` | operand-i | 11 |
| `141` | `c[n]`, `s[n]` | - | operand-c, operand-s | 14 |
| `142` | `i[n]`, `s[n]` | `i[…]` | call, operand-i, operand-s | 18 |
| `143` | `C[n]`, `c[n]`, `s[n]` | `C[…]` | call, operand-c, operand-s | 24 |
| `144` | - | - | - | 0 |
| `144` | `c[n]` | - | operand-c | 7 |
| `145` | `c[n]`, `s[n]` | `c[…]` | call, operand-c, operand-s | 19 |
| `146` | - | - | call | 6 |
| `147` | `V[T]` | - | - | 11 |
| `148` | `i[n]` | - | call, operand-i | 19 |
| `149` | - | - | - | 0 |
| `149` | `D[q]`, `f[1]` | - | call, cmp, loop, reg-file | 63 |
| `150` | `B[S]`, `C[n]`, `c[n]` | - | call, operand-c | 23 |
| `151` | `J[31]`, `c[n]`, `s[n]` | `s[…]` | call, operand-c, operand-s | 21 |
| `152` | `C[n]`, `X[n]`, `s[n]` | `X[…]` | call, operand-s | 23 |
| `153` | `B[S]`, `C[n]` | - | call | 16 |
| `154` | `C[n]`, `c[n]` | - | operand-c | 18 |
| `155` | `i[n]` | - | operand-i | 15 |
| `156` | `c[n]` | - | call, operand-c | 17 |
| `157` | - | - | - | 4 |
| `158` | `J[31]`, `i[n]`, `s[n]` | `s[…]` | call, operand-i, operand-s | 23 |
| `159` | - | - | - | 4 |
| `160` | `X[n]`, `i[n]`, `s[n]` | `X[…]` | operand-i, operand-s | 22 |
| `161` | `C[n]`, `D[r]`, `J[61]`, `J[9]`, `N[r]`, `T[8]` | `s[…]` | arith, call, cmp, len, loop, operand-s, reg-file | 220 |
| `162` | `B[S]`, `C[n]`, `s[n]` | - | call, operand-s | 25 |
| `163` | `C[n]`, `c[n]` | `c[…]` | call, operand-c | 15 |
| `164` | `C[n]`, `c[n]`, `s[n]` | `c[…]` | call, operand-c, operand-s | 24 |
| `165` | `c[n]`, `i[n]` | `i[…]` | arith, call, cmp, operand-c, operand-i | 64 |
| `166` | `D[q]`, `i[n]` | - | arith, call, cmp, loop, operand-i, reg-file | 68 |
| `167` | `C[n]`, `c[n]`, `s[n]` | - | arith, call, operand-c, operand-s | 49 |
| `168` | `J[18]`, `i[n]`, `s[n]` | `i[…]` | call, operand-i, operand-s | 21 |
| `169` | - | - | call | 6 |
| `170` | `C[n]`, `J[44]`, `c[n]`, `s[n]` | `s[…]` | call, operand-c, operand-s | 31 |
| `171` | `c[n]`, `i[n]`, `t[n]` | `i[…]` | arith, call, operand-c, operand-i | 23 |
| `172` | `T[d]` | - | call | 13 |
| `173` | `C[n]`, `J[37]`, `c[n]`, `s[n]` | `s[…]` | call, operand-c, operand-s | 29 |
| `174` | `D[q]`, `f[3]` | - | call, cmp, loop, reg-file | 53 |
| `175` | `T[S]`, `i[n]` | - | call, operand-i | 20 |
| `176` | `B[S]`, `T[d]` | - | call | 16 |
| `177` | - | - | - | 0 |
| `177` | `s[n]` | - | operand-s | 7 |
| `178` | `T[d]` | - | - | 7 |
| `179` | - | - | - | 4 |
| `180` | - | - | - | 0 |
| `180` | `s[n]` | - | operand-s | 7 |
| `181` | `c[n]`, `i[n]`, `s[n]` | `c[…]` | call, cmp, operand-c, operand-i, operand-s | 26 |
| `182` | `c[n]` | - | call, operand-c | 17 |
| `183` | `i[n]` | - | operand-i | 7 |
| `184` | `s[n]` | `s[…]` | call, operand-s | 14 |
| `185` | `C[n]`, `c[n]`, `s[n]` | `s[…]` | call, cmp, operand-c, operand-s | 23 |
| `186` | - | - | - | 0 |
| `186` | `s[n]` | - | call, operand-s | 9 |
| `187` | `C[n]`, `c[n]`, `s[n]` | `s[…]` | arith, call, operand-c, operand-s | 23 |
| `188` | `c[n]`, `i[n]`, `s[n]` | `i[…]` | call, operand-c, operand-i, operand-s | 26 |
| `189` | `S[V]` | - | - | 7 |
| `190` | `D[M]`, `s[n]` | - | call, operand-s, reg-file | 23 |
| `191` | `c[n]`, `i[n]`, `s[n]` | `c[…]` | arith, call, operand-c, operand-i, operand-s | 26 |
| `192` | `B[S]`, `i[n]`, `t[n]` | - | operand-i | 21 |
| `193` | `c[n]`, `i[n]`, `s[n]` | `i[…]` | call, operand-c, operand-i, operand-s | 29 |
| `194` | - | - | call, loop | 36 |
| `195` | `t[n]` | - | call | 9 |
| `196` | `T[d]` | - | - | 7 |
| `197`-`255` (58) | `D[T]`, `J[26]`, `c[n]`, `i[n]` | - | argpack?, arith, call, operand-c, operand-i, reg-file | 51 |
| `198` | `c[n]`, `s[n]` | - | call, loop, operand-c, operand-s | 24 |

**Opcodes covered:** 255
**Range:** `0` - `255`
**Gaps in range:** [17]