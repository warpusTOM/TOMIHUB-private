--[[
    TOMI HUB :: Luraph v14 runtime unpacker + rebrander
    ---------------------------------------------------

    The StealAnEgg / test.lua payloads are Luraph v14 VM builds.  The VM never
    recompiles Lua source - it interprets a custom bytecode stream whose
    constant pool ships encrypted as one 122,183-character blob.  That means
    there is no "decrypted source string" sitting in memory to grab.

    What *does* pass through Lua's own string library is the materialised
    output: the decoded pool, and every string constant the VM builds at run
    time.  This harness wraps those functions, keeps the long strings it sees,
    and can rewrite brand names on the fly.

    USAGE - run this BEFORE the protected script:

        loadstring(game:HttpGet("<url>/TOMIHUB.unpack.lua"))()
        loadstring(game:HttpGet("<url>/TOMIHUB(StealAnEgg).lua"))()

        -- afterwards:
        TOMI.report()      -- summary to the console
        TOMI.dump()        -- write everything to TOMI.out

    Nothing here patches by default.  Turn on TOMI.patch only once you have
    confirmed the log looks right - rewriting string.char output changes
    lengths and can desync a VM that indexes by byte offset.
]]

local TOMI = {}
_G.TOMI = TOMI

------------------------------------------------------------------ configuration
TOMI.watch  = true            -- record materialised strings
TOMI.patch  = false           -- live-rewrite brand names (opt in)
TOMI.minlen = 8               -- ignore anything shorter
TOMI.nblobs = 24              -- how many long strings to keep
TOMI.out    = "TOMIHUB_dump.txt"
TOMI.maxlog = 5000            -- cap the log so we do not blow memory

TOMI.log    = {}              -- { [1] = {kind=..., len=..., s=...}, ... }
TOMI.blobs  = {}              -- longest distinct strings, longest first
TOMI.hits   = {}              -- brand name -> count

-- Brand substitutions.  Order matters: longest / most specific first.
TOMI.brand = {
    { "CloverHub(StealAnEgg)", "TOMIHUB(StealAnEgg)" },
    { "__CloverHubLoading",    "__TomiHubLoading" },
    { "__VoidHubUIActive",     "__TomiHubUIActive" },
    { "VoidHub-TW",            "TOMIHUB-TW" },
    { "CloverHub",             "TOMI HUB" },
    { "VoidHub",               "TOMI HUB" },
    { "VOIDHUB",               "TOMI HUB" },
    { "voidhub",               "tomi hub" },
    { "Clover",                "TOMIHUB" },
    { "clover",                "tomihub" },
    { "Ryuun0x",               "TOMIHUB" },
}

------------------------------------------------------------------ originals
local raw = {
    char    = string.char,
    sub     = string.sub,
    byte    = string.byte,
    rep     = string.rep,
    gsub    = string.gsub,
    find    = string.find,
    concat  = table.concat,
    reverse = string.reverse,
}
local rawLoad     = rawget(_G, "loadstring")
local rawLoad2    = rawget(_G, "load")

------------------------------------------------------------------ helpers
local seen = {}

