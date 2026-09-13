--[[
    TOMI HUB - loader with access gate
    ----------------------------------

    Reads game.PlaceId, checks access, then downloads and runs the matching script.

    Access is controlled entirely by access.json in this repo:
        owners    - UserIds that skip the key check
        whitelist - UserIds allowed in with no key
        keys      - key -> UserId (0 means "works for anyone")

    Grant or revoke by editing access.json. loader.lua never needs to change.

    Load:
        loadstring(game:HttpGet("<BASE_URL>loader.lua"))()
]]

------------------------------------------------------------------ config
local BASE_URL    = "https://raw.githubusercontent.com/warpusTOM/TOMIHUB-private/refs/heads/main/"
local ACCESS_FILE = "access.json"
local FAIL_CLOSED = true      -- true  = access.json unreachable means nobody gets in
                              -- false = unreachable means the gate opens (easier, weaker)
local CACHE_FILE  = "TOMIHUB.key"
local RETRIES     = 3

------------------------------------------------------------------ routes
local ROUTES = {
    ["126884695634066"] = { name = "Garden World",   file = "GardenWorld.lua" },
    ["124977557560410"] = { name = "Garden World",   file = "GardenWorld.lua" },
    ["129954712878723"] = { name = "Trading World",  file = "TradingWorld.lua" },
    ["108890465381067"] = { name = "Trading World",  file = "TradingWorld.lua" },
    ["97598239454123"]  = { name = "Garden World 2", file = "void.lua" },
    ["77085202503540"]  = { name = "Garden World 2", file = "void.lua" },

    -- Steal An Egg is deliberately absent. The only build of it is a Luraph VM
    -- that shows the original project's "moved to a new loader" panel instead of
    -- running, so shipping it just hands users a redirect. Restore this line once
    -- a TOMI HUB Steal An Egg script exists:
    -- ["107778070777162"] = { name = "Steal An Egg", file = "TOMIHUB(StealAnEgg).lua" },
}

------------------------------------------------------------------ guard
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local env = getgenv()

if env.__TomiHubLoading then
    warn("[TOMI HUB] Loader is already running.")
    return
end

env.__TomiHubLoading = true

------------------------------------------------------------------ services
local Players     = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

------------------------------------------------------------------ fetch
local function fetch(url)
    local lastError

    for attempt = 1, RETRIES do
        local ok, result = pcall(game.HttpGet, game, url)

        if ok and type(result) == "string" and #result > 0 then
            return result
        end

        lastError = result
        task.wait(attempt * 0.5)
    end

    return nil, lastError
end

------------------------------------------------------------------ tiny ui
local function mount()
    local parent = (gethui and gethui()) or LocalPlayer:WaitForChild("PlayerGui")

    local gui = Instance.new("ScreenGui")
    gui.Name = "TOMIHUB_Access"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = parent

    local frame = Instance.new("Frame")
    frame.Size = UDim2.fromOffset(320, 132)
    frame.Position = UDim2.new(0.5, -160, 0.5, -66)
    frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    frame.BorderSizePixel = 0
    frame.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -24, 0, 22)
    title.Position = UDim2.fromOffset(12, 12)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 15
    title.TextColor3 = Color3.fromRGB(240, 240, 245)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Text = "TOMI HUB"
    title.Parent = frame

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, -24, 0, 34)
    status.Position = UDim2.fromOffset(12, 38)
    status.BackgroundTransparency = 1
    status.Font = Enum.Font.Gotham
    status.TextSize = 13
    status.TextWrapped = true
    status.TextColor3 = Color3.fromRGB(165, 165, 180)
    status.TextXAlignment = Enum.TextXAlignment.Left
    status.TextYAlignment = Enum.TextYAlignment.Top
    status.Text = "Checking access..."
    status.Parent = frame

    local box = Instance.new("TextBox")
    box.Size = UDim2.new(1, -24, 0, 32)
    box.Position = UDim2.fromOffset(12, 78)
    box.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
    box.BorderSizePixel = 0
    box.ClearTextOnFocus = false
    box.Font = Enum.Font.Code
    box.TextSize = 13
    box.TextColor3 = Color3.fromRGB(240, 240, 245)
    box.PlaceholderText = "access key"
    box.Text = ""
    box.Visible = false
    box.Parent = frame

    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 6)
    boxCorner.Parent = box

    return {
        gui = gui,
        status = function(text) status.Text = text end,
        ask = function(text)
            status.Text = text
            box.Visible = true
            return box
        end,
        destroy = function() gui:Destroy() end,
    }
