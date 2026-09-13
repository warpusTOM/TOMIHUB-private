# Access control

`loader.lua` gates every script behind `access.json`. You grant and revoke by
editing that one file — the loader itself never changes, and it never needs
re-uploading when your key list changes.

## How a load resolves

```
load
 └─ fetch access.json
     ├─ unreachable  -> FAIL_CLOSED decides (default: deny)
     ├─ UserId in owners?     -> in
     ├─ UserId in whitelist?  -> in
     ├─ cached key valid?     -> in
     └─ prompt for a key
         ├─ key exists and (bound UserId == you, or bound UserId == 0) -> in, key cached
         └─ 90s with no valid key -> denied
```

## access.json

```json
{
  "version": 1,
  "notice": "TOMI HUB requires an access key.",
  "getkey": "",
  "owners": [],
  "whitelist": [],
  "keys": {
    "TOMI-DEMO-0001": 0
  }
}
```

| field | meaning |
|---|---|
| `owners` | UserIds that skip the key check entirely |
| `whitelist` | UserIds let in with no key |
| `keys` | `"KEY": UserId` — the key works only for that account |
| `getkey` | optional URL shown to users who need a key. Empty hides it |
| `notice` | the line shown above the key box |

### Put yourself in first

Find your UserId (any "who am I" script, or the number in your profile URL) and:

```json
"owners": [ 123456789 ]
```

You'll never see the key prompt again.

### Issuing a key

```json
"keys": {
  "TOMI-A1B2-C3D4": 987654321
}
```

That key opens the hub for UserId `987654321` and nobody else. Use `0` instead of
a UserId to make a key work for anyone — useful for a public demo key.

### Revoking

Delete the line. The next load fails; a cached key stops working immediately
because the loader re-checks it against `access.json` on every run.

## What this does and does not do

**Does:** stops anyone you haven't issued a key to. Keys are bound to a UserId, so
a key that leaks still only works for its owner. Revocation is instant and needs
no republishing.

**Does not:** stop someone who reads the loader and the access file. Both are
public, by necessity — an executor cannot authenticate, so anything it fetches is
fetchable by anyone who knows the URL. This is an access gate, not encryption.

If you need the *source* protected rather than the *access* controlled, that's a
separate job: obfuscate the payloads before they go public. Right now
`GardenWorld.lua`, `TradingWorld.lua` and `void.lua` are readable, because we
unwrapped them.

## Configuring the loader

Top of `loader.lua`:

| constant | default | meaning |
|---|---|---|
| `BASE_URL` | this repo | where payloads and `access.json` are fetched from |
| `ACCESS_FILE` | `access.json` | the file above |
| `FAIL_CLOSED` | `true` | `false` lets everyone in if the access file is unreachable. Easier on flaky connections, weaker |
| `CACHE_FILE` | `TOMIHUB.key` | where a validated key is remembered, if the executor has `writefile` |
| `RETRIES` | `3` | fetch attempts before giving up |

`FAIL_CLOSED = true` means a GitHub outage locks everyone out, including you.
Your `owners` entry does not save you — the file itself could not be read. If
that bothers you, set it to `false`.

## Collecting keys

The loader does not generate keys; you do. Make them up (`TOMI-` plus anything
random), or hand out one per person so you can revoke individually. Set `getkey`
to wherever you want to send people who ask.
