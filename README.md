# TOMI HUB

A Roblox script hub covering four places, with a single auto-routing loader.

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/warpusTOM/TOMIHUB-private/refs/heads/main/loader.lua"))()
```

The loader reads `game.PlaceId`, picks the matching script, downloads it, and runs
it. Nothing else to configure.

---

## Supported places

| PlaceId | Game | Script |
|---|---|---|
| `126884695634066` | Garden World | `GardenWorld.lua` |
| `124977557560410` | Garden World | `GardenWorld.lua` |
| `129954712878723` | Trading World | `TradingWorld.lua` |
| `108890465381067` | Trading World | `TradingWorld.lua` |
| `97598239454123` | Garden World 2 | `void.lua` |
| `77085202503540` | Garden World 2 | `void.lua` |
| `107778070777162` | Steal An Egg | `TOMIHUB(StealAnEgg).lua` |

An unsupported PlaceId raises `Unsupported game. PlaceId: <id>` instead of
failing silently.

**Steal An Egg note — read this.** The current public build of this game is a
180 KB stub that only shows a "moved to a new loader" panel. The copy here is
the last full build — 744 KB, 689,702-char encrypted pool — recovered from the
repository's own history.

That means it is **not ours and not auditable**. It is Luraph v14.8: every
string is encrypted, so nothing inside can be read, searched for URLs, or
stripped of callbacks. The three readable payloads were cleaned of the original
operator's remote-code fetch, Google Apps Script logger and Discord webhook
(see `docs/SANITISED.md`); this one could not be. Treat it as untrusted — it
may still contact endpoints we cannot see. The only way to make it clean is to
write a TOMI HUB script for that game from scratch.

---

## Layout

```
loader.lua                  auto-routing loader with access gate
access.json                 who is allowed in - edit this to grant or revoke
GardenWorld.lua             recovered, readable Luau
TradingWorld.lua            recovered, readable Luau
void.lua                    recovered, readable Luau
TOMIHUB(StealAnEgg).lua     Luraph v14 VM build
test.lua                    Luraph v14 VM build
docs/
  ACCESS.md                 how the access gate works
  SANITISED.md              remote code and exfil removed from the payloads
  DEOBFUSCATION.md          full recovery report
  luraph-opcode-map.md      recovered opcode table (199 opcodes)
  luraph-keystream.md       recovered key schedule
  luraph-vm-handlers.md     handler classification
  luraph-vm-opcodes.md      opcode-space extraction
  luraph-vm-beautified.lua  the Luraph interpreter, made readable
tools/
  TOMIHUB.unpack.lua        runtime unpacker / rebrander for the VM builds
  luraph_keystream.py       reproduces the key schedule
analysis/                   python toolchain used to recover the above
```

---

## Access

The loader is gated. Nobody runs a script until they clear the check in
`access.json`:

- **owners** — UserIds that skip the key check. Put yourself here first.
- **whitelist** — UserIds let in with no key.
- **keys** — `"KEY": UserId`. The key only works for that one account.

Edit `access.json` to grant or revoke. The loader never needs republishing, and
revocation takes effect on the next load.

Full details, including what this does *not* protect against: **[docs/ACCESS.md](docs/ACCESS.md)**.

---

## Two build types, two different states

`GardenWorld.lua`, `TradingWorld.lua` and `void.lua` are **plain Luau** that had
been wrapped in arithmetic-hidden literals, literal-format noise, and
opaque-predicate control-flow flattening. All three are fully recovered and
readable. The recovery is provably lossless — the `NAME` / `KW` / `STR` token
streams are identical to the originals, and every file parses as valid Lua.

`TOMIHUB(StealAnEgg).lua` and `test.lua` are **Luraph v14** builds. Source is
compiled to a custom bytecode and executed by an embedded VM, so the original
source does not exist inside the file in any recoverable form. What *has* been
recovered is static: the complete opcode map, the key schedule, and the structure
of the encrypted constant pool. Decrypting that pool needs runtime state that is
not stored in the file, so these two ship as-is and are handled at runtime by
`tools/TOMIHUB.unpack.lua`.

Details, proofs and open items: **[docs/DEOBFUSCATION.md](docs/DEOBFUSCATION.md)**.

---

## Note on the private repo

`raw.githubusercontent.com` does not serve private repositories. While this repo
is private, the loader URL above will 404 for anyone fetching it — including from
an executor. Either make the repo public, or host the four payload files somewhere
public and point `BASE_URL` in `loader.lua` at that.