end

------------------------------------------------------------------ key cache
local function readCache()
    if not (readfile and isfile) then return nil end

    local ok, value = pcall(function()
        if isfile(CACHE_FILE) then
            return readfile(CACHE_FILE)
        end
        return nil
    end)

    if ok and type(value) == "string" and #value > 0 then
        return (value:gsub("%s+", ""))
    end

    return nil
end

local function writeCache(key)
    if not writefile then return end
    pcall(writefile, CACHE_FILE, key)
end

------------------------------------------------------------------ access check
local function checkAccess(ui)
    local raw = fetch(BASE_URL .. ACCESS_FILE)

    if not raw then
        if FAIL_CLOSED then
            ui.status("Could not reach the access server. Try again shortly.")
            task.wait(4)
            ui.destroy()
            return false
        end
        return true
    end

    local ok, data = pcall(function()
        return HttpService:JSONDecode(raw)
    end)

    if not ok or type(data) ~= "table" then
        if FAIL_CLOSED then
            ui.status("Access file is malformed. Contact the owner.")
            task.wait(4)
            ui.destroy()
            return false
        end
        return true
    end

    local userId = (LocalPlayer and LocalPlayer.UserId) or 0

    for _, id in ipairs(data.owners or {}) do
        if tonumber(id) == userId then
            ui.status("Owner access.")
            task.wait(0.6)
            ui.destroy()
            return true
        end
    end

    for _, id in ipairs(data.whitelist or {}) do
        if tonumber(id) == userId then
            ui.status("Whitelisted.")
            task.wait(0.6)
            ui.destroy()
            return true
        end
    end

    local keys = data.keys or {}

    local function validKey(candidate)
        if type(candidate) ~= "string" or #candidate == 0 then
            return false
        end

        local bound = keys[candidate]

        if bound == nil then
            return false
        end

        local boundId = tonumber(bound) or 0
        return boundId == 0 or boundId == userId
    end

    local cached = readCache()

    if cached and validKey(cached) then
        ui.status("Welcome back.")
        task.wait(0.5)
        ui.destroy()
        return true
    end

    local box = ui.ask(data.notice or "Enter your access key.")
    local deadline = os.clock() + 90

    while os.clock() < deadline do
        if box.Text ~= "" then
            local candidate = (box.Text:gsub("%s+", ""))

            if validKey(candidate) then
                writeCache(candidate)
                ui.status("Access granted.")
                task.wait(0.5)
                ui.destroy()
                return true
            end

            box.Text = ""
            ui.status("That key is not valid for this account.")
        end

        task.wait(0.1)
    end

    ui.destroy()
    return false
end

------------------------------------------------------------------ run
local ok, err = pcall(function()
    local route = ROUTES[tostring(game.PlaceId)]

    if not route then
        error(("Unsupported game. PlaceId: %s"):format(game.PlaceId))
    end

    local ui = mount()

    if not checkAccess(ui) then
        error("Access denied.")
    end

    local source, fetchError = fetch(BASE_URL .. route.file)

    if not source then
        error(("Failed to download %s: %s"):format(route.name, tostring(fetchError)))
    end

    local chunk, compileError = loadstring(source)

    if not chunk then
        error(("Failed to compile %s: %s"):format(route.name, tostring(compileError)))
    end

    chunk()
end)

env.__TomiHubLoading = nil

if not ok then
    warn("[TOMI HUB] " .. tostring(err))
end