local function note(s)
    if type(s) ~= "string" or #s < TOMI.minlen then return end
    if seen[s] then return end
    seen[s] = true

    local n = #TOMI.blobs
    if n < TOMI.nblobs then
        TOMI.blobs[n + 1] = s
    else
        local wi, wl = 1, #TOMI.blobs[1]
        for i = 2, n do
            if #TOMI.blobs[i] < wl then wi, wl = i, #TOMI.blobs[i] end
        end
        if #s <= wl then return end
        TOMI.blobs[wi] = s
    end
    table.sort(TOMI.blobs, function(a, b) return #a > #b end)
end

local function log(kind, s)
    if not TOMI.watch then return end
    if type(s) ~= "string" or #s < TOMI.minlen then return end
    if #TOMI.log >= TOMI.maxlog then return end
    TOMI.log[#TOMI.log + 1] = { kind = kind, len = #s, s = s }
    note(s)
end

local function rebrand(s)
    if not TOMI.patch or type(s) ~= "string" then return s end
    for _, pair in ipairs(TOMI.brand) do
        local from, to = pair[1], pair[2]
        if raw.find(s, from, 1, true) then
            TOMI.hits[from] = (TOMI.hits[from] or 0) + 1
            s = raw.gsub(s, from, to)
        end
    end
    return s
end

TOMI.rebrand = rebrand

------------------------------------------------------------------ hooks
-- string.char - the pool decoder assembles bytes this way
string.char = function(...)
    local r = raw.char(...)
    if #r >= TOMI.minlen then
        log("string.char", r)
        r = rebrand(r)
    end
    return r
end

-- string.sub - a long first argument means we are looking at the pool / bytecode
string.sub = function(s, i, j)
    if type(s) == "string" and #s >= 1024 then note(s) end
    local r = raw.sub(s, i, j)
    if type(r) == "string" and #r >= TOMI.minlen then
        log("string.sub", r)
        r = rebrand(r)
    end
    return r
end

-- string.byte - the bytecode reader walks the decoded pool through this
string.byte = function(s, ...)
    if type(s) == "string" and #s >= 1024 then note(s) end
    return raw.byte(s, ...)
end

string.rep = function(s, n, sep)
    local r = raw.rep(s, n, sep)
    if type(r) == "string" and #r >= 1024 then
        log("string.rep", r)
        r = rebrand(r)
    end
    return r
end

string.reverse = function(s)
    local r = raw.reverse(s)
    if type(r) == "string" and #r >= TOMI.minlen then
        log("string.reverse", r)
        r = rebrand(r)
    end
    return r
end

table.concat = function(t, sep, i, j)
    local r = raw.concat(t, sep, i, j)
    if type(r) == "string" and #r >= TOMI.minlen then
        log("table.concat", r)
        r = rebrand(r)
    end
    return r
end

-- compile hooks, in case the build ever falls back to source mode
if rawLoad then
    loadstring = function(chunk, name)
        log("loadstring", chunk)
        return rawLoad(rebrand(chunk), name)
    end
    _G.loadstring = loadstring
end
if rawLoad2 then
    load = function(chunk, name, mode, env)
        if type(chunk) == "string" then
            log("load", chunk)
            chunk = rebrand(chunk)
        end
        return rawLoad2(chunk, name, mode, env)
    end
    _G.load = load
end

------------------------------------------------------------------ reporting
function TOMI.report()
    print("[TOMI HUB] captured " .. #TOMI.log .. " string events, "
        .. #TOMI.blobs .. " long blobs")
    for i, b in ipairs(TOMI.blobs) do
        local head = raw.sub(b, 1, 48)
        head = raw.gsub(head, "%c", ".")
        print(string.format("  blob %2d  %8d bytes  %q", i, #b, head))
    end
    local any = false
    for k, v in pairs(TOMI.hits) do
        any = true
        print(string.format("  brand hit  %-24s x%d", k, v))
    end
    if not any and not TOMI.patch then
        print("  (no brand hits - set TOMI.patch = true before loading to rewrite)")
    end
end

function TOMI.dump()
    if not writefile then
        warn("[TOMI HUB] no writefile in this executor - call TOMI.report() instead")
        return
    end
    local out = {}
    out[#out + 1] = "== TOMI HUB dump =="
    out[#out + 1] = "#events: " .. #TOMI.log
    out[#out + 1] = ""

    out[#out + 1] = "== long blobs (longest first) =="
    for i, b in ipairs(TOMI.blobs) do
        out[#out + 1] = string.format("-- blob %d, %d bytes", i, #b)
        out[#out + 1] = b
        out[#out + 1] = ""
    end

    out[#out + 1] = "== event log =="
    for i, e in ipairs(TOMI.log) do
        out[#out + 1] = string.format("[%d] %s len=%d", i, e.kind, e.len)
        out[#out + 1] = e.s
        out[#out + 1] = ""
    end

    -- use the unwrapped concat so the dump does not log itself
    writefile(TOMI.out, raw.concat(out, "\n"))
    print("[TOMI HUB] wrote " .. TOMI.out)
end

return TOMI
