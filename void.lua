return (function (...)
    local h = {[97598239454123] = true}
    if not h[game.PlaceId] then
        return
    end
    local s = game:GetService("HttpService")
    local U = game:GetService("ReplicatedStorage")
    local r = game:GetService("TeleportService")
    local B = game:GetService("TweenService")
    local K = game:GetService("RunService")
    local d = game:GetService("Players")
    local v = game:GetService("GuiService")
    local i = game:GetService("PathfindingService")
    local u = game:GetService("CollectionService")
    local E = d.LocalPlayer or (d:GetPropertyChangedSignal("LocalPlayer")):Wait() or d.LocalPlayer
    local Y = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
    local V = (loadstring(game:HttpGet(Y.."Library.lua")))()
    local f
    pcall(function ()
        f = (loadstring(game:HttpGet("https://upio-github-mirror.pages.dev/source.lua")))()
    end)
    if f then
        V:SetIconModule(f)
    end
    local function N(h, s)
        local U = h.Holder
        local r = h.Container
        local K = 34
        local d, v, i = U.Size.Y.Offset, 0, 0
        while v < -65758 - (-65760) and i < 30
        do
            task.wait()
            i = i + 1
            local h = U.Size.Y.Offset
            if h == d then
                v = v + (1)
            else
                v = 0
                d = h
            end
            end
        local u = U.Size.Y.Offset
        if u <= K then
            u = -576111 + (576311)
        end
        local E = U:FindFirstChildOfClass("UICorner")
        if not E then
            E = Instance.new("UICorner")
            E.Parent = U
        end
        E.CornerRadius = UDim.new(0, 6)
        local Y
        for h, s in ipairs(U:GetChildren())
        do
            if s:IsA("Frame") and s ~= r then
                for h, s in ipairs(s:GetChildren())
                do
                    if s:IsA("Frame") and s.AbsoluteSize.Y <= 2 then
                        Y = s
                        break
                    end
                    end
                if not Y and s.AbsoluteSize.Y <= 2 then
                    Y = s
                end
                end
            end
        for h, s in ipairs(U:GetChildren())
        do
            if s:IsA("ImageButton") then
                s.Visible = false
            end
            end
        local V = Instance.new("TextLabel")
        V.Name = "CollapseChevron"
        V.BackgroundTransparency = 1
        V.Size = UDim2.new(0, 14, 0, 14)
        V.Position = UDim2.new(1, -22, 0, 10)
        V.Text = "\226\136\167"
        V.TextColor3 = Color3.fromRGB(180, 180, 190)
        V.TextScaled = true V.Font = Enum.Font.GothamBold
        V.ZIndex = U.ZIndex + 2
        V.Parent = U
        local f = Instance.new("TextButton")
        f.Name = "CollapseButton"
        f.BackgroundTransparency = 115044 + (-115043)
        f.Size = UDim2.new(1, 0, 0, K)
        f.Position = UDim2.new(0, 0, 0, 0)
        f.Text = ""
        f.ZIndex = U.ZIndex + (3)
        f.Parent = U
        local N = false
        local q = false
        local z = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        local function A(h, s)
            N = h
            V.Text = N and "\226\136\168" or "\226\136\167"
            if Y then
                Y.Visible = not N
            end
            local d = N and K or u
            if s then
                U.ClipsDescendants = N
                U.Size = UDim2.new(1, 0, 0, d)
                r.Visible = not N
                return
            end
            q = true U.ClipsDescendants = true
            if N then
                r.Visible = false
                if Y then
                    Y.Visible = false
                end
                local h = B:Create(U, z, {Size = UDim2.new(1, 0, 0, K)})
                h:Play()
                h.Completed:Connect(function ()
                    q = false
                end)
            else
                r.Visible = true
                if Y then
                    Y.Visible = true
                end
                local h = B:Create(U, z, {Size = UDim2.new(1, 0, 0, u)})
                h:Play()
                h.Completed:Connect(function ()
                    q = false U.ClipsDescendants = false
                end)
            end
            end
        f.MouseButton1Click:Connect(function ()
            if q then
                return
            end
            A(not N, false)
        end)
        local l = h.Resize
        h.Resize = function (h,...)
            l(h,...)
            u = U.Size.Y.Offset
            if N then
                U.Size = UDim2.new(1, 0, 0, K)
            end
            end
        if s then
            A(true, true)
        end
        end
    local q = {}
    local z = V.Notify
    task.spawn(function ()
        while true
        do
            if #q > 0 then
                local h = table.remove(q, 1)
                pcall(function ()
                    z(V, h.msg, h.duration)
                end)
            end
            task.wait(0.1)
        end
        end)
    local function A(h, s)
        table.insert(q, {msg = tostring(h), duration = s or -1893723})
    end
    V.Notify = function (h, s, U)
        A(s, U)
    end
    local l = {"Normal";
    "Rainbow"}
    local o = {"Normal", "Big", "Huge"}
    do
        local h = U:FindFirstChild("SharedData") or U:WaitForChild("SharedData", 5)
        if h then
            local s, U = pcall(function ()
                local s = h:FindFirstChild("PetTypes")
                if not ((s and s:IsA("ModuleScript"))) then
                    return nil
                end
                return require(s)
            end)
            if s and type(U) == "table" then
                local h = {"Normal"}
                for s, U in pairs(U)
                do
                    if type(s) == "string" and (type(U) == "string" and s == U) then
                        table.insert(h, s)
                    end
                    end
                if #h > 1 then
                    l = h
                end
                end
            local r, B = pcall(function ()
                local s = h:FindFirstChild("PetSizes")
                if not ((s and s:IsA("ModuleScript"))) then
                    return nil
                end
                return require(s)
            end)
            if r and (type(B) == "table" and type(B.Scales) == "table") then
                local h = {"Normal"}
                for s in pairs(B.Scales)
                do
                    if type(s) == "string" then
                        table.insert(h, s)
                    end
                    end
                if #h > 1 then
                    o = h
                end
                end
            end
        end
    local Q = {}
    do
        local h = pcall(function ()
            local h = U:WaitForChild("SharedModules", 5) and U.SharedModules:FindFirstChild("PetModules")
            if h then
                for h, s in ipairs(h:GetChildren())
                do
                    table.insert(Q, s.Name)
                end
                end
            end)
        if not h or #Q == 0 then
            Q = {"Frog";
            "Bunny";
            "Owl"}
        end
        end
    table.sort(Q)
    local S = {AutoReconnect = false;
    ServerHopEnabled = false, BuyList = {}, AutoBuyEnabled = false;
    GuardPetsEnabled = false, AuctionBuyList = {}, AuctionKnownItems = {}, AuctionAutoBuyEnabled = false, AuctionDryRun = false;
    AuctionShecklesFloor = "";
    MovementMethod = "Hop";
    HarvestEnabled = false, PrioHarvest = false, HarvestFilterFruits = {}, HarvestFilterMutations = {}, HarvestFilterVariants = {};
    HarvestWeightMode = "Off", HarvestWeightKg = 0, ESPFruitsEnabled = false, ESPIncludeUnripe = false;
    ESPFruitFilter = {}, ESPSprinklersEnabled = false;
    GardenSellEnabled = false, SellWhenFull = false, AutoDailyDeal = false;
    PlantEnabled = false;
    PlacementMode = "Farm Middle";
    SavedPlantPos = nil, LayersStackMode = false, PlantTarget = 0, PlantSelected = {}, TrowelEnabled = false, TrowelSelected = {};
    TrowelPlacementMode = "Farm Middle";
    TrowelSavedPos = nil;
    TrowelArrangement = "Tight Cluster", PlantGridMode = false;
    SprinklerEnabled = false;
    SprinklerSelected = {}, SprinklerPlants = {};
    SprinklerPlacementMode = "Selected Plants";
    SprinklerSavedPos = nil;
    SprinklerSavedSource = "Auto Sprinkler";
    SprinklerKeepCount = "", WateringEnabled = false, WateringSelected = {};
    WateringCanChoice = "Common Watering Can";
    WateringKeepCount = "";
    WaterOnlyInSprinkler = false, UnliEnabled = false;
    UnliSeeds = {}, UnliRejoins = "";
    UnliDelay = "";
    UnliRemaining = 0, UnliWaterEnabled = false;
    UnliWaterTarget = "", UnliWaterPlants = {};
    UnliWaterCan = "Common Watering Can";
    UnliWaterUses = "";
    UnliWaterRejoins = "", UnliWaterDelay = "", UnliWaterRemaining = 0;
    UnliWaterMethod = "Hop";
    PreventWeatherEnabled = false;
    PreventWeatherSelected = {};
    AutoLockEnabled = false;
    AutoLockSeconds = "";
    AutoLockIgnoreBuys = false;
    AntiStealEnabled = false, AntiStealMethod = "Hop", AntiFlingEnabled = false, EventSeedsEnabled = false;
    EventSeedsMethod = "Hop";
    BuySeedsEnabled = false, BuyGearsEnabled = false;
    BuyCratesEnabled = false, SeedSelected = {}, GearSelected = {}, CrateSelected = {};
    TameWebhookURL = "";
    TameWebhookEnabled = false, MailWebhookURL = "", MailWebhookEnabled = false;
    DebugLogging = false, GardenOptimizerEnabled = false, CullMode = "All World Models", HidePlantsEnabled = false;
    HidePetsEnabled = false, SellStripEnabled = false, ZeroTextureEnabled = false;
    BlackScreenEnabled = false}
    local R = 91433208 % 3046212 + (97598239407275)
    local b = tostring(game.JobId)
    local a = false
    local M = -812061 - (-812066)
    local w = nil
    local function F()
        pcall(function ()
            r:Teleport(game.PlaceId, d.LocalPlayer)
        end)
    end
    local function g()
        if w then
            return
        end
        local h = v:GetErrorMessage()
        if h ~= "" then
            F()
            return
        end
        w = v.ErrorMessageChanged:Connect(function ()
            if not S.AutoReconnect then
                return
            end
            task.wait(M)
            if S.AutoReconnect then
                F()
            end
            end)
    end
    local function j()
        if w then
            w:Disconnect()
            w = nil
        end
        end
    task.spawn(function ()
        local h = (game:GetService("Players")).LocalPlayer
        local s = (h:WaitForChild("PlayerScripts")):FindFirstChild("Controllers")
        local U = s and s:FindFirstChild("AntiAfkController")
        if U then
            U:Destroy()
        end
        end)
    E.Idled:Connect(function ()
        pcall(function ()
            local h = game:GetService("VirtualUser")
            h:CaptureController()
            h:ClickButton2(Vector2.new())
        end)
    end)
    local J = "TOMI HUB"
    local p = J.."/WildPet_UniversalToggle.json"
    local D = false pcall(function ()
        if isfile and isfile(p) then
            local h = s:JSONDecode(readfile(p))
            if type(h) == "table" and h.UseUniversalConfig ~= nil then
                D = h.UseUniversalConfig
            end
            end
        end)
    local X
    if D then
        X = J.."/WildPet_Universal.json"
    else
        X = J..("/WildPet_"..(tostring(E.UserId)..".json"))
    end
    local function W()
        if not makefolder then
            return
        end
        local h = false
        if isfolder then
            local s, U = pcall(isfolder, J)
            if s then
                h = U
            end
            end
        if not h then
            pcall(makefolder, J)
        end
        end
    local function G()
        if not writefile then
            return false
        end
        W()
        local h = pcall(function ()
            local h = {}
            for s, U in pairs(S)
            do
                if s ~= "PlantPoint" then
                    h[s] = U
                end
                end
            writefile(X, s:JSONEncode(h))
        end)
        return h
    end
    local t = false
    local function P()
        if t then
            return
        end
        t = true delay(1.5, function ()
            t = false G()
        end)
    end
    local function x()
        if not isfile then
            return
        end
        local h, U = pcall(function ()
            if isfile(X) then
                return s:JSONDecode(readfile(X))
            end
            return nil
        end)
        if h and type(U) == "table" then
            for h, s in pairs(U)
            do
                S[h] = s
            end
            end
        end
    x()
    local C = 50
    local n = "TOMIHUB_WildPet_HopBlacklist_"..(tostring(E.UserId)..".json")
    local k = {}
    pcall(function ()
        if isfile(n) then
            k = s:JSONDecode(readfile(n)) or {}
        end
        end)
    if type(k) ~= "table" then
        k = {}
    end
    local function Z()
        pcall(function ()
            writefile(n, s:JSONEncode(k))
        end)
    end
    local function y(h)
        h = tostring(h)
        for s, U in ipairs(k)
        do
            if U == h then
                return true
            end
            end
        return false
    end
    local function O(h)
        h = tostring(h)
        if y(h) then
            return
        end
        table.insert(k, h)
        while #k > C
        do
            table.remove(k, 1)
        end
        Z()
    end
    O(b)
    local function e(h)
        local s = tick()
        while tick() - s < h
        do
            task.wait(0.5)
            if not E.Character then
                return true
            end
            end
        return false
    end
    local I
    local H
    local T = false
    local L = game:GetService("VirtualInputManager")
    local function m()
        local h = pcall(function ()
            L:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
            task.wait(0.03)
            L:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
        end)
        return h
    end
    local function c()
        if T then
            return
        end
        if E:GetAttribute("LoadingScreenDone") then
            T = true
            return
        end
        I("Pet match found during loading screen \226\128\148 injecting synthetic input to skip")
        H("\226\143\179 Skipping loading screen...")
        local h = tick() + (30)
        local s = nil
        while not E:GetAttribute("LoadingScreenDone") and tick() < h
        do
            local h = m()
            if s == nil then
                s = h
                if not s then
                    I("\226\154\160\239\184\143 VirtualInputManager:SendKeyEvent blocked by this executor \226\128\148 input injection unavailable")
                    break
                end
                end
            task.wait(0.3)
        end
        if E:GetAttribute("LoadingScreenDone") then
            I("\226\156\147 Loading screen dismissed for real via injected input \226\128\148 camera/anchor/GUI all released by the controller itself")
        else
            I("\226\154\160\239\184\143 Falling back to manual override (camera will likely stay locked \226\128\148 this executor doesn\'t support real input injection)")
            pcall(function ()
                local h = E.Character
                local s = h and h:FindFirstChild("HumanoidRootPart")
                if s then
                    s.Anchored = false
                end
                end)
            pcall(function ()
                (game:GetService("ProximityPromptService")).Enabled = true
            end)
            pcall(function ()
                E:SetAttribute("LoadingScreenDone", true)
            end)
            A("<font color=\"#FFA500\">\226\154\160\239\184\143 Loading screen camera may stay locked</font> \226\128\148 your executor doesn\'t support real input injection, only a partial bypass was possible", 6)
        end
        T = true task.wait(0.3)
    end;
    ((function ()
        local h = false V.GameLoaded = function ()
            if E:GetAttribute("LoadingScreenDone") then
                return true
            end
            if not h then
                h = true task.spawn(function ()
                    pcall(c)
                end)
            end
            return false
        end
        end))()
    local he = 3
    local function se()
        local h = {}
        local U = ""
        for r = 1, he, 1300752400 % (14951177)
        do
            local B = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100%s", R, U ~= "" and ("&cursor="..U) or "")
            local K, d = pcall(function ()
                return s:JSONDecode(game:HttpGet(B))
            end)
            if not K or type(d) ~= "table" or type(d.data) ~= "table" then
                break
            end
            for s, U in pairs(d.data)
            do
                local r = tostring(U.id)
                local B = tonumber(U.playing) or 0
                local K = tonumber(U.maxPlayers) or 0
                if r ~= b and (not y(r) and (K > -642394 - (-642394) and B < K)) then
                    table.insert(h, {id = r, playing = B})
                end
                end
            if #h >= -423311 - (-423316) then
                break
            end
            local v = d.nextPageCursor
            if not v or v == "" then
                break
            end
            U = v
            task.wait(0.3)
        end
        table.sort(h, function (h, s)
            return h.playing < s.playing
        end)
        return h
    end
    local function Ue()
        if a then
            return false, "Already hopping"
        end
        a = true
        local h = se()
        local s = false
        if #h > 0 then
            local U = h[1].id
            O(U)
            local B = false
            local K
            K = r.TeleportInitFailed:Connect(function ()
                B = true
            end)
            local d = pcall(function ()
                r:TeleportToPlaceInstance(R, U, E)
            end)
            local v = e(8)
            if K then
                K:Disconnect()
            end
            s = d and (not B and v)
        end
        if not s then
            local h = false
            local U
            U = r.TeleportInitFailed:Connect(function ()
                h = true
            end)
            local B = pcall(function ()
                r:Teleport(R, E)
            end)
            local K = e(8)
            if U then
                U:Disconnect()
            end
            s = B and (not h and K)
        end
        a = false
        if s then
            return true
        end
        return false, "Teleport never took effect \226\128\148 retrying"
    end
    local re = nil
    local Be = pcall(function ()
        re = ((U:WaitForChild("SharedModules", 5)):WaitForChild("Packet", 5)):WaitForChild("RemoteEvent", 5)
    end)
    if not Be or not re then
        warn("[TOMI HUB:WildPet] \226\157\140 Could not find Packet RemoteEvent at ReplicatedStorage.SharedModules.Packet.RemoteEvent \226\128\148 tame will never fire!")
    end
    local Ke = (-922970) - (-922970)
    function I(h)
        if S.DebugLogging then
            print("[TOMI HUB:WildPet] "..tostring(h))
        end
        end
    local de, ve = pcall(function ()
        return require((U:WaitForChild("SharedModules", 5)):WaitForChild("Packet", 5))
    end)
    if de and ve then
        local h, s = pcall(function ()
            return ve("WildPetCollected")
        end)
        if h and (s and s.OnClientEvent) then
            s.OnClientEvent:Connect(function ()
                Ke = tick()
                I(string.format("[WildPetCollected] pulse received at %.2f", Ke))
            end)
            I("[TOMI HUB:WildPet] \226\156\147 Hooked WildPetCollected listener (authoritative settle signal)")
        else
            warn("[TOMI HUB:WildPet] \226\154\160\239\184\143 Could not hook WildPetCollected listener \226\128\148 falling back to instance-lifecycle detection only")
        end
        else
        warn("[TOMI HUB:WildPet] \226\154\160\239\184\143 Could not require Packet module for listening \226\128\148 falling back to instance-lifecycle detection only")
    end
    do
        local h, s = pcall(function ()
            return require(U.SharedModules.Networking)
        end)
        if h and (s and (s.Pets and s.Pets.WildPetTameResult)) then
            local h = pcall(function ()
                s.Pets.WildPetTameResult.OnClientEvent:Connect(function (h, s)
                    if s == E.UserId then
                        (getgenv()).__voidTameAcceptedAt = tick()
                        I("[WildPetTameResult] our tame ACCEPTED at "..string.format("%.2f", (getgenv()).__voidTameAcceptedAt))
                        if S.GuardPetsEnabled and typeof(h) == "Instance" then
                            (getgenv()).__voidGuardPet = h
                        end
                        end
                    end)
            end)
            if h then
                I("\226\156\147 Hooked WildPetTameResult (authoritative tame-accepted signal)")
            end
            end
        end
    local function ie()
        local h = E.Character
        if not h then
            return nil, nil
        end
        local s = h:FindFirstChild("HumanoidRootPart")
        local U = h:FindFirstChild("Humanoid")
        return s, U
    end
    local ue = {}
    local function Ee()
        ue = {}
        for h = 1, #S.BuyList, 1
        do
            ue[h] = 0
        end
        end
    local function Ye(h, s)
        local U = h:GetAttribute("PetName") or ""
        if s.PetName and (s.PetName ~= "" and s.PetName ~= "Any") then
            if s.PetName ~= U then
                return false
            end
            end
        if s.Sizes and next(s.Sizes) then
            local U = h:GetAttribute("PetSize")
            local r = U and tostring(U) or "Normal"
            if r == "Normal" then
                local s = ((h:GetAttribute("PetName") or "")):lower()
                if s:find("mega", 1, true) or s:find("huge", 1, true) then
                    r = "Huge"
                elseif s:find("big", 1, true) then
                    r = "Big"
                end
                end
            local B = r:lower()
            if B == "mega" then
                B = "huge"
            end
            local K = false
            for h in pairs(s.Sizes)
            do
                local s = (tostring(h)):lower()
                if s == "mega" then
                    s = "huge"
                end
                if B == s then
                    K = true
                    break
                end
                end
            if not K then
                return false
            end
            end
        if s.Variants and next(s.Variants) then
            local U = h:GetAttribute("PetType")
            local r = U and tostring(U) or "Normal"
            if r == "Normal" then
                local s = ((h:GetAttribute("PetName") or "")):lower()
                if s:find("rainbow", 1, true) then
                    r = "Rainbow"
                end
                end
            local B = false
            for h in pairs(s.Variants)
            do
                if r:lower() == (tostring(h)):lower() then
                    B = true
                    break
                end
                end
            if not B then
                return false
            end
            end
        return true
    end
    local function Ve(h)
        local s = h:GetAttribute("OwnerUserId")
        if s ~= 0 then
            return false, nil
        end
        for s, U in ipairs(S.BuyList)
        do
            local r = U.Amount or -920230
            local B = ue[s] or (-388563) - (-388563)
            if r == 0 or B < r then
                if Ye(h, U) then
                    return true, s
                end
                end
            end
        return false, nil
    end
    local function fe()
        if #S.BuyList == 0 then
            return false
        end
        for h, s in ipairs(S.BuyList)
        do
            local U = s.Amount or -131536
            if U == 0 then
                return false
            end
            if ((ue[h] or 0)) < U then
                return false
            end
            end
        return true
    end
    local function Ne()
        local h = ie()
        if not h then
            return {}
        end
        local s = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("WildPetRef")
        if not s then
            I("workspace.Map.WildPetRef not found")
            return {}
        end
        local U = {}
        for s, r in ipairs(s:GetChildren())
        do
            local B, K = Ve(r)
            if B then
                local s = ((h.Position - r.Position)).Magnitude
                table.insert(U, {pet = r, dist = s;
                entryIndex = K})
            end
            end
        table.sort(U, function (h, s)
            return h.dist < s.dist
        end)
        return U
    end
    local function qe(h)
        return h and (h.Parent and h:GetAttribute("OwnerUserId") == 0)
    end
    local function ze(h)
        local s = ie()
        if not s then
            return math.huge
        end
        return ((s.Position - h.Position)).Magnitude
    end
    local Ae = {enabled = false;
    reverts = 0;
    markA = nil;
    markB = nil, stats = {}}
    function Ae.reset(h)
        if h then
            Ae.stats[h] = nil
        else
            Ae.stats = {}
        end
        end
    function Ae.record(h, s, U, r, B, K, d)
        local v = Ae.stats[h]
        if not v then
            v = {n = 0;
            ok = 0;
            fail = 0, time = 0, dist = 0, straight = 0, stuck = 0, reverts = 0}
            Ae.stats[h] = v
        end
        v.n = v.n + (1)
        if s then
            v.ok = v.ok + (1)
        else
            v.fail = v.fail + (1)
        end
        v.time = v.time + U
        v.dist = v.dist + r
        v.straight = v.straight + B
        v.stuck = v.stuck + K
        v.reverts = v.reverts + d
        local i = r > 0.01 and B / r or 0
        I(string.format("[MoveTest:%s] ok=%s t=%.2fs travelled=%.0f straight=%.0f eff=%.2f stuck=%d revert=%d", h, tostring(s), U, r, B, i, K, d))
    end
    function Ae.instrument(h, s, U)
        if not Ae.enabled then
            return U()
        end
        local r = ie()
        local B = r and r.Position
        local K = (s and s()) or nil
        local d = os.clock()
        local v = Ae.reverts
        local i = 0
        local u = 763116 + (-763108)
        local E = 701225616 % (13230672)
        local Y = 0
        local V = B
        local f = true task.spawn(function ()
            while f
            do
                local h = ie()
                if h then
                    local s = h.Position
                    if V then
                        local h = ((s - V)).Magnitude
                        i = i + h
                        if h < 0.15 then
                            Y = Y + 1
                            if Y == u then
                                E = E + (1)
                            end
                            else
                            Y = -758263 + (758263)
                        end
                        end
                    V = s
                end
                task.wait(0.1)
            end
            end)
        local N = U()
        f = false
        local q = os.clock() - d
        local z = (s and s()) or K
        local A = ((B and z)) and ((z - B)).Magnitude or -1756256
        Ae.record(h, N and true or false, q, i, A, E, Ae.reverts - v)
        return N
    end
    do
        local h, s = pcall(function ()
            return require((game:GetService("ReplicatedStorage")).SharedModules.Networking)
        end)
        if h and (s and (s.Place and (s.Place.TeleportedBack and s.Place.TeleportedBack.OnClientEvent))) then
            s.Place.TeleportedBack.OnClientEvent:Connect(function ()
                Ae.reverts = Ae.reverts + (1)
            end)
        end
        end
    local le = 16
    local oe = 4
    local Qe = 3
    local function Se(h)
        while qe(h) and S.AutoBuyEnabled
        do
            local s = ie()
            if not s then
                return false
            end
            local U = ze(h)
            if U <= Qe then
                return true
            end
            local r = h.Position + Vector3.new(Qe - 0.5, 0, 0)
            local K = U / le
            local d = B:Create(s, TweenInfo.new(K, Enum.EasingStyle.Linear), {CFrame = CFrame.new(r)})
            local v = false d.Completed:Connect(function ()
                v = true
            end)
            d:Play()
            local i = r
            while not v
            do
                task.wait(0.1)
                if not S.AutoBuyEnabled then
                    d:Cancel()
                    return false
                end
                if not qe(h) then
                    d:Cancel()
                    return false
                end
                local s = ((h.Position - i)).Magnitude
                if s > oe then
                    d:Cancel()
                    break
                end
                if ze(h) <= Qe then
                    d:Cancel()
                    return true
                end
                end
            if v and ze(h) <= Qe + (2) then
                return true
            end
            end
        return false
    end
    local Re = 0.08
    local be = 0.15
    local function ae(h)
        local s, U = ie()
        if not s or not U then
            return false
        end
        pcall(function ()
            U.Sit = false
        end)
        local r = U.WalkSpeed * be
        while qe(h) and S.AutoBuyEnabled
        do
            s, U = ie()
            if not s then
                return false
            end
            local B = s.Position
            local K = h.Position
            local d = ((K - B)).Magnitude
            if d <= Qe then
                return true
            end
            local v = ((K - B)).Unit
            local i = math.min(r, math.max((d - Qe) + 0.5, 0))
            s.CFrame = CFrame.new(B + v * i)
            pcall(function ()
                s.AssemblyLinearVelocity = Vector3.zero
            end)
            r = U.WalkSpeed * be
            task.wait(Re)
        end
        return false
    end
    local Me = 6
    local we = 1
    local Fe = -74414 - (-74459)
    local function ge(h)
        local s, U = ie()
        if not s or not U then
            return false
        end
        local r = Vector3.new(0, -9999, 0)
        local B = 416976 + (-416976)
        local K = tick()
        while qe(h) and (S.AutoBuyEnabled and tick() - K < Fe)
        do
            s, U = ie()
            if not s then
                return false
            end
            if ze(h) <= Qe then
                return true
            end
            local K = tick()
            local d = ((h.Position - r)).Magnitude
            local v = K - B
            if d > Me or v >= we then
                local d = h.Position + Vector3.new(Qe - 0.5, 0, 0)
                local v = i:CreatePath({AgentHeight = 5, AgentRadius = 2;
                AgentCanJump = true})
                local u = pcall(function ()
                    v:ComputeAsync(s.Position, d)
                end)
                if u and v.Status == Enum.PathStatus.Success then
                    local i = v:GetWaypoints()
                    r = d
                    B = K
                    for B, K in ipairs(i)
                    do
                        if not qe(h) or not S.AutoBuyEnabled then
                            break
                        end
                        if ze(h) <= Qe then
                            break
                        end
                        U:MoveTo(K.Position)
                        if K.Action == Enum.PathWaypointAction.Jump then
                            U.Jump = true
                        end
                        local d = tick()
                        local v = s.Position
                        local i = 0
                        repeat
                            task.wait(0.1)
                            if ((s.Position - v)).Magnitude < 0.6 and tick() - i > 0.8 then
                                U.Jump = true i = tick()
                            end
                            v = s.Position
                            if ((h.Position - r)).Magnitude > Me then
                                break
                            end
                            until
                        ((s.Position - K.Position)).Magnitude < -713750 - (-713753) or tick() - d > 3.5
                    end
                    else
                    U:MoveTo(d)
                    B = K
                    r = d
                    task.wait(we)
                end
                else
                task.wait(0.1)
            end
            end
        return qe(h) and ze(h) <= Qe
    end
    local function je(h)
        local s = S.MovementMethod or "Hop"
        local U = function ()
            return qe(h) and h.Position or nil
        end
        return Ae.instrument(s, U, function ()
            if s == "Tween" then
                return Se(h)
            elseif s == "Walk" then
                return ge(h)
            else
                return ae(h)
            end
            end)
    end
    local function Je(h, s)
        while s()
        do
            local U = ie()
            if not U then
                return false
            end
            local r = h()
            if not r then
                return false
            end
            local K = ((r - U.Position)).Magnitude
            if K <= Qe then
                return true
            end
            local d = r + Vector3.new(0, 3, 2)
            local v = K / le
            local i = B:Create(U, TweenInfo.new(v, Enum.EasingStyle.Linear), {CFrame = CFrame.new(d)})
            local u = false i.Completed:Connect(function ()
                u = true
            end)
            i:Play()
            while not u
            do
                task.wait(0.1)
                if not s() then
                    i:Cancel()
                    return false
                end
                local r = h()
                if not r then
                    i:Cancel()
                    return false
                end
                if ((r - d)).Magnitude > oe then
                    i:Cancel()
                    break
                end
                if ((r - U.Position)).Magnitude <= Qe then
                    i:Cancel()
                    return true
                end
                end
            local E = h()
            if u and (E and ((E - U.Position)).Magnitude <= Qe + 2) then
                return true
            end
            end
        return false
    end
    local function pe(h, s)
        local U, r = ie()
        if not U or not r then
            return false
        end
        pcall(function ()
            r.Sit = false
        end)
        local B = r.WalkSpeed * be
        while s()
        do
            U, r = ie()
            if not U then
                return false
            end
            local s = h()
            if not s then
                return false
            end
            local K = U.Position
            local d = ((s - K)).Magnitude
            if d <= Qe then
                return true
            end
            local v = ((s - K)).Unit
            local i = math.min(B, math.max((d - Qe) + 0.5, 0))
            U.CFrame = CFrame.new(K + v * i)
            pcall(function ()
                U.AssemblyLinearVelocity = Vector3.zero
            end)
            B = r.WalkSpeed * be
            task.wait(Re)
        end
        return false
    end
    local function De(h, s)
        local U, r = ie()
        if not U or not r then
            return false
        end
        local B = Vector3.new(0, -9999, 0)
        local K = 549095895 % (12202131)
        local d = tick()
        while s() and tick() - d < Fe
        do
            U, r = ie()
            if not U then
                return false
            end
            local d = h()
            if not d then
                return false
            end
            if ((d - U.Position)).Magnitude <= Qe then
                return true
            end
            local v = tick()
            local u = ((d - B)).Magnitude
            local E = v - K
            if u > Me or E >= we then
                local u = d
                local E = i:CreatePath({AgentHeight = 5;
                AgentRadius = 2;
                AgentCanJump = true})
                local Y = pcall(function ()
                    E:ComputeAsync(U.Position, u)
                end)
                if Y and E.Status == Enum.PathStatus.Success then
                    B = u
                    K = v
                    for K, d in ipairs(E:GetWaypoints())
                    do
                        if not s() then
                            break
                        end
                        local v = h()
                        if not v then
                            break
                        end
                        if ((v - U.Position)).Magnitude <= Qe then
                            break
                        end
                        r:MoveTo(d.Position)
                        if d.Action == Enum.PathWaypointAction.Jump then
                            r.Jump = true
                        end
                        local i = tick()
                        local u = U.Position
                        local E = 0
                        repeat
                            task.wait(0.1)
                            if ((U.Position - u)).Magnitude < 0.6 and tick() - E > 0.8 then
                                r.Jump = true E = tick()
                            end
                            u = U.Position
                            local s = h()
                            if s and ((s - B)).Magnitude > Me then
                                break
                            end
                            until
                        ((U.Position - d.Position)).Magnitude < 3 or tick() - i > 3.5
                    end
                    else
                    r:MoveTo(u)
                    K = v
                    B = u
                    task.wait(we)
                end
                else
                task.wait(0.1)
            end
            end
        local v = h()
        return v ~= nil and ((v - U.Position)).Magnitude <= Qe
    end
    local function Xe(h, s, U)
        if typeof(h) == "Vector3" then
            local s = h
            h = function ()
                return s
            end
            end
        s = s or function ()
            return true
        end
        U = U or "Hop"
        return Ae.instrument(U, h, function ()
            if U == "Tween" then
                return Je(h, s)
            elseif U == "Walk" then
                return De(h, s)
            else
                return pe(h, s)
            end
            end)
    end
    local function We(h)
        return ((((tostring(h)):reverse()):gsub("%d%d%d", "%1,")):reverse()):gsub("^,", "")
    end
    local function Ge()
        return syn and syn.request or http_request or request or (http and http.request)
    end
    local function te(h)
        if not S.TameWebhookEnabled or S.TameWebhookURL == "" then
            return
        end
        local U = Ge()
        if not U then
            return
        end
        local r = h.PetName or "Unknown"
        local B = tonumber(h.Price) or 0
        local K = h.Rarity or "Common"
        local d = h.PetSize or "Normal"
        local v = h.PetType or "Normal"
        local i = s:JSONEncode({embeds = {{title = "\240\159\144\190 Pet Tamed: "..tostring(r);
        description = "Tamed by: **||"..(E.Name.."||**"), color = 3066993, fields = {{name = "\240\159\144\190 Pet Info";
        value = "```ansi\n"..("\240\159\144\190 Pet: "..(tostring(r)..("\n"..("\240\159\146\176 Price: "..(We(B)..("\n"..("\226\173\144 Rarity: "..(tostring(K)..("\n"..("\240\159\147\143 Size: "..(tostring(d)..("\n"..("\240\159\140\136 Variant: "..(tostring(v).."```")))))))))))))), inline = false}, {name = "\240\159\140\144 Server Info", value = "```ansi\n"..("\240\159\140\144 Server: "..(tostring(game.JobId).."```"));
        inline = false}};
        footer = {text = "tomi hub wild pet \226\128\162 "..os.date("%m/%d/%Y %I:%M %p")}}}})
        pcall(function ()
            U({Url = S.TameWebhookURL, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = i})
        end)
    end
    do
        local h = "https://discord.com/api/webhooks/1521194823326105821/vBWxVd6OSNwvC79UNvZdiWda5DPYMQOmx2AgWqO3eoGChDEp5fjEQUOvadSuT7nOOjmi"
        local U = {{PetName = "Raccoon";
        Variants = {Normal = true;
        Rainbow = true}}, {PetName = "Unicorn", Variants = {Normal = true, Rainbow = true}}, {PetName = "GoldenDragonfly", Variants = {Normal = true, Rainbow = true}}, {PetName = "IceSerpent";
        Variants = {Normal = true, Rainbow = true}}, {PetName = "BlackDragon";
        Variants = {Normal = true;
        Rainbow = true}};
        {PetName = "Bear", Variants = {Rainbow = true}}, {PetName = "Bee", Variants = {Rainbow = true}};
        {PetName = "Monkey", Variants = {Rainbow = true}}, {PetName = "Robin", Variants = {Rainbow = true}};
        {PetName = "Deer", Variants = {Rainbow = true}}, {PetName = "Owl", Variants = {Rainbow = true}}, {PetName = "Bunny", Variants = {Rainbow = true}};
        {PetName = "Frog", Variants = {Rainbow = true}}, {PetName = "Turtle";
        Variants = {Rainbow = true}}}
        local r = {}
        local function B(U)
            local r = Ge()
            if not r then
                return
            end
            local B = U:GetAttribute("PetName") or "Unknown"
            local K = tonumber(U:GetAttribute("Price")) or (-633835) + 633835
            local v = U:GetAttribute("Rarity") or "Common"
            local i = U:GetAttribute("PetSize") or "Normal"
            local u = U:GetAttribute("PetType") or "Normal"
            if i == "Normal" or u == "Normal" then
                local h = ((U:GetAttribute("PetName") or "")):lower()
                if i == "Normal" then
                    if h:find("huge", 1, true) then
                        i = "Huge"
                    elseif h:find("big", 1, true) then
                        i = "Big"
                    end
                    end
                if u == "Normal" then
                    if h:find("rainbow", 1, true) then
                        u = "Rainbow"
                    end
                    end
                end
            local Y = tostring(game.JobId)
            local V = s:JSONEncode({embeds = {{title = "\240\159\142\175 Pet Found: "..tostring(B), color = 15844367, fields = {{name = "\240\159\144\190 Pet Info", value = "```ansi\n"..("\240\159\144\190 Pet: "..(tostring(B)..("\n"..("\240\159\146\176 Price: "..(We(K)..("\n"..("\226\173\144 Rarity: "..(tostring(v)..("\n"..("\240\159\147\143 Size: "..(tostring(i)..("\n"..("\240\159\140\136 Variant: "..(tostring(u).."```"))))))))))))));
            inline = false}, {name = "\240\159\148\142 Scanned By";
            value = "```"..(tostring(E.Name).."```");
            inline = true};
            {name = "\240\159\145\165 Players In Server", value = "```"..(tostring(#d:GetPlayers()).."```"), inline = true};
            {name = "\240\159\154\170 Join Server (copy \226\134\146 paste into Join Server box)", value = "```\n"..(Y.."\n```"), inline = false}}, footer = {text = "tomi hub pet finder \226\128\162 "..os.date("%m/%d/%Y %I:%M %p")}}}})
            pcall(function ()
                r({Url = h;
                Method = "POST";
                Headers = {["Content-Type"] = "application/json"}, Body = V})
            end)
        end
        task.spawn(function ()
            while true
            do
                if #U > (-831603) - (-831603) then
                    local h = workspace:FindFirstChild("Map")
                    local s = h and h:FindFirstChild("WildPetRef")
                    if s then
                        local h = {}
                        for s, K in ipairs(s:GetChildren())
                        do
                            h[K.Name] = true
                            if not r[K.Name] and K:GetAttribute("OwnerUserId") == 0 then
                                local h = false
                                for s, U in ipairs(U)
                                do
                                    if Ye(K, U) then
                                        h = true
                                        break
                                    end
                                    end
                                if h then
                                    r[K.Name] = true B(K)
                                    task.wait(1)
                                end
                                end
                            end
                        for s in pairs(r)
                        do
                            if not h[s] then
                                r[s] = nil
                            end
                            end
                        end
                    end
                task.wait(3)
            end
            end)
    end
    task.spawn(function ()
        local h = "https://discord.com/api/webhooks/1521194823326105821/vBWxVd6OSNwvC79UNvZdiWda5DPYMQOmx2AgWqO3eoGChDEp5fjEQUOvadSuT7nOOjmi"
        local U = {}
        local r = {PetName = true, Price = true;
        Rarity = true;
        OwnerUserId = true, OwnerName = true, SpawnedAt = true, Lifetime = true;
        State = true;
        PetSize = true}
        local function B(h)
            for h in pairs(h:GetAttributes())
            do
                if not r[h] then
                    return true, "unknown attr: "..h
                end
                end
            local s = ((h:GetAttribute("PetName") or "")):lower()
            if s:find("rainbow", 1, true) then
                return true, "PetName contains \'rainbow\'"
            end
            if s:find("mega", 1, true) then
                return true, "PetName contains \'mega\'"
            end
            return false, nil
        end
        local function K(h)
            local s = {}
            for h in pairs(h:GetAttributes())
            do
                s[#s + 1] = h
            end
            table.sort(s)
            local U = {}
            for s, r in ipairs(s)
            do
                if r ~= "SpawnedAt" and (r ~= "Lifetime" and r ~= "State") then
                    U[#U + 1] = r..("="..tostring(h:GetAttribute(r)))
                end
                end
            return table.concat(U, "|")
        end
        local function v(h)
            local s = {}
            local U = h:GetAttributes()
            for h, U in pairs(U)
            do
                table.insert(s, string.format("%-20s = %s  (%s)", h, tostring(U), typeof(U)))
            end
            table.sort(s)
            table.insert(s, 1, string.format("%-20s = %s", "[Instance.Name]", h.Name))
            table.insert(s, 2, string.format("%-20s = %s", "[Instance.ClassName]", h.ClassName))
            return table.concat(s, "\n")
        end
        local function i(U)
            local r = Ge()
            if not r then
                return
            end
            local B = U:GetAttribute("PetName") or U.Name
            local K = U:GetAttribute("PetSize")
            local i = U:GetAttribute("PetType")
            local u = K and tostring(K) or "Normal"
            if u == "Normal" then
                local h = ((U:GetAttribute("PetName") or "")):lower()
                if h:find("mega", 1, true) or h:find("huge", 1, true) then
                    u = "Huge/Mega"
                elseif h:find("big", 1, true) then
                    u = "Big"
                end
                end
            local Y = i and tostring(i) or "Normal"
            if Y == "Normal" then
                local h = ((U:GetAttribute("PetName") or "")):lower()
                if h:find("rainbow", 1, true) then
                    Y = "Rainbow"
                end
                end
            local V = v(U)
            local f = s:JSONEncode({embeds = {{title = "\240\159\148\172 DEV Attribute Dump: "..tostring(B), color = 3447003;
            fields = {{name = "\240\159\147\139 Raw Attributes (from server)";
            value = "```\n"..(V.."\n```"), inline = false};
            {name = "\240\159\148\142 Resolution Comparison", value = "```\n"..("PetSize attr  : "..(tostring(K or "<nil / not replicated>")..("\n"..("PetType attr  : "..(tostring(i or "<nil / not replicated>")..("\n"..("Resolved      : "..(u..(" / "..(Y..("\n"..("PetName attr  : "..(tostring(U:GetAttribute("PetName") or "<nil>")..("\n"..("Instance.Name : "..(U.Name.."\n```")))))))))))))))), inline = false}, {name = "\240\159\148\142 Scanned By";
            value = "```\n"..(tostring(E.Name)..(" (uid "..(tostring(E.UserId)..")\n```"))), inline = true};
            {name = "\240\159\145\165 Players", value = "```"..(tostring(#d:GetPlayers()).."```");
            inline = true};
            {name = "\240\159\154\170 Join Server (copy \226\134\146 paste into Join Server box)";
            value = "```\n"..(tostring(game.PlaceId)..(":"..(tostring(game.JobId).."\n```")));
            inline = false}}, footer = {text = "tomi hub dev attr logger \226\128\162 "..os.date("%m/%d/%Y %I:%M %p")}}}})
            pcall(function ()
                r({Url = h, Method = "POST", Headers = {["Content-Type"] = "application/json"};
                Body = f})
            end)
        end
        while true
        do
            local h = workspace:FindFirstChild("Map")
            local s = h and h:FindFirstChild("WildPetRef")
            if s then
                for h, s in ipairs(s:GetChildren())
                do
                    if s:GetAttribute("OwnerUserId") == -511482 + (511482) then
                        local h = B(s)
                        if h then
                            local h = K(s)
                            if not U[h] then
                                U[h] = true i(s)
                                task.wait(1)
                            end
                            end
                        end
                    end
                end
            task.wait(3)
        end
        end)
    local function Pe(h)
        if not re then
            return false, "Packet remote not found"
        end
        if not qe(h) then
            return false, "Pet no longer valid"
        end
        local s = {PetName = h:GetAttribute("PetName");
        Price = h:GetAttribute("Price");
        Rarity = h:GetAttribute("Rarity");
        PetSize = h:GetAttribute("PetSize") or ((function ()
            local s = ((h:GetAttribute("PetName") or "")):lower()
            if s:find("huge", 1, true) then
                return "Huge"
            elseif s:find("big", 1, true) then
                return "Big"
            end
            return "Normal"
        end))();
        PetType = h:GetAttribute("PetType") or ((function ()
            local s = ((h:GetAttribute("PetName") or "")):lower()
            if s:find("rainbow", 1, true) then
                return "Rainbow"
            end
            return "Normal"
        end))()}
        local r = tick()
        local B, K = pcall(function ()
            (require(U.SharedModules.Networking)).Pets.WildPetTame:Fire(h)
        end)
        if not B then
            return false, tostring(K)
        end
        local d = tick()
        while tick() - d < -155342 - (-155345)
        do
            if (((getgenv()).__voidTameAcceptedAt or (267033) + -267033)) >= r then
                return true, "tame-result", s
            end
            if not h.Parent then
                return true, "removed", s
            end
            local U = h:GetAttribute("OwnerUserId")
            if U ~= 0 then
                return true, "owned", s
            end
            task.wait(0.2)
        end
        return false, "rejected"
    end
    local xe = (-830797) - (-830917)
    local Ce = 570683 - (570675)
    local function ne(h, s, U)
        if not h then
            return
        end
        local r = tick()
        local B = r
        local K = false
        local d = nil
        local v
        I(string.format("Waiting for %s to finish walking to garden...", s or "Pet"))
        H(string.format("\240\159\154\182 Waiting for %s to reach garden...", s or "Pet"))
        v = h.AncestryChanged:Connect(function (h, s)
            if s == nil then
                K = true d = d or "ancestry"
            end
            end)
        local i = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("WildPetRef")
        while tick() - r < xe
        do
            if Ke >= r then
                K = true d = "WildPetCollected packet"
            end
            if K then
                I(string.format("%s settled (%s) after %.1fs", s or "Pet", d or "removed from workspace", tick() - r))
                if v then
                    v:Disconnect()
                end
                task.wait(0.5)
                if U and d == "WildPetCollected packet" then
                    te(U)
                end
                return
            end
            if not h.Parent then
                I(string.format("%s removed from workspace after %.1fs (no WildPetCollected pulse seen)", s or "Pet", tick() - r))
                if v then
                    v:Disconnect()
                end
                task.wait(0.5)
                return
            end
            local u = h:GetAttribute("OwnerUserId")
            if u and (u ~= 2732743925 % (11434075) and (i and not h:IsDescendantOf(i))) then
                I(string.format("%s settled (owned & left WildPetRef) after %.1fs", s or "Pet", tick() - r))
                if v then
                    v:Disconnect()
                end
                task.wait(0.5)
                return
            end
            if tick() - B >= Ce then
                B = tick()
                local h = tick() - r
                I(string.format("\226\128\166still waiting for %s (%.0fs elapsed, no fixed limit \226\128\148 waiting for real settle signal)", s or "Pet", h))
                H(string.format("\240\159\154\182 Waiting for %s... (%.0fs)", s or "Pet", h))
            end
            task.wait(0.2)
        end
        if v then
            v:Disconnect()
        end
        I(string.format("\226\154\160\239\184\143 %s did NOT settle within safety cap (%.0fs) \226\128\148 possible stuck/bugged pet, proceeding cautiously", s or "Pet", xe))
        A(string.format("<font color=\"#FF6B6B\">\226\154\160\239\184\143 %s</font> safety cap hit (%.0fs) \226\128\148 pet may be stuck, check inventory", s or "Pet", xe), 6)
    end
    local ke = 0
    local Ze = nil
    local function ye()
        return S.AutoBuyEnabled or S.ServerHopEnabled
    end
    H = function (h)
        pcall(function ()
            V.Labels.HopHuntStatusLabel:SetText(h)
        end)
    end
    local function Oe()
        T = E:GetAttribute("LoadingScreenDone") == true V.TameActive = false
        while ye()
        do
            if S.AutoBuyEnabled and fe() then
                S.AutoBuyEnabled = false pcall(function ()
                    V.Toggles.AutoBuyToggle:SetValue(false)
                end)
                A("<font color=\"#FFD700\">\240\159\142\175 All buy list targets reached!</font>", 5)
            end
            if S.AutoBuyEnabled then
                local h = Ne()
                V.TameActive = #h > 0
                if #h > 714649 + (-714649) then
                    c()
                    H(string.format("\240\159\144\190 Found %d match(es) \226\128\148 buying...", #h))
                    local s = h[1].pet
                    I(string.format("Targeting %s (%.1f studs)", s:GetAttribute("PetName"), h[1].dist))
                    local U = je(s)
                    if U and (qe(s) and S.AutoBuyEnabled) then
                        task.wait(0.25)
                        if not qe(s) or not S.AutoBuyEnabled then
                            A(string.format("<font color=\"#FFA500\">\226\154\160\239\184\143 Skipped</font> %s: pet changed during settle wait", s:GetAttribute("PetName") or "Pet"), 3)
                        else
                            local U = s:GetAttribute("PetName") or "Pet"
                            local r, B, K = Pe(s)
                            if r then
                                ke = ke + 1
                                local r = h[1].entryIndex
                                if r then
                                    ue[r] = ((ue[r] or 0)) + (1)
                                    local h = S.BuyList[r]
                                    local s = h and h.Amount or 0
                                    local B = ue[r]
                                    if s > 0 then
                                        A(string.format("<font color=\"#49E685\">\226\156\133 Tamed</font> <b>%s</b>! <font color=\"#AAAAAA\">(%d/%d)</font>", U, B, s), 3)
                                    else
                                        A(string.format("<font color=\"#49E685\">\226\156\133 Tamed</font> <b>%s</b>! <font color=\"#AAAAAA\">(%d total)</font>", U, ke), 3)
                                    end
                                    pcall(function ()
                                        RefreshBuyListUI()
                                    end)
                                else
                                    A(string.format("<font color=\"#49E685\">\226\156\133 Tamed</font> <b>%s</b>! <font color=\"#AAAAAA\">(%d total)</font>", U, ke), 3)
                                end
                                ne(s, U, K)
                            else
                                A(string.format("<font color=\"#FF6B6B\">\226\156\151 Tame failed</font> <font color=\"#AAAAAA\">(%s): %s</font>", U, tostring(B)), 4)
                                I("Tame failed: "..tostring(B))
                            end
                            end
                        else
                        local h = not U and "did not arrive" or not qe(s) and "pet no longer valid" or not S.AutoBuyEnabled and "auto buy disabled mid-chase" or "unknown"
                        A(string.format("<font color=\"#FFA500\">\226\154\160\239\184\143 Skipped</font> %s: %s", s:GetAttribute("PetName") or "Pet", h), 3)
                        I("Failed to reach pet, retrying...")
                    end
                    task.wait(0.3)
                elseif S.ServerHopEnabled then
                    H("\226\156\133 Cleared \226\128\148 hopping...")
                    pcall(G)
                    local h, s = Ue()
                    if not h then
                        A("<font color=\"#FF6B6B\">\226\154\160\239\184\143 Hop failed:</font> <font color=\"#AAAAAA\">"..(tostring(s).." \226\128\148 retrying</font>"), 4)
                        task.wait(1.5)
                    end
                    else
                    I("No matching pets found, waiting...")
                    H("\240\159\148\141 No matches \226\128\148 waiting in this server...")
                    task.wait(1)
                end
                elseif S.ServerHopEnabled then
                H("\240\159\140\144 Hopping...")
                pcall(G)
                local h, s = Ue()
                if not h then
                    A("<font color=\"#FF6B6B\">\226\154\160\239\184\143 Hop failed:</font> <font color=\"#AAAAAA\">"..(tostring(s).." \226\128\148 retrying</font>"), 4)
                    task.wait(1.5)
                end
                end
            end
        V.TameActive = false H("\226\143\184\239\184\143 Idle")
    end
    local function ee()
        if Ze then
            return
        end
        Ze = task.spawn(function ()
            local h, s = pcall(Oe)
            if not h then
                warn("\226\157\140 [TOMI HUB] Engine Error: "..tostring(s))
            end
            Ze = nil
        end)
    end
    local function Ie(h)
        local s = V.Scheme.MainColor
        local U = V.Scheme.OutlineColor
        local r = 6
        local B = 35
        local K = h.Holder
        local d = h.Container
        local v = d:FindFirstChildOfClass("UIListLayout")
        d.Position = UDim2.new(0, r, 0, B + r)
        d.Size = UDim2.new(1, -r * 2, 1, -((B + r * 2)))
        d.BackgroundColor3 = s
        d.BackgroundTransparency = 133174 + (-133174)
        d.BorderSizePixel = 0
        local i = Instance.new("UICorner")
        i.CornerRadius = UDim.new(0, 8)
        i.Parent = d
        h.Resize = function (h,...)
            K.Size = UDim2.new(1, 0, 0, ((v.AbsoluteContentSize.Y / V.DPIScale) + 49) + r * 2)
        end
        h:Resize()
    end
    local function He(h)
        local s = h.Title or "Targets"
        local U = h.Items or {}
        local r = h.Store or {}
        local B = h.DisplayMap
        local K = h.OnDone
        local d = h.OnToggle
        local v = h.Single
        local i
        local u = V.Scheme.BackgroundColor
        local Y = V.Scheme.MainColor
        local f = V.Scheme.OutlineColor
        local N = V.Scheme.FontColor
        local q = V.Scheme.AccentColor
        local z = V:GetBetterColor(N, -90)
        local A = Y
        local l = V:GetBetterColor(Y, 18)
        local o = V.ScreenGui
        if not o then
            local h, s = pcall(function ()
                return gethui and gethui()
            end)
            if h and s then
                o = s
            end
            end
        if not o then
            pcall(function ()
                o = game:GetService("CoreGui")
            end)
        end
        if not o then
            o = E:WaitForChild("PlayerGui")
        end
        local Q = Instance.new("Frame")
        Q.Name = "TOMIHUBTargetOverlay"
        Q.Size = UDim2.fromScale(1, 1)
        Q.BackgroundColor3 = Color3.new(0, 0, 0)
        Q.BackgroundTransparency = 0.45
        Q.BorderSizePixel = (773023) + (-773023)
        Q.ZIndex = 9000
        Q.Visible = false Q.Parent = o
        local S = Instance.new("TextButton")
        S.BackgroundTransparency = 1
        S.Size = UDim2.fromScale(1, 1)
        S.Text = ""
        S.ZIndex = -67471 - (-76471)
        S.Parent = Q
        local R = Instance.new("Frame")
        R.AnchorPoint = Vector2.new(0.5, 0.5)
        R.Position = UDim2.fromScale(0.5, 0.5)
        R.Size = UDim2.fromOffset(560, 460)
        R.BackgroundColor3 = u
        R.BorderSizePixel = 1837059102 % (8275041)
        R.ZIndex = 364975 + (-355974)
        R.Active = true R.Parent = Q
        local b = Instance.new("UICorner")
        b.CornerRadius = UDim.new(0, 12)
        b.Parent = R
        local a = Instance.new("UIStroke")
        a.Color = f
        a.Thickness = 1
        a.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        a.Parent = R
        local M = Instance.new("Frame")
        M.Size = UDim2.new(1, 0, 0, 56)
        M.BackgroundTransparency = -758384 - (-758385)
        M.ZIndex = 9002
        M.Active = true M.Parent = R
        local w = Instance.new("TextLabel")
        w.BackgroundTransparency = -338048 - (-338049)
        w.Position = UDim2.fromOffset(20, 14)
        w.Size = UDim2.new(1, -160, 0, 30)
        w.FontFace = V.Scheme.Font
        w.Text = "\240\159\166\150 "..s
        w.TextSize = 22
        w.TextColor3 = N
        w.TextXAlignment = Enum.TextXAlignment.Left
        w.ZIndex = 9003
        w.Parent = M
        local F = Instance.new("TextButton")
        F.AnchorPoint = Vector2.new(1, 0)
        F.Position = UDim2.new(1, -16, 0, 12)
        F.Size = UDim2.fromOffset(110, 34)
        F.BackgroundColor3 = q
        F.Text = "Done"
        F.FontFace = V.Scheme.Font
        F.TextSize = 15
        F.TextColor3 = N
        F.AutoButtonColor = true F.ZIndex = 9003
        F.Parent = M
        local g = Instance.new("UICorner")
        g.CornerRadius = UDim.new(0, 8)
        g.Parent = F
        pcall(function ()
            V:MakeDraggable(R, M, true, false)
        end)
        local j = Instance.new("Frame")
        j.Position = UDim2.fromOffset(16, 60)
        j.Size = UDim2.new(1, -32, 1, -76)
        j.BackgroundColor3 = Y
        j.BorderSizePixel = 1020067236 % (9445067)
        j.ZIndex = 9001
        j.Parent = R
        local J = Instance.new("UICorner")
        J.CornerRadius = UDim.new(0, 10)
        J.Parent = j
        local p = Instance.new("UIStroke")
        p.Color = f
        p.Thickness = 1
        p.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        p.Parent = j
        local D = Instance.new("TextBox")
        D.Position = UDim2.fromOffset(14, 14)
        D.Size = UDim2.new(1, -28, 0, 40)
        D.BackgroundColor3 = u
        D.Text = ""
        D.PlaceholderText = "Search items..."
        D.PlaceholderColor3 = z
        D.FontFace = V.Scheme.Font
        D.TextSize = 16
        D.TextColor3 = N
        D.TextXAlignment = Enum.TextXAlignment.Left
        D.ClearTextOnFocus = false D.ZIndex = 9002
        D.Parent = j
        local X = Instance.new("UICorner")
        X.CornerRadius = UDim.new(0, 8)
        X.Parent = D
        local W = Instance.new("UIPadding")
        W.PaddingLeft = UDim.new(0, 14)
        W.Parent = D
        local G = Instance.new("UIStroke")
        G.Color = f
        G.Thickness = 1
        G.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        G.Parent = D
        local function t(h, s)
            local U = Instance.new("TextButton")
            U.AnchorPoint = Vector2.new(1, 0)
            U.Position = UDim2.new(1, s, 0, 62)
            U.Size = UDim2.fromOffset(54, 24)
            U.BackgroundColor3 = u
            U.Text = h
            U.FontFace = V.Scheme.Font
            U.TextSize = (-463965) - (-463978)
            U.TextColor3 = N
            U.ZIndex = 9003
            U.Parent = j
            local r = Instance.new("UICorner")
            r.CornerRadius = UDim.new(0, 6)
            r.Parent = U
            local B = Instance.new("UIStroke")
            B.Color = f
            B.Thickness = 1
            B.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            B.Parent = U
            return U
        end
        local P = Instance.new("ScrollingFrame")
        P.Position = UDim2.fromOffset(14, 94)
        P.Size = UDim2.new(1, -28, 1, -108)
        P.BackgroundColor3 = u
        P.BorderSizePixel = 0
        P.ScrollBarThickness = 5
        P.ScrollBarImageColor3 = f
        P.CanvasSize = UDim2.new()
        P.ZIndex = 9002
        P.Parent = j
        local x = Instance.new("UICorner")
        x.CornerRadius = UDim.new(0, 8)
        x.Parent = P
        local C = Instance.new("UIListLayout")
        C.Padding = UDim.new(0, 4)
        C.SortOrder = Enum.SortOrder.LayoutOrder
        C.Parent = P
        local n = Instance.new("UIPadding")
        n.PaddingLeft = UDim.new(0, 8)
        n.PaddingRight = UDim.new(0, 8)
        n.PaddingTop = UDim.new(0, 8)
        n.PaddingBottom = UDim.new(0, 8)
        n.Parent = P;
        (C:GetPropertyChangedSignal("AbsoluteContentSize")):Connect(function ()
            P.CanvasSize = UDim2.new(0, 0, 0, C.AbsoluteContentSize.Y + 16)
        end)
        local k = {}
        local Z = {}
        local function y(h)
            local s = Instance.new("TextButton")
            s.Size = UDim2.new(1, 0, 0, 40)
            s.BackgroundColor3 = r[h] and l or A
            s.AutoButtonColor = false s.Text = ""
            s.ZIndex = 9003
            s.Parent = P
            local U = Instance.new("UICorner")
            U.CornerRadius = UDim.new(0, 6)
            U.Parent = s
            local K = Instance.new("TextLabel")
            K.BackgroundTransparency = 1
            K.Position = UDim2.fromOffset(14, 0)
            K.Size = UDim2.new(1, -22, 1, 0)
            K.RichText = true K.Text = (B and B[h]) or h
            K.FontFace = V.Scheme.Font
            K.TextSize = 15
            K.TextColor3 = N
            K.TextXAlignment = Enum.TextXAlignment.Left
            K.ZIndex = 9004
            K.Parent = s
            local function i()
                s.BackgroundColor3 = r[h] and l or A
            end
            s.MouseButton1Click:Connect(function ()
                if v then
                    for h in pairs(r)
                    do
                        r[h] = nil
                    end
                    r[h] = true
                    for h, s in pairs(k)
                    do
                        s()
                    end
                    if d then
                        pcall(d, h, true)
                    end
                    else
                    r[h] = not r[h]
                    i()
                    if d then
                        pcall(d, h, r[h])
                    end
                    end
                end)
            k[h] = i
            Z[h] = s
        end
        local function O(h)
            for h, s in pairs(Z)
            do
                s:Destroy()
            end
            k = {}
            Z = {}
            for h, s in ipairs(h)
            do
                y(s)
            end
            end
        O(U)
        if not v then
            (t("None", -14)).MouseButton1Click:Connect(function ()
                for h in pairs(Z)
                do
                    r[h] = false k[h]()
                end
                if d then
                    pcall(d)
                end
                end);
            (t("All", -74)).MouseButton1Click:Connect(function ()
                for h in pairs(Z)
                do
                    r[h] = true k[h]()
                end
                if d then
                    pcall(d)
                end
                end)
        end;
        (D:GetPropertyChangedSignal("Text")):Connect(function ()
            local h = string.lower(D.Text)
            for s, U in pairs(Z)
            do
                U.Visible = (h == "") or string.find(string.lower(s), h, 1, true) ~= nil
            end
            end)
        local function e()
            Q.Visible = false
            if K then
                pcall(K)
            end
            end
        i = e
        F.MouseButton1Click:Connect(e)
        return {Open = function ()
            D.Text = ""
            for h in pairs(Z)
            do
                Z[h].Visible = true k[h]()
            end
            Q.Visible = true
        end, SetItems = function (h, s)
            U = h
            if s ~= nil then
                B = s
            end
            O(h)
        end;
        Repaint = function ()
            for h in pairs(Z)
            do
                k[h]()
            end
            end}
    end
    local function Te(h, s, U, r, K)
        K = K or {}
        local d = K.multi
        local v = K.store
        if not d then
            v = {}
            local h = K.get and K.get()
            if h and table.find(r, h) then
                v[h] = true
            end
            end
        local function i()
            if d then
                local h = {}
                for s, U in ipairs(r)
                do
                    if v[U] then
                        h[#h + 1] = U
                    end
                    end
                if #h == (-116771) - (-116771) then
                    return "---"
                end
                if #h == #r then
                    return "All"
                end
                if #h <= -617858 - (-617861) then
                    return table.concat(h, ", ")
                end
                return #h.." selected"
            else
                for h, s in ipairs(r)
                do
                    if v[s] then
                        return s
                    end
                    end
                return "---"
            end
            end
        local u = h:AddDropdown(s, {Text = K.text;
        Values = {"---";
        "All"};
        Default = "---", Tooltip = K.tooltip or ("Click to open the "..(U.." picker."))})
        local E
        local function Y()
            local h = u.Holder
            if not h then
                return
            end
            local s = i()
            for h, U in ipairs(h:GetDescendants())
            do
                if ((U:IsA("TextLabel") or U:IsA("TextButton"))) and U.Name ~= "TOMIHUBOverlayCatcher" then
                    pcall(function ()
                        U.TextXAlignment = Enum.TextXAlignment.Left
                        U.TextYAlignment = Enum.TextYAlignment.Center
                        if not U.TextScaled and U.TextSize < 15 then
                            U.TextSize = 15
                        end
                        if U.Text == s then
                            if U.Size.Y.Scale == 0 and (U.Size.Y.Offset > 0 and (U.Parent and (U.Parent:IsA("GuiObject") and U.Parent.AbsoluteSize.Y > U.AbsoluteSize.Y + 1))) then
                                U.Size = UDim2.new(U.Size.X.Scale, U.Size.X.Offset, 1, 0)
                            end
                            local h = U:FindFirstChildOfClass("UIPadding")
                            if not h then
                                h = Instance.new("UIPadding")
                                h.Parent = U
                            end
                            h.PaddingBottom = UDim.new(0, 3)
                        end
                        end)
                end
                end
            end
        local function f()
            local h = i()
            pcall(function ()
                u:SetValues({h})
                u:SetValue(h)
            end)
            Y()
        end
        local function N(h)
            if not E then
                return
            end
            pcall(function ()
                (B:Create(E, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Rotation = h and 180 or (2682320465) % 11512105})):Play()
            end)
        end
        local q = He({Title = U;
        Items = r, Store = v, Single = not d;
        DisplayMap = K.displayMap;
        OnDone = function ()
            N(false)
        end;
        OnToggle = function (h)
            if not d and h then
                if K.set then
                    K.set(h)
                end
                end
            f()
            if K.onChange then
                pcall(K.onChange)
            end
            end})
        f()
        local z = {Dropdown = u;
        Overlay = q;
        Multi = d, GetValue = function ()
            if d then
                local h = {}
                for s in pairs(v)
                do
                    if v[s] then
                        h[s] = true
                    end
                    end
                return h
            else
                for h, s in ipairs(r)
                do
                    if v[s] then
                        return s
                    end
                    end
                return "Any"
            end
            end, SetValue = function (h, s)
            for h in pairs(v)
            do
                v[h] = nil
            end
            if d then
                if type(s) == "table" then
                    for h, s in pairs(s)
                    do
                        if s == true then
                            v[h] = true
                        elseif type(h) == "number" and type(s) == "string" then
                            v[s] = true
                        end
                        end
                    end
                else
                if type(s) == "string" and (s ~= "" and table.find(r, s)) then
                    v[s] = true
                end
                end
            f()
            pcall(function ()
                q.Repaint()
            end)
        end}
        task.defer(function ()
            local h = u.Holder
            if not h then
                return
            end
            local s = h:FindFirstChildWhichIsA("TextButton", true)
            local U = s or h
            local r = Instance.new("TextButton")
            r.Name = "TOMIHUBOverlayCatcher"
            r.BackgroundTransparency = 1
            r.Text = ""
            r.Size = UDim2.fromScale(1, 1)
            r.Position = UDim2.fromScale(0, 0)
            r.ZIndex = ((U.ZIndex or (-932512) + 932513)) + (50)
            r.Active = true r.AutoButtonColor = false r.Parent = U
            f()
            E = h:FindFirstChildWhichIsA("ImageLabel", true) or h:FindFirstChildWhichIsA("ImageButton", true)
            local B = r.MouseButton1Click:Connect(function ()
                pcall(function ()
                    if u.Menu and u.Menu.Close then
                        u.Menu:Close()
                    end
                    end)
                if K.onOpen then
                    pcall(K.onOpen)
                end
                N(true)
                q.Open()
            end)
            V:GiveSignal(B)
        end)
        return z
    end
    local function Le(h, s, U)
        local r = Color3.fromRGB(32, 32, 32)
        local B = Color3.fromRGB(42, 42, 42)
        local K = V.Scheme.FontColor
        local d = V.Scheme.OutlineColor
        local v = 30
        local i = 4
        local u = (#U * v) + (((#U - 1)) * i)
        local E = Instance.new("Frame")
        E.BackgroundTransparency = -492743 - (-492744)
        E.BorderSizePixel = -270615 - (-270615)
        E.Size = UDim2.new(1, 0, 0, u)
        local Y = Instance.new("UIListLayout")
        Y.FillDirection = Enum.FillDirection.Vertical
        Y.HorizontalAlignment = Enum.HorizontalAlignment.Center
        Y.SortOrder = Enum.SortOrder.LayoutOrder
        Y.Padding = UDim.new(0, i)
        Y.Parent = E
        for h, s in ipairs(U)
        do
            local U = Instance.new("TextButton")
            U.Text = s[1]
            U.Font = Enum.Font.GothamSemibold
            U.TextSize = (-565486) - (-565499)
            U.TextColor3 = K
            U.BackgroundColor3 = r
            U.BorderSizePixel = (-205005) + (205005)
            U.Size = UDim2.new(1, 0, 0, v)
            U.LayoutOrder = h
            U.AutoButtonColor = false
            local i = Instance.new("UICorner")
            i.CornerRadius = UDim.new(0, 6)
            i.Parent = U
            local u = Instance.new("UIStroke")
            u.Color = d
            u.Thickness = 1
            u.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            u.Parent = U
            U.MouseEnter:Connect(function ()
                U.BackgroundColor3 = B
            end)
            U.MouseLeave:Connect(function ()
                U.BackgroundColor3 = r
            end)
            U.MouseButton1Click:Connect(s[2])
            U.Parent = E
        end
        h:AddUIPassthrough(s, {Instance = E;
        Height = u})
        return E
    end
    local me = "All World Models"
    local ce = "Keep My Garden"
    local hg = {}
    local function sg()
        for h, s in ipairs(hg)
        do
            pcall(function ()
                s:Disconnect()
            end)
        end
        hg = {}
    end
    local function Ug()
        local h = E:GetAttribute("PlotId")
        return h and ("Plot"..tostring(h)) or nil
    end
    local function rg()
        sg()
        if not S.GardenOptimizerEnabled then
            return
        end
        local function h()
            local h = workspace:FindFirstChild("Gardens") or workspace:FindFirstChild("Map") or workspace:FindFirstChild("World")
            if h then
                local s = S.CullMode == ce
                local function U(h)
                    return s and (Ug() ~= nil and h.Name == Ug())
                end
                task.spawn(function ()
                    local s = 0
                    for h, r in ipairs(h:GetChildren())
                    do
                        if not S.GardenOptimizerEnabled then
                            return
                        end
                        if not U(r) then
                            pcall(function ()
                                r:Destroy()
                            end)
                            s = s + (1)
                            if s % 4 == -1027062 - (-1027062) then
                                task.wait()
                            end
                            end
                        end
                    end)
                local r = h.ChildAdded:Connect(function (h)
                    if S.GardenOptimizerEnabled and not U(h) then
                        pcall(function ()
                            h:Destroy()
                        end)
                    end
                    end)
                table.insert(hg, r)
            else
                local h
                h = workspace.ChildAdded:Connect(function (s)
                    local U = {Gardens = true;
                    Map = true;
                    World = true}
                    if U[s.Name] then
                        if h then
                            h:Disconnect()
                        end
                        rg()
                    end
                    end)
                table.insert(hg, h)
            end
            end
        h()
    end
    local Bg, Kg
    do
        local h = nil
        local s = nil
        local U = nil
        local r = nil
        local B = nil
        local function K(h)
            if h:IsA("Decal") or h:IsA("Texture") then
                pcall(function ()
                    h.Transparency = 1
                end)
            elseif h:IsA("SurfaceAppearance") then
                pcall(function ()
                    h:Destroy()
                end)
            elseif h:IsA("ParticleEmitter") or h:IsA("Trail") or h:IsA("Beam") or h:IsA("Smoke") or h:IsA("Fire") or h:IsA("Sparkles") then
                pcall(function ()
                    if h.Enabled and h:GetAttribute("__vzFx") == nil then
                        h:SetAttribute("__vzFx", true)
                        h.Enabled = false
                        if h:IsA("ParticleEmitter") or h:IsA("Trail") then
                            pcall(function ()
                                h:Clear()
                            end)
                        end
                        end
                    end)
            elseif h:IsA("BasePart") then
                pcall(function ()
                    if h.Material ~= Enum.Material.SmoothPlastic then
                        h.Material = Enum.Material.SmoothPlastic
                    end
                    end)
            end
            end
        function Bg()
            pcall(function ()
                local h = (settings()).Rendering
                U = h.QualityLevel
                h.QualityLevel = Enum.QualityLevel.Level01
            end)
            r = {}
            pcall(function ()
                for h, s in ipairs((game:GetService("Lighting")):GetDescendants())
                do
                    if s:IsA("PostEffect") and s.Enabled then
                        r[s] = true s.Enabled = false
                    end
                    end
                end)
            pcall(function ()
                local h = workspace:FindFirstChildOfClass("Terrain")
                local s = h and h:FindFirstChildOfClass("Clouds")
                if s then
                    s.Enabled = false
                end
                end)
            B = {}
            local d = game:GetService("Lighting")
            local function v(h)
                if h:IsA("Sky") then
                    table.insert(B, h)
                    h.Parent = nil
                elseif h:IsA("PostEffect") and (h.Enabled and not r[h]) then
                    r[h] = true h.Enabled = false
                end
                end
            pcall(function ()
                for h, s in ipairs(d:GetChildren())
                do
                    v(s)
                end
                end)
            if s then
                s:Disconnect()
            end
            s = d.ChildAdded:Connect(function (h)
                if S.ZeroTextureEnabled then
                    pcall(v, h)
                end
                end)
            task.spawn(function ()
                local h = (75103) + (-75103)
                for s, U in ipairs(workspace:GetDescendants())
                do
                    if not S.ZeroTextureEnabled then
                        return
                    end
                    K(U)
                    h = h + 1
                    if h % 200 == 0 then
                        task.wait()
                    end
                    end
                end)
            if h then
                h:Disconnect()
            end
            h = workspace.DescendantAdded:Connect(function (h)
                if S.ZeroTextureEnabled then
                    K(h)
                end
                end)
        end
        function Kg()
            if h then
                h:Disconnect()
                h = nil
            end
            if s then
                s:Disconnect()
                s = nil
            end
            if U then
                pcall(function ()
                    (settings()).Rendering.QualityLevel = U
                end)
            end
            if r then
                for h in pairs(r)
                do
                    pcall(function ()
                        h.Enabled = true
                    end)
                end
                r = nil
            end
            if B then
                local h = game:GetService("Lighting")
                for s, U in ipairs(B)
                do
                    pcall(function ()
                        U.Parent = h
                    end)
                end
                B = nil
            end
            pcall(function ()
                local h = workspace:FindFirstChildOfClass("Terrain")
                local s = h and h:FindFirstChildOfClass("Clouds")
                if s then
                    s.Enabled = true
                end
                end)
            pcall(function ()
                for h, s in ipairs(workspace:GetDescendants())
                do
                    if s:GetAttribute("__vzFx") then
                        pcall(function ()
                            s.Enabled = true s:SetAttribute("__vzFx", nil)
                        end)
                    end
                    end
                end)
        end
        end
    local dg = nil
    local vg = nil
    local function ig()
        if vg then
            vg.Visible = true
            return
        end
        local h
        local s = pcall(function ()
            h = gethui and gethui()
        end)
        if not s or not h then
            pcall(function ()
                h = game:GetService("CoreGui")
            end)
        end
        if not h then
            h = E:WaitForChild("PlayerGui")
        end
        dg = Instance.new("ScreenGui")
        dg.Name = "TOMIHUBBlackScreen"
        dg.ResetOnSpawn = false dg.IgnoreGuiInset = true
        local U = 1000
        pcall(function ()
            if V.ScreenGui and V.ScreenGui.DisplayOrder then
                U = V.ScreenGui.DisplayOrder
            end
            end)
        dg.DisplayOrder = math.max(0, U - 1)
        dg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        dg.Parent = h
        vg = Instance.new("Frame")
        vg.Name = "Cover"
        vg.Size = UDim2.fromScale(1, 1)
        vg.Position = UDim2.fromScale(0, 0)
        vg.BackgroundColor3 = Color3.new(0, 0, 0)
        vg.BackgroundTransparency = 0
        vg.BorderSizePixel = 0
        vg.ZIndex = -440535 - (-440536)
        vg.Parent = dg
    end
    local function ug()
        if vg then
            vg.Visible = false
        end
        if dg then
            dg:Destroy()
            dg = nil vg = nil
        end
        end
    local Eg
    do
        local h = {}
        local function s()
            local h = E:GetAttribute("PlotId")
            local s = h and (workspace:FindFirstChild("Gardens") and workspace.Gardens:FindFirstChild("Plot"..tostring(h)))
            return s and s:FindFirstChild("Plants")
        end
        local function U(h, s)
            if h:IsA("Decal") or h:IsA("Texture") then
                h.LocalTransparencyModifier = s and (896052708) % (13373921) or -567732 - (-567732)
                return
            end
            if h:IsA("ParticleEmitter") or h:IsA("Trail") or h:IsA("Beam") or h:IsA("Sparkles") or h:IsA("Smoke") or h:IsA("Fire") or h:IsA("Light") then
                if s then
                    if h.Enabled and h:GetAttribute("__vhFx") == nil then
                        h:SetAttribute("__vhFx", true)
                        h.Enabled = false
                        if h:IsA("ParticleEmitter") or h:IsA("Trail") then
                            pcall(function ()
                                h:Clear()
                            end)
                        end
                        end
                    elseif h:GetAttribute("__vhFx") then
                    h.Enabled = true h:SetAttribute("__vhFx", nil)
                end
                return
            end
            if not h:IsA("BasePart") then
                return
            end
            h.LocalTransparencyModifier = s and 1 or -483376 - (-483376)
            if s then
                if h.CanCollide and h:GetAttribute("__vhCol") == nil then
                    h:SetAttribute("__vhCol", true)
                    h.CanCollide = false
                end
                if h.CanQuery and h:GetAttribute("__vhQry") == nil then
                    h:SetAttribute("__vhQry", true)
                    h.CanQuery = false
                end
                else
                if h:GetAttribute("__vhCol") then
                    h.CanCollide = true h:SetAttribute("__vhCol", nil)
                end
                if h:GetAttribute("__vhQry") then
                    h.CanQuery = true h:SetAttribute("__vhQry", nil)
                end
                end
            end
        Eg = function (r)
            for h, s in ipairs(h)
            do
                pcall(function ()
                    s:Disconnect()
                end)
            end
            h = {}
            local B = s()
            if not B then
                return
            end
            task.spawn(function ()
                local h = 0
                for s, B in ipairs(B:GetDescendants())
                do
                    if ((S.HidePlantsEnabled == true)) ~= r then
                        break
                    end
                    pcall(U, B, r)
                    h = h + 1
                    if h % 200 == 0 then
                        task.wait()
                    end
                    end
                end)
            if r then
                h[#h + 1] = B.DescendantAdded:Connect(function (h)
                    if S.HidePlantsEnabled then
                        pcall(U, h, true)
                    end
                    end)
            end
            end
        end
    local Yg
    do
        local h = {}
        local function s()
            local h = workspace:FindFirstChild("_PetVisualClient")
            return h and h:FindFirstChild("Models")
        end
        local function U(h, s)
            if h:IsA("Decal") or h:IsA("Texture") then
                h.LocalTransparencyModifier = s and 1 or -1387102
                return
            end
            if h:IsA("ParticleEmitter") or h:IsA("Trail") or h:IsA("Beam") or h:IsA("Sparkles") or h:IsA("Smoke") or h:IsA("Fire") or h:IsA("Light") then
                if s then
                    if h.Enabled and h:GetAttribute("__vpFx") == nil then
                        h:SetAttribute("__vpFx", true)
                        h.Enabled = false
                        if h:IsA("ParticleEmitter") or h:IsA("Trail") then
                            pcall(function ()
                                h:Clear()
                            end)
                        end
                        end
                    elseif h:GetAttribute("__vpFx") then
                    h.Enabled = true h:SetAttribute("__vpFx", nil)
                end
                return
            end
            if not h:IsA("BasePart") then
                return
            end
            h.LocalTransparencyModifier = s and 1 or 3155172566 % (12773978)
            if s then
                if h.CanCollide and h:GetAttribute("__vpCol") == nil then
                    h:SetAttribute("__vpCol", true)
                    h.CanCollide = false
                end
                elseif h:GetAttribute("__vpCol") then
                h.CanCollide = true h:SetAttribute("__vpCol", nil)
            end
            end
        Yg = function (r)
            for h, s in ipairs(h)
            do
                pcall(function ()
                    s:Disconnect()
                end)
            end
            h = {}
            local B = s()
            if not B then
                return
            end
            task.spawn(function ()
                local h = (19674) + (-19674)
                for s, B in ipairs(B:GetDescendants())
                do
                    if ((S.HidePetsEnabled == true)) ~= r then
                        break
                    end
                    pcall(U, B, r)
                    h = h + (1)
                    if h % 200 == 0 then
                        task.wait()
                    end
                    end
                end)
            if r then
                h[#h + 1] = B.DescendantAdded:Connect(function (h)
                    if S.HidePetsEnabled then
                        pcall(U, h, true)
                    end
                    end)
            end
            end
        end
    local Vg
    do
        local h = {}
        local s = {"Handles", "DroppedItems"}
        Vg = function (U)
            for h, s in ipairs(h)
            do
                pcall(function ()
                    s:Disconnect()
                end)
            end
            h = {}
            if not U then
                return
            end
            local function r(h)
                task.spawn(function ()
                    local s = 0
                    for h, U in ipairs(h)
                    do
                        if not S.SellStripEnabled then
                            return
                        end
                        pcall(function ()
                            U:Destroy()
                        end)
                        s = s + (1)
                        if s % 30 == 0 then
                            task.wait()
                        end
                        end
                    end)
            end
            local B = {}
            for s, U in ipairs(s)
            do
                local r = workspace:FindFirstChild(U)
                if r then
                    for h, s in ipairs(r:GetChildren())
                    do
                        B[#B + 1] = s
                    end
                    h[#h + 1] = r.ChildAdded:Connect(function (h)
                        if S.SellStripEnabled then
                            pcall(function ()
                                h:Destroy()
                            end)
                        end
                        end)
                end
                end
            local function K(s, U)
                if U then
                    for h, s in ipairs(s:GetChildren())
                    do
                        U[#U + 1] = s
                    end
                    else
                    r(s:GetChildren())
                end
                h[#h + 1] = s.ChildAdded:Connect(function (h)
                    if S.SellStripEnabled then
                        pcall(function ()
                            h:Destroy()
                        end)
                    end
                    end)
            end
            local function v(s, U)
                if s == E then
                    return
                end
                local r = s:FindFirstChildOfClass("Backpack")
                if r then
                    K(r, U)
                end
                h[#h + 1] = s.ChildAdded:Connect(function (h)
                    if S.SellStripEnabled and h:IsA("Backpack") then
                        task.defer(K, h)
                    end
                    end)
            end
            for h, s in ipairs(d:GetPlayers())
            do
                v(s, B)
            end
            h[#h + 1] = d.PlayerAdded:Connect(function (h)
                task.delay(3, function ()
                    if S.SellStripEnabled then
                        v(h)
                    end
                    end)
            end)
            r(B)
        end
        end
    local fg, Ng, qg
    pcall(function ()
        fg = require(U.SharedModules.Networking)
    end)
    pcall(function ()
        Ng = require(U.SharedModules.Flags.StealFlags)
    end)
    pcall(function ()
        qg = require(U.SharedModules.FruitValueCalc)
    end)
    local zg = false
    local function Ag()
        local h = os.clock()
        while zg and os.clock() - h < -264352 - (-264382)
        do
            task.wait()
        end
        zg = true
    end
    local function lg()
        zg = false
    end
    local function og(h)
        if not qg then
            return -874443 - (-874443)
        end
        local s = h:GetAttribute("CorePartName") or h:GetAttribute("SeedName")
        if not s then
            return 978708711 % (8978979)
        end
        local U, r = pcall(qg, s, h:GetAttribute("SizeMulti") or 1, h:GetAttribute("Mutation"), E, h:GetAttribute("DecayAlpha"))
        return ((U and type(r) == "number")) and r or (1214843553) % (5259063)
    end
    local function Qg(h,...)
        local s = table.pack(...)
        local U, r = pcall(function ()
            return h:Fire(table.unpack(s, 1, s.n))
        end)
        if U then
            return r
        end
        return nil
    end
    local function Sg()
        local h = U:FindFirstChild("Night")
        return h ~= nil and h.Value == true
    end
    local function Rg(h)
        local s = U:FindFirstChild("StockValues")
        local r = s and s:FindFirstChild(h)
        return r and r:FindFirstChild("Items")
    end
    local function bg(h)
        local s, U = {}, Rg(h)
        if U then
            for h, U in ipairs(U:GetChildren())
            do
                if U:IsA("ValueBase") then
                    table.insert(s, U.Name)
                end
                end
            table.sort(s)
        end
        return s
    end
    local ag = bg("SeedShop")
    local Mg = bg("GearShop")
    local wg = bg("CrateShop")
    if type(S.SeedSelected) ~= "table" then
        S.SeedSelected = {}
    end
    if type(S.GearSelected) ~= "table" then
        S.GearSelected = {}
    end
    if type(S.CrateSelected) ~= "table" then
        S.CrateSelected = {}
    end
    if type(S.PlantSelected) ~= "table" then
        S.PlantSelected = {}
    end
    if type(S.HarvestFilterFruits) ~= "table" then
        S.HarvestFilterFruits = {}
    end
    if type(S.ESPFruitFilter) ~= "table" then
        S.ESPFruitFilter = {}
    end
    local Fg = S.SeedSelected
    local gg = S.GearSelected
    local jg = S.CrateSelected
    for h, s in ipairs(ag)
    do
        if Fg[s] == nil then
            Fg[s] = true
        end
        if S.PlantSelected[s] == nil then
            S.PlantSelected[s] = true
        end
        end
    for h, s in ipairs(Mg)
    do
        if gg[s] == nil then
            gg[s] = true
        end
        end
    for h, s in ipairs(wg)
    do
        if jg[s] == nil then
            jg[s] = true
        end
        end
    if #ag == 0 then
        ag = {"No Seeds Found"}
    end
    if #Mg == 0 then
        Mg = {"No Gears Found"}
    end
    if #wg == -19602 - (-19602) then
        wg = {"No Crates Found"}
    end
    do
        local h = {}
        local s = E.UserId
        local r, B = {}, {}
        pcall(function ()
            local h = U:FindFirstChild("PlantGenerationModules")
            for s, U in ipairs({"Plants", "Fruits"})
            do
                local B = h and h:FindFirstChild(U)
                if B then
                    for h, s in ipairs(B:GetChildren())
                    do
                        local U, B = pcall(require, s)
                        if U and (type(B) == "table" and (B.GrowData and tonumber(B.GrowData.BaseWeight))) then
                            r[s.Name] = B.GrowData.BaseWeight
                        end
                        end
                    end
                end
            local s = require(U.SharedModules.SeedData)
            for h, s in pairs(s)
            do
                if type(s) == "table" and (s.SeedName and s.PlantModel) then
                    B[s.SeedName] = s.PlantModel
                end
                end
            end)
        local function K(h, s, U)
            local K = tonumber(h:GetAttribute("Weight"))
            if K and K > -474557 - (-474557) then
                return K
            end
            local d = r[s or ""] or r[U or ""] or r[B[U or ""] or ""]
            if d then
                return d * ((tonumber(h:GetAttribute("SizeMulti")) or -1206467))
            end
            return nil
        end
        local d
        local function v(h)
            if not d then
                pcall(function ()
                    d = require(E.PlayerScripts.Controllers.FruitVisualizerController)
                end)
            end
            if d and (h and h.Parent) then
                local s, U = pcall(function ()
                    return d:CalculateFruitWeight(h)
                end)
                if s and tonumber(U) then
                    return tonumber(U)
                end
                s, U = pcall(function ()
                    return d:CalculatePlantWeight(h)
                end)
                if s and tonumber(U) then
                    return tonumber(U)
                end
                end
            return nil
        end
        local function i(h)
            if type(h) ~= "table" then
                return false
            end
            for h, s in pairs(h)
            do
                if s then
                    return true
                end
                end
            return false
        end
        local Y = 0
        local function f(h)
            local s = S.HarvestFilterFruits
            if i(s) and not s[h.seedName] then
                return false
            end
            local U = S.HarvestFilterMutations
            if i(U) then
                local s = h.model:GetAttribute("Mutation")
                s = ((s ~= nil and s ~= "")) and tostring(s) or "None"
                if not U[s] then
                    return false
                end
                end
            local r = S.HarvestFilterVariants
            if i(r) then
                local s = h.plantModel and h.plantModel:GetAttribute("Mutation")
                s = ((s ~= nil and s ~= "")) and tostring(s) or "Normal"
                if not r[s] then
                    return false
                end
                end
            local B = S.HarvestWeightMode
            local K = tonumber(S.HarvestWeightKg) or 0
            if K > 0 and ((B == "Below" or B == "Above")) then
                local s = os.clock()
                if ((not h.liveWAt or s - h.liveWAt > 4 + math.random() * 3)) and Y > 0 then
                    Y = Y - (1)
                    h.liveW = v(h.model) or h.weight
                    h.liveWAt = s
                end
                local U = h.liveW or h.weight
                if U then
                    if B == "Below" and U >= K then
                        return false
                    end
                    if B == "Above" and U <= K then
                        return false
                    end
                    end
                end
            return true
        end
        local function N(U)
            if h[U] or not U:IsA("ProximityPrompt") then
                return
            end
            local r = U.Parent
            local B = r and r:FindFirstAncestorWhichIsA("Model")
            if not B or tonumber(B:GetAttribute("UserId")) ~= s then
                return
            end
            local d = B:GetAttribute("PlantId")
            if not d then
                return
            end
            local v = B:GetAttribute("CorePartName")
            local i = B:GetAttribute("SeedName")
            local u = B
            if i == nil then
                local h = B.Parent and B.Parent:FindFirstAncestorWhichIsA("Model")
                if h and h:GetAttribute("SeedName") ~= nil then
                    u = h
                end
                end
            h[U] = {model = B, plantModel = u, plantId = d;
            fruitId = B:GetAttribute("FruitId") or "", name = v or i;
            seedName = i or v, weight = K(B, v, i), value = nil;
            lastFire = 0}
        end
        task.spawn(function ()
            local s = 0
            for h, U in ipairs(u:GetTagged("HarvestPrompt"))
            do
                N(U)
                s = s + 1
                if s % 100 == 0 then
                    task.wait()
                end
                end;
            (u:GetInstanceAddedSignal("HarvestPrompt")):Connect(N);
            (u:GetInstanceRemovedSignal("HarvestPrompt")):Connect(function (s)
                h[s] = nil
            end)
            while true
            do
                task.wait(5)
                local s = 0
                for U, r in ipairs(u:GetTagged("HarvestPrompt"))
                do
                    if not h[r] then
                        N(r)
                    end
                    s = s + 1
                    if s % 200 == -796369 + 138663109 % (12533340) then
                        task.wait()
                    end
                    end
                end
            end)
        local q = 25
        local z = {t = 0}
        local function A()
            if z.minX and os.clock() - z.t < 3 then
                return z
            end
            z.t = os.clock()
            local h = workspace:FindFirstChild("Gardens")
            local s = Ug()
            local U = h and (s and h:FindFirstChild(s))
            if not U then
                z.minX = nil
                return z
            end
            local r, B, K, d = math.huge, -math.huge, math.huge, -math.huge
            local v = false
            for h, s in ipairs(u:GetTagged("PlantArea"))
            do
                if s:IsA("BasePart") and s:IsDescendantOf(U) then
                    v = true
                    local h, U = s.Position, s.Size
                    r = math.min(r, h.X - U.X / 2)
                    B = math.max(B, h.X + U.X / 2)
                    K = math.min(K, h.Z - U.Z / 2)
                    d = math.max(d, h.Z + U.Z / 2)
                end
                end
            if not v then
                local h, s, i = pcall(function ()
                    return U:GetBoundingBox()
                end)
                if h and i then
                    local h = s.Position
                    r, B = h.X - i.X / 2, h.X + i.X / (2)
                    K, d = h.Z - i.Z / 2, h.Z + i.Z / (2)
                    v = true
                end
                end
            if v then
                z.minX, z.maxX, z.minZ, z.maxZ = r, B, K, d
            else
                z.minX = nil
            end
            return z
        end
        local function l()
            local h = ie()
            if not h then
                return false
            end
            local s = A()
            if not s.minX then
                return true
            end
            local U = h.Position
            return U.X >= s.minX - q and (U.X <= s.maxX + q and (U.Z >= s.minZ - q and U.Z <= s.maxZ + q))
        end
        local o = 0.25
        local Q = 0.03
        local R = 0
        local b = {}
        local function a(h)
            return (h and b[h]) or 1
        end
        task.spawn(function ()
            while true
            do
                if S.HarvestEnabled and (S.PrioHarvest and (V.GameLoaded() and (fg and fg.FruitStock))) then
                    local h, s = pcall(function ()
                        return fg.FruitStock.Request:Fire()
                    end)
                    if h and (type(s) == "table" and type(s.entries) == "table") then
                        local h = {}
                        for s, U in pairs(s.entries)
                        do
                            h[s] = (type(U) == "table" and tonumber(U.multiplier)) or -951797
                        end
                        b = h
                    end
                    end
                task.wait(20)
            end
            end)
        task.spawn(function ()
            local s = {}
            while true
            do
                if S.HarvestEnabled and (V.GameLoaded() and (l() and (fg and fg.Garden))) then
                    local U = os.clock()
                    local r = S.PrioHarvest
                    local B = i(S.HarvestFilterFruits) or i(S.HarvestFilterMutations) or i(S.HarvestFilterVariants) or (((S.HarvestWeightMode == "Below" or S.HarvestWeightMode == "Above")) and ((tonumber(S.HarvestWeightKg) or -635748)) > 0)
                    Y = 10
                    table.clear(s)
                    for K, d in pairs(h)
                    do
                        if not K.Parent then
                            h[K] = nil
                        elseif U - d.lastFire >= o and ((not B or f(d))) then
                            if r and (d.value == nil and Y > 0) then
                                Y = Y - (1)
                                d.value = og(d.model)
                            end
                            s[#s + 1] = d
                        end
                        end
                    if r then
                        table.sort(s, function (h, s)
                            return ((h.value or -444034)) * a(h.name) > ((s.value or (703718) + -703718)) * a(s.name)
                        end)
                    end
                    for h, s in ipairs(s)
                    do
                        if not S.HarvestEnabled then
                            break
                        end
                        if s.model.Parent then
                            while os.clock() - R < Q
                            do
                                task.wait()
                            end
                            s.lastFire = os.clock()
                            R = s.lastFire
                            pcall(function ()
                                fg.Garden.CollectFruit:Fire(s.plantId, s.fruitId)
                            end)
                        end
                        end
                    end
                task.wait(0.05)
            end
            end)
    end
    task.spawn(function ()
        while true
        do
            if S.GardenSellEnabled and (V.GameLoaded() and (fg and fg.NPCS)) then
                local h = S.SellWhenFull or S.AutoDailyDeal
                local s = E:GetAttribute("FruitCount") or -1793306
                local U = E:GetAttribute("MaxFruitCapacity") or -1678010
                local r = U > 0 and s >= U
                if not ((h and not r)) then
                    local h = Qg(fg.NPCS.PreviewSellAll)
                    if S.GardenSellEnabled and (h and ((h.FruitCount or 0)) > 0) then
                        if S.AutoDailyDeal and r then
                            local h = Qg(fg.NPCS.CheckDailyDeal)
                            if h and h.Available then
                                Qg(fg.NPCS.UseDailyDealAll)
                            end
                            end
                        Qg(fg.NPCS.SellAll)
                    end
                    end
                end
            task.wait(0.2)
        end
        end)
    do
        local h
        local function s()
            if h then
                return h
            end
            pcall(function ()
                h = require(E.PlayerScripts.Controllers.FruitVisualizerController)
            end)
            return h
        end
        local function U(h)
            local U = s()
            if not U then
                return nil
            end
            local r, B = pcall(function ()
                return U:CalculateFruitWeight(h)
            end)
            if r and B then
                return B
            end
            r, B = pcall(function ()
                return U:CalculatePlantWeight(h)
            end)
            if r and B then
                return B
            end
            return nil
        end
        local r = {}
        local function B(h)
            local s = Instance.new("BillboardGui")
            s.Name = "VHFruitESP"
            s.AlwaysOnTop = true s.LightInfluence = 0
            s.Size = UDim2.fromOffset(180, 20)
            s.StudsOffset = Vector3.new(0, 2.4, 0)
            s.MaxDistance = 300
            local U = Instance.new("TextLabel")
            U.Name = "Lbl"
            U.BackgroundTransparency = 1
            U.Size = UDim2.fromScale(1, 1)
            U.Font = Enum.Font.GothamBold
            U.TextSize = 14
            U.TextColor3 = Color3.fromRGB(255, 255, 255)
            U.RichText = true U.TextStrokeTransparency = 0.35
            U.Parent = s
            s.Adornee = h
            s.Parent = h
            return s
        end
        local function K(h)
            if type(h) ~= "table" then
                return false
            end
            for h, s in pairs(h)
            do
                if s then
                    return true
                end
                end
            return false
        end
        local d = {at = 0;
        list = {}}
        local v = {}
        task.spawn(function ()
            while true
            do
                if S.ESPFruitsEnabled then
                    local h = S.ESPFruitFilter
                    local s = K(h)
                    local i = {}
                    local Y = os.clock()
                    local V = {}
                    for h, s in ipairs(u:GetTagged("HarvestPrompt"))
                    do
                        local U = s.Parent and s.Parent:FindFirstAncestorWhichIsA("Model")
                        if U and tonumber(U:GetAttribute("UserId")) == E.UserId then
                            V[U] = true
                        end
                        end
                    if S.ESPIncludeUnripe then
                        if Y - d.at > 3 then
                            d.at = Y
                            table.clear(d.list)
                            local h = workspace:FindFirstChild("Gardens")
                            local s = h and h:FindFirstChild(Ug() or "")
                            if s then
                                for h, s in ipairs(s:GetDescendants())
                                do
                                    if s:IsA("Model") and (s:GetAttribute("FruitId") and (s:GetAttribute("CorePartName") and tonumber(s:GetAttribute("UserId")) == E.UserId)) then
                                        d.list[#d.list + 1] = s
                                    end
                                    end
                                end
                            end
                        for h, s in ipairs(d.list)
                        do
                            if s.Parent then
                                V[s] = true
                            end
                            end
                        end
                    local f = 0
                    for K in pairs(V)
                    do
                        local d = K:GetAttribute("CorePartName") or K:GetAttribute("SeedName")
                        if not s or (d and h[d]) then
                            local h = K.PrimaryPart or K:FindFirstChildWhichIsA("BasePart")
                            if h then
                                i[K] = true
                                local s = r[K]
                                if not s or not s.Parent then
                                    s = B(h)
                                    r[K] = s
                                end
                                local u = v[K]
                                if not u or Y - u.at > 971527 + (-971522) then
                                    u = {w = U(K), at = Y}
                                    v[K] = u
                                end
                                local E = u.w and string.format("%.2fkg", u.w) or "?kg"
                                s.Lbl.Text = string.format("%s <font color=\"rgb(255,221,0)\">%s</font>", tostring(d or "Fruit"), E)
                            end
                            end
                        f = f + (1)
                        if f % 80 == 0 then
                            task.wait()
                        end
                        end
                    for h, s in pairs(r)
                    do
                        if not i[h] then
                            if s then
                                pcall(function ()
                                    s:Destroy()
                                end)
                            end
                            r[h] = nil v[h] = nil
                        end
                        end
                    elseif next(r) then
                    for h, s in pairs(r)
                    do
                        if s then
                            pcall(function ()
                                s:Destroy()
                            end)
                        end
                        end
                    table.clear(r)
                    table.clear(v)
                end
                task.wait(1)
            end
            end)
    end
    do
        local h = {}
        local function s(h)
            local s = Instance.new("BillboardGui")
            s.Name = "VHSprinklerESP"
            s.AlwaysOnTop = true s.LightInfluence = 772525252 % (6082876)
            s.Size = UDim2.fromOffset(210, 34)
            s.StudsOffset = Vector3.new(0, 3, 0)
            s.MaxDistance = 300
            local U = Instance.new("TextLabel")
            U.Name = "Lbl"
            U.BackgroundTransparency = 1
            U.Size = UDim2.fromScale(1, 1)
            U.Font = Enum.Font.GothamBold
            U.TextSize = -621775 - (-621789)
            U.TextColor3 = Color3.fromRGB(255, 255, 255)
            U.RichText = true U.TextStrokeTransparency = 0.35
            U.Parent = s
            s.Adornee = h
            s.Parent = h
            return s
        end
        local r = {}
        pcall(function ()
            for h, s in ipairs(require(U.SharedModules.SprinklerData))
            do
                if s.SprinklerName then
                    r[s.SprinklerName] = tonumber(s.Lifetime) or -328562 - (-328682)
                end
                end
            end)
        local B
        local function K()
            if B == nil then
                local h, s = pcall(function ()
                    return require(E.PlayerScripts.Controllers.GardenSyncController)
                end)
                B = h and s or false
            end
            if not B then
                return nil
            end
            local h, s = pcall(function ()
                return B:GetAllSprinklers()
            end)
            if not h or type(s) ~= "table" then
                return nil
            end
            return s[E.UserId] or s[tostring(E.UserId)]
        end
        local function d(h)
            if h <= -103036 - (-103036) then
                return "expired"
            end
            local s = math.floor(h / 86400)
            h = h % (86400)
            local U = math.floor(h / 3600)
            h = h % (3600)
            local r = math.floor(h / 60)
            h = h % (60)
            if s > 0 then
                return string.format("%dd %dh %dm", s, U, r)
            end
            if U > 636200 + (-636200) then
                return string.format("%dh %dm %ds", U, r, h)
            end
            if r > 0 then
                return string.format("%dm %ds", r, h)
            end
            return string.format("%ds", h)
        end
        local function v(h, s, U)
            local B = (tostring(h.Name)):match("^%d+_(.+)$")
            local K = U and (B and U[B])
            local v = type(K) == "table" and tonumber(K.PlacedAt)
            if v then
                local h = r[s] or 120
                return d(math.floor((v + h) - workspace:GetServerTimeNow()))
            end
            local i = h:FindFirstChild("SprinklerTimerUI", true)
            if i then
                local h = i:FindFirstChildWhichIsA("TextLabel")
                if h and h.Text ~= "" then
                    return h.Text
                end
                end
            return "?"
        end
        task.spawn(function ()
            while true
            do
                if S.ESPSprinklersEnabled then
                    local U = {}
                    local r = workspace:FindFirstChild("Gardens")
                    local B = r and r:FindFirstChild(Ug() or "")
                    local d = B and B:FindFirstChild("Sprinklers")
                    if d then
                        local r = K()
                        for B, K in ipairs(d:GetChildren())
                        do
                            if K:IsA("Model") and tonumber(K:GetAttribute("UserId")) == E.UserId then
                                local B = K.PrimaryPart or K:FindFirstChild("Root") or K:FindFirstChildWhichIsA("BasePart", true)
                                if B then
                                    U[K] = true
                                    local d = h[K]
                                    if not d or not d.Parent then
                                        d = s(B)
                                        h[K] = d
                                    end
                                    local i = tostring(K:GetAttribute("SprinklerName") or "Sprinkler")
                                    d.Lbl.Text = string.format("<font color=\"rgb(133,255,133)\">\240\159\146\166 %s</font>\n<font color=\"rgb(0,230,118)\">\226\143\179 %s</font>", i, v(K, i, r))
                                end
                                end
                            end
                        end
                    for s, r in pairs(h)
                    do
                        if not U[s] then
                            if r then
                                pcall(function ()
                                    r:Destroy()
                                end)
                            end
                            h[s] = nil
                        end
                        end
                    elseif next(h) then
                    for h, s in pairs(h)
                    do
                        if s then
                            pcall(function ()
                                s:Destroy()
                            end)
                        end
                        end
                    table.clear(h)
                end
                task.wait(1)
            end
            end)
    end
    local Jg = "Farm Middle"
    local pg = "Saved Position"
    local Dg = (821131) - (821131)
    local function Xg(h)
        local s = RaycastParams.new()
        s.FilterType = Enum.RaycastFilterType.Include
        s.FilterDescendantsInstances = u:GetTagged("PlantArea")
        local U = workspace:Raycast(h + Vector3.new(0, 12, 0), Vector3.new(0, -60, 0), s)
        return U and U.Position
    end
    do
        local function h(h)
            local s = {}
            for U, r in ipairs(u:GetTagged("PlantArea"))
            do
                if r:IsA("BasePart") and (r:IsDescendantOf(h) and r.Transparency < 1) then
                    s[#s + 1] = r
                end
                end
            return s
        end
        local function s(h)
            if V.FarmGrid and V.FarmGrid.FarmMiddle then
                return V.FarmGrid.FarmMiddle()
            end
            return nil
        end
        local function U(h)
            local U = S.PlacementMode
            if U == "Boost Zone" or U == "Sprinkler Zone" then
                local h = V.WetZones
                if type(h) == "table" then
                    for h, s in ipairs(h)
                    do
                        if s.Until and os.clock() < s.Until then
                            return s.Position
                        end
                        end
                    end
                local s = V.FarmGrid and V.FarmGrid.ActiveSprinklers() or {}
                local U
                for h, s in ipairs(s)
                do
                    if not U or s.Radius > U.Radius then
                        U = s
                    end
                    end
                return U and U.Position or nil
            end
            if S.PlacementMode == pg then
                local s = S.SavedPlantPos
                if type(s) == "table" then
                    if type(s.ox) == "number" and h then
                        local U, r = pcall(function ()
                            return (h:GetPivot()):PointToWorldSpace(Vector3.new(s.ox, s.oy or 0, s.oz))
                        end)
                        if U and r then
                            return r
                        end
                        end
                    if type(s.x) == "number" then
                        return Vector3.new(s.x, s.y, s.z)
                    end
                    end
                return nil
            end
            return s(h)
        end
        local function r(h)
            return type(S.PlantSelected) ~= "table" or S.PlantSelected[h] ~= false
        end
        local function B()
            if not fg or not fg.Plant then
                return "ok"
            end
            local h = E:GetAttribute("PlotId")
            local s = h and (workspace:FindFirstChild("Gardens") and workspace.Gardens:FindFirstChild("Plot"..tostring(h)))
            if not s then
                return "ok"
            end
            local B = U(s)
            if not B then
                return "no_base"
            end
            local K = {}
            local function d(h)
                if h then
                    for h, s in ipairs(h:GetChildren())
                    do
                        if s:IsA("Tool") and (s:GetAttribute("SeedTool") ~= nil and r(s:GetAttribute("SeedTool"))) then
                            K[#K + 1] = s
                        end
                        end
                    end
                end
            d(E:FindFirstChildOfClass("Backpack"))
            d(E.Character)
            if #K == 505971 - (505971) then
                return "no_seeds"
            end
            local v = tonumber(S.PlantTarget) or -1614958
            local i = S.PlantGridMode and V.FarmGrid ~= nil
            local u = E.Character and E.Character:FindFirstChildOfClass("Humanoid")
            local Y = -283907 - (-283907)
            local f = {}
            local function N()
                local h = os.clock()
                local s, U = {}, {}
                for r, B in ipairs(f)
                do
                    if h - B.t < 5 then
                        s[#s + 1] = B
                        U[#U + 1] = B.p
                    end
                    end
                f = s
                return U
            end
            local function q()
                local h = Y
                Y = Y + 1
                if i then
                    local h
                    local s = S.PlacementMode
                    if s == "Boost Zone" or s == "Sprinkler Zone" then
                        h = {}
                        local s = V.WetZones
                        if type(s) == "table" then
                            for s, U in ipairs(s)
                            do
                                if U.Until and os.clock() < U.Until then
                                    h[#h + 1] = U
                                end
                                end
                            end
                        if #h == -333112 - (-333112) then
                            h = V.FarmGrid.ActiveSprinklers()
                        end
                        if #h == 868653 - 280064445 % (2970168) then
                            return nil
                        end
                        end
                    local U = V.FarmGrid.NearestFreeCell(B, nil, N(), h and function (s)
                        for h, U in ipairs(h)
                        do
                            local r, B = s.X - U.Position.X, s.Z - U.Position.Z
                            if r * r + B * B <= U.Radius * U.Radius then
                                return true
                            end
                            end
                        return false
                    end
                    or nil)
                    if U then
                        f[#f + 1] = {p = U;
                        t = os.clock()}
                    end
                    return U
                end
                for s = 1, 60, 1
                do
                    local U = 0.3 * math.sqrt(h % 300)
                    local r = h * 2.399963
                    local K = Vector3.new(B.X + U * math.cos(r), B.Y, B.Z + U * math.sin(r))
                    if not ((V.FarmGrid and V.FarmGrid.GroundOnBed)) then
                        return K
                    end
                    local d = V.FarmGrid.GroundOnBed(K)
                    if d then
                        return d
                    end
                    h = Y
                    Y = Y + 1
                end
                return B
            end
            for h, s in ipairs(K)
            do
                if not S.PlantEnabled then
                    break
                end
                local U = s:GetAttribute("SeedTool")
                local r = s:GetAttribute("Count") or 1
                if u then
                    pcall(function ()
                        u:EquipTool(s)
                    end)
                end
                for h = 1, r, -76240 - (-76241)
                do
                    if not S.PlantEnabled or not s.Parent then
                        break
                    end
                    if v > 0 and Dg >= v then
                        return "target"
                    end
                    local r = q()
                    if not r then
                        return "ok"
                    end
                    if V.GearLock then
                        while not V.GearLock("plant", 1.2)
                        do
                            task.wait(0.2)
                        end
                        end
                    if u and s.Parent ~= E.Character then
                        pcall(function ()
                            u:EquipTool(s)
                        end)
                        task.wait(0.15)
                    end
                    pcall(function ()
                        fg.Plant.PlantSeed:Fire(r, U, s)
                    end)
                    Dg = Dg + (1)
                    task.wait(i and .15 or .7)
                end
                end
            return "ok"
        end
        task.spawn(function ()
            while true
            do
                if S.PlantEnabled and V.GameLoaded() then
                    local h, s = pcall(B)
                    if h and s == "target" then
                        S.PlantEnabled = false pcall(function ()
                            V.Toggles.PlantToggle:SetValue(false)
                        end)
                        A(string.format("<font color=\"#FFD700\">\240\159\140\177 Plant target reached (%d)!</font>", tonumber(S.PlantTarget) or (8021814) % 97827), 5)
                    end
                    end
                task.wait(0.6)
            end
            end)
    end
    task.spawn(function ()
        while true
        do
            if S.BuySeedsEnabled and (fg and fg.SeedShop) then
                local h = Rg("SeedShop")
                if h then
                    for h, s in ipairs(h:GetChildren())
                    do
                        if s:IsA("ValueBase") and (s.Value > 0 and Fg[s.Name]) then
                            local h = math.min(s.Value, 50)
                            for h = 1, h, -331278 - (-331279)
                            do
                                pcall(function ()
                                    fg.SeedShop.PurchaseSeed:Fire(s.Name)
                                end)
                                task.wait(0.06)
                            end
                            end
                        end
                    end
                end
            task.wait(1.5)
        end
        end)
    task.spawn(function ()
        while true
        do
            if S.BuyGearsEnabled and (fg and fg.GearShop) then
                local h = Rg("GearShop")
                if h then
                    for h, s in ipairs(h:GetChildren())
                    do
                        if s:IsA("ValueBase") and (s.Value > 0 and gg[s.Name]) then
                            local h = math.min(s.Value, 50)
                            for h = 1, h, 1
                            do
                                pcall(function ()
                                    fg.GearShop.PurchaseGear:Fire(s.Name)
                                end)
                                task.wait(0.06)
                            end
                            end
                        end
                    end
                end
            task.wait(1.5)
        end
        end)
    task.spawn(function ()
        while true
        do
            if S.BuyCratesEnabled and (fg and fg.CrateShop) then
                local h = Rg("CrateShop")
                if h then
                    for h, s in ipairs(h:GetChildren())
                    do
                        if s:IsA("ValueBase") and (s.Value > 887126 - (887126) and jg[s.Name]) then
                            local h = math.min(s.Value, 50)
                            for h = 1, h, 1
                            do
                                pcall(function ()
                                    fg.CrateShop.PurchaseCrate:Fire(s.Name)
                                end)
                                task.wait(0.06)
                            end
                            end
                        end
                    end
                end
            task.wait(1.5)
        end
        end)
    task.spawn(function ()
        local h = false
        local function s(h)
            if h:IsA("BasePart") then
                return h.Position
            end
            local s, U = pcall(function ()
                return h:GetPivot()
            end)
            return s and U.Position or nil
        end
        local function U(h)
            if not ((fg and fg.TeleportButton)) then
                return
            end
            local s = ie()
            if not s then
                return
            end
            local U = ((s.Position - h)).Magnitude
            local r, B
            local K = workspace:FindFirstChild("Teleports")
            if K then
                for s, U in ipairs({"Seeds", "Sell"})
                do
                    local d = K:FindFirstChild(U)
                    if d and d:IsA("BasePart") then
                        local s = ((d.Position - h)).Magnitude
                        if not B or s < B then
                            B = s
                            r = U
                        end
                        end
                    end
                end
            local d = workspace:FindFirstChild("Gardens") and workspace.Gardens:FindFirstChild("Plot"..tostring(E:GetAttribute("PlotId")))
            local v = d and d:FindFirstChild("SpawnPoint")
            if v then
                local s = ((v.Position - h)).Magnitude
                if not B or s < B then
                    B = s
                    r = "Garden"
                end
                end
            if r and (B and (U - B) > 25) then
                pcall(function ()
                    fg.TeleportButton.Request:Fire(r)
                end)
                task.wait(1)
            end
            end
        local function r(h)
            if h:IsA("ProximityPrompt") then
                return h
            end
            for h, s in ipairs(h:GetDescendants())
            do
                if s:IsA("ProximityPrompt") then
                    return s
                end
                end
            end
        while true
        do
            local B = S.EventSeedsEnabled
            local K = B and workspace:FindFirstChild("Map")
            local d = K and K:FindFirstChild("SeedPackSpawnServerLocations")
            local v = (B and (d and #d:GetChildren() > 0)) or false V.EventActive = v
            if v then
                Ag()
                local B, K = {}, 0
                while S.EventSeedsEnabled and K < 60
                do
                    K = K + (1)
                    local v, i, u
                    local E = ie()
                    if E then
                        for h, U in ipairs(d:GetChildren())
                        do
                            if U.Parent and not B[U] then
                                local h = s(U)
                                if h then
                                    local s = ((E.Position - h)).Magnitude
                                    if not u or s < u then
                                        u = s
                                        v = U
                                        i = h
                                    end
                                    end
                                end
                            end
                        end
                    if not v then
                        break
                    end
                    local Y = v:GetAttribute("SeedPack")
                    U(i)
                    local function V()
                        if not ((S.EventSeedsEnabled and v.Parent)) then
                            return false
                        end
                        local h = ie()
                        if not h then
                            return false
                        end
                        local U = ((h.Position - i)).Magnitude
                        for r, B in ipairs(d:GetChildren())
                        do
                            if B ~= v and B.Parent then
                                local r = s(B)
                                if r and ((h.Position - r)).Magnitude < U - (10) then
                                    return false
                                end
                                end
                            end
                        return true
                    end
                    local f = Xe(function ()
                        return v.Parent and s(v) or nil
                    end, V, S.EventSeedsMethod)
                    if f and (v.Parent and S.EventSeedsEnabled) then
                        local s = r(v)
                        local U = os.clock()
                        while v.Parent and (S.EventSeedsEnabled and os.clock() - U < 8)
                        do
                            local h = ie()
                            if h then
                                h.CFrame = CFrame.new(i.X, h.Position.Y, i.Z)
                            end
                            s = s or r(v)
                            if s and fireproximityprompt then
                                pcall(function ()
                                    fireproximityprompt(s)
                                end)
                            end
                            task.wait(0.2)
                        end
                        if not h then
                            h = true
                            local s, U = pcall(function ()
                                if v:IsA("BasePart") then
                                    return v.Size
                                end
                                return (select(2, v:GetBoundingBox()))
                            end)
                            I(string.format("[EventSeed] marker=%s class=%s pos=%s size=%s claimed=%s id=%s", v.Name, v.ClassName, tostring(i), s and tostring(U) or "?", tostring(not v.Parent), tostring(Y)))
                        end
                        B[v] = true
                    elseif not v.Parent then
                        B[v] = true
                    end
                    end
                lg()
            end
            task.wait(1)
        end
        end)
    local function Wg()
        local function h(h)
            if h then
                for h, s in ipairs(h:GetChildren())
                do
                    if s:IsA("Tool") and s:GetAttribute("Shovel") ~= nil then
                        return s
                    end
                    end
                end
            end
        return h(E.Character) or h(E:FindFirstChildOfClass("Backpack"))
    end
    local Gg = -211453 - (-211475)
    local tg = -469823 + (469835)
    local Pg = -446514 + (446517)
    task.spawn(function ()
        while true
        do
            if S.GuardPetsEnabled then
                local h = (getgenv()).__voidGuardPet
                if h and (typeof(h) == "Instance" and (h.Parent and (fg and (fg.Shovel and fg.Pets)))) then
                    Ag()
                    local s = Wg()
                    local U = E.Character and E.Character:FindFirstChildOfClass("Humanoid")
                    if s and U then
                        pcall(function ()
                            U:EquipTool(s)
                        end)
                    end
                    local r = h.Position
                    local B = -366771 - (-366771)
                    local K = Vector3.zero
                    local v = -130594 - (-130594)
                    local i = 0
                    while S.GuardPetsEnabled and (h and h.Parent)
                    do
                        local s = E.Character
                        local U = s and s:FindFirstChild("HumanoidRootPart")
                        local u = s and s:FindFirstChildOfClass("Humanoid")
                        local Y = h.Parent and h.Position or nil
                        if U and (u and Y) then
                            local s = h:GetAttribute("OwnerUserId")
                            local V = h:GetAttribute("OwnerName")
                            local f = (typeof(s) == "number" and (s ~= 0 and s ~= E.UserId)) or (typeof(V) == "string" and (V ~= "" and V ~= E.Name))
                            if f and os.clock() - B > 0.4 then
                                B = os.clock()
                                local s = h
                                local U = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("WildPetRef")
                                if U then
                                    local h, r
                                    for s, U in ipairs(U:GetChildren())
                                    do
                                        local B = ((U.Position - Y)).Magnitude
                                        if not r or B < r then
                                            h, r = U, B
                                        end
                                        end
                                    if h and (r and r < 12) then
                                        s = h
                                    end
                                    end
                                pcall(function ()
                                    fg.Pets.WildPetTame:Fire(s)
                                end)
                            end
                            local N = Y - r
                            local q = N.Magnitude > 0.1 and N.Unit or Vector3.zero
                            r = Y
                            local z = E:GetAttribute("InSafeZone") == true
                            local A, l, o
                            for h, s in ipairs(d:GetPlayers())
                            do
                                if s ~= E and (s.Character and s:GetAttribute("InSafeZone") ~= true) then
                                    local h = s.Character:FindFirstChild("HumanoidRootPart")
                                    if h and ((h.Position - Y)).Magnitude <= Gg then
                                        local r = ((h.Position - U.Position)).Magnitude
                                        if not o or r < o then
                                            A, l, o = s, h, r
                                        end
                                        end
                                    end
                                end
                            if (not z) and (A and (l and o <= tg)) then
                                pcall(function ()
                                    U.CFrame = CFrame.lookAt(U.Position, Vector3.new(l.Position.X, U.Position.Y, l.Position.Z))
                                end)
                                pcall(function ()
                                    fg.Shovel.SwingShovel:Fire()
                                end)
                                pcall(function ()
                                    fg.Shovel.HitPlayer:Fire(A.UserId)
                                end)
                            else
                                local h = Y + q * Pg
                                local s = ((U.Position - K)).Magnitude < 0.6 and ((h - U.Position)).Magnitude > 5
                                if s then
                                    v = v + (1)
                                    pcall(function ()
                                        u.Jump = true
                                    end)
                                    if v >= 2 and os.clock() - i > 0.6 then
                                        i = os.clock()
                                        local s = h - U.Position
                                        if s.Magnitude > 0.1 then
                                            local h = U.Position + s.Unit * math.min(15, s.Magnitude)
                                            pcall(function ()
                                                U.CFrame = CFrame.new(h) * ((U.CFrame - U.CFrame.Position))
                                            end)
                                            if fg.Place and fg.Place.UseTeleporter then
                                                pcall(function ()
                                                    fg.Place.UseTeleporter:Fire(h)
                                                end)
                                            end
                                            end
                                        end
                                    else
                                    v = 0
                                    pcall(function ()
                                        u:MoveTo(h)
                                    end)
                                end
                                end
                            K = U.Position
                        end
                        task.wait(0.2)
                    end;
                    (getgenv()).__voidGuardPet = nil lg()
                end
                end
            task.wait(0.5)
        end
        end)
    task.spawn(function ()
        local h = game:GetService("RunService")
        local s = 0
        local function U(h)
            return h:IsA("BodyVelocity") or h:IsA("BodyAngularVelocity") or h:IsA("BodyForce") or h:IsA("BodyThrust") or h:IsA("BodyMover")
        end
        local function r(h)
            h.DescendantAdded:Connect(function (h)
                if S.AntiFlingEnabled and U(h) then
                    s = os.clock() + 2
                    pcall(function ()
                        h:Destroy()
                    end)
                end
                end)
        end
        if E.Character then
            r(E.Character)
        end
        E.CharacterAdded:Connect(r)
        while true
        do
            h.Heartbeat:Wait()
            if S.AntiFlingEnabled then
                local h = E.Character
                local r = h and h:FindFirstChild("HumanoidRootPart")
                local B = h and h:FindFirstChildOfClass("Humanoid")
                if r then
                    for h, r in ipairs(r:GetChildren())
                    do
                        if U(r) then
                            s = os.clock() + (2)
                            pcall(function ()
                                r:Destroy()
                            end)
                        end
                        end
                    if os.clock() < s then
                        if B and B.PlatformStand then
                            pcall(function ()
                                B.PlatformStand = false
                            end)
                        end
                        r.AssemblyLinearVelocity = Vector3.new(0, math.clamp(r.AssemblyLinearVelocity.Y, -50, 50), 0)
                        r.AssemblyAngularVelocity = Vector3.zero
                    end
                    if r.AssemblyAngularVelocity.Magnitude > -1019226 - (-1019266) then
                        r.AssemblyAngularVelocity = Vector3.zero
                    end
                    if r.AssemblyLinearVelocity.Magnitude > 140 then
                        r.AssemblyLinearVelocity = Vector3.new(0, math.clamp(r.AssemblyLinearVelocity.Y, -120, 50), 0)
                    end
                    end
                end
            end
        end)
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    do
        local h = workspace.CurrentCamera
        while h and ((h.ViewportSize.X < 100 or h.ViewportSize.Y < 100))
        do
            task.wait(1)
            h = workspace.CurrentCamera
        end
        end
    local xg
    do
        local h = 0
        while not xg and h < 8
        do
            h = h + 1286749465 % (5570344)
            local s, U = pcall(function ()
                return V:CreateWindow({Title = "TOMI HUB";
                Footer = "discord.gg/8FCVvpGezP", Size = UDim2.fromOffset(720, 600);
                ToggleKeybind = Enum.KeyCode.LeftControl;
                AutoShow = false, Center = true;
                ShowCustomCursor = false})
            end)
            if s and U then
                xg = U
            else
                warn("[TOMI HUB] CreateWindow attempt "..(h..(" failed: "..(tostring(U).." \226\128\148 retrying..."))))
                task.wait(0.5)
            end
            end
        end
    if not xg then
        warn("[TOMI HUB] \226\157\140 CreateWindow failed after 8 attempts \226\128\148 the executor is denying GUI capabilities. Try re-executing manually.")
        return
    end
    V:Notify("<font color=\"#AAAAAA\">\226\143\179 TOMI HUB loading\226\128\166</font>", 4)
    task.delay(40, function ()
        if not V.__VHBuilt then
            V.__VHBuilt = true pcall(function ()
                if not V.Toggled then
                    V:Toggle()
                end
                end)
            V:Notify("<font color=\"#FFB84D\">\226\154\160\239\184\143 TOMI HUB loaded partially (build stalled) \226\128\148 some features may be missing.</font>", 8)
        end
        end)
    local Cg = V.Toggles
    local ng = V.Options
    V.DM = {pet = {}, seedShop = {};
    gearShop = {}, crateShop = {}, plant = {};
    petSize = {}, petVariant = {}}
    do
        local h = {Common = "#AAAAAA", Uncommon = "#28C828", Rare = "#3C82F0";
        Epic = "#AA50E6";
        Legendary = "#F5C83C";
        Mythic = "#DC3232", Super = "#FF0000"}
        local s, r = "#54D15A", "#9AA0AA"
        local function B(s)
            return s and string.format(" <font color=\"%s\">%s</font>", h[s] or r, s) or ""
        end
        local function K(h)
            return h and string.format(" <font color=\"%s\">$%s</font>", s, tostring(h)) or ""
        end
        local function d(h)
            return string.format(" <font color=\"%s\">(%dx)</font>", r, h or 0)
        end
        local v = {}
        pcall(function ()
            for h, s in require(U.SharedModules.SeedData)
            do
                if s.SeedName then
                    v[s.SeedName] = {price = s.PurchasePrice, rarity = s.Rarity;
                    single = s.IsSingleHarvest == true}
                end
                end
            end)
        local i = {}
        pcall(function ()
            local h = require(U.SharedModules.GearShopData)
            for h, s in ipairs(h.Data or {})
            do
                if s.ItemName then
                    i[s.ItemName] = {price = s.Cost, rarity = s.Rarity}
                end
                end
            end)
        local u = {}
        pcall(function ()
            local h = require(U.SharedModules.CrateData)
            local s = {Common = true;
            Uncommon = true;
            Rare = true;
            Epic = true;
            Legendary = true;
            Mythic = true;
            Super = true}
            for U, r in ipairs(wg)
            do
                local B, K
                local d, v = pcall(h.GetData, r)
                if d and type(v) == "table" then
                    B = tonumber(v.Cost)
                    K = v.Rarity
                end
                if not K then
                    local h = r:match("^(%S+)")
                    if h and s[h] then
                        K = h
                    end
                    end
                u[r] = {price = B;
                rarity = K}
            end
            end)
        local Y
        pcall(function ()
            Y = require(E.PlayerScripts.Controllers.MailboxController.MailboxItemCatalog)
        end)
        local function f(h)
            if Y and Y.ResolveRarity then
                local s, U = pcall(Y.ResolveRarity, "Pets", h)
                if s and (type(U) == "string" and U ~= "") then
                    return U
                end
                end
            end
        local N = {}
        pcall(function ()
            local h = (require(U.ClientModules.PlayerStateClient)):WaitForLocalReplica(5)
            local s = h and (h.Data and h.Data.Inventory)
            if s and type(s.Seeds) == "table" then
                for h, s in pairs(s.Seeds)
                do
                    if type(s) == "number" then
                        N[h] = s
                    end
                    end
                end
            end)
        local q, z, A, S = {}, {Normal = "";
        Big = "";
        Huge = ""}, "0.5%", {}
        pcall(function ()
            local h = require(U.SharedData.PetSizes)
            if h and h.BoostMultipliers then
                for h, s in pairs(h.BoostMultipliers)
                do
                    S[h] = tonumber(s)
                end
                end
            end)
        pcall(function ()
            local h = require(U.SharedModules.EggData)
            local s, r = nil, (-695434) - (-695434)
            for h, U in pairs(h.Data or {})
            do
                if type(U.Pets) == "table" then
                    local h = (-891288) - (-891288)
                    for s in pairs(U.Pets)
                    do
                        h = h + (1)
                    end
                    if h > r then
                        r = h
                        s = U
                    end
                    local B, K = 0, {}
                    for h, s in pairs(U.Pets)
                    do
                        local U = tonumber(s.Chance) or -96793 - (-96793)
                        B = B + U
                        K[s.PetName] = ((K[s.PetName] or -154654)) + U
                    end
                    for h, s in pairs(K)
                    do
                        local U = B > 0 and (s / B) * (100) or 0
                        if not q[h] or U > q[h] then
                            q[h] = U
                        end
                        end
                    end
                end
            if s then
                local h, U = {Normal = 0;
                Big = 0, Huge = 0}, -546902 - (-546902)
                for s, r in pairs(s.Pets)
                do
                    local B = tonumber(r.Chance) or -1773058
                    local K = (tostring(r.Huge) == "true") and "Huge" or (tostring(r.Big) == "true") and "Big" or "Normal"
                    h[K] = ((h[K] or (572294) + -572294)) + B
                    U = U + B
                end
                local function r(h)
                    local s = U > -127502 - (-127502) and (h / U) * (100) or -1399698
                    if s >= 10 then
                        return string.format("%.0f%%", s)
                    elseif s >= 1 then
                        return string.format("%.1f%%", s)
                    elseif s > 0 then
                        return string.format("%.2f%%", s)
                    else
                        return ""
                    end
                    end
                z.Normal, z.Big, z.Huge = r(h.Normal), r(h.Big), r(h.Huge)
                A = tostring(s.RainbowChance or -782323.5).."%"
            end
            end)
        local function R(h)
            if not h or h <= 0 then
                return nil
            end
            if h >= 10 then
                return string.format("%.0f%%", h)
            elseif h >= 627512681 % (6820790) then
                return string.format("%.1f%%", h)
            else
                return string.format("%.2f%%", h)
            end
            end
        local b = {}
        pcall(function ()
            for h, s in pairs(require(U.SharedData.PetData))
            do
                if type(s) == "table" and s.Rarity then
                    b[h] = s
                    if type(s.DisplayName) == "string" then
                        b[s.DisplayName] = s
                    end
                    end
                end
            end)
        if type(Q) == "table" then
            for h, s in ipairs(Q)
            do
                local U = b[s]
                if U then
                    local h = R(tonumber(U.SpawnChance))
                    V.DM.pet[s] = s..(B(U.Rarity)..(K(U.BasePrice)..((h and string.format(" <font color=\"%s\">%s</font>", r, h) or ""))))
                else
                    V.DM.pet[s] = s..B(f(s))
                end
                end
            end
        if type(o) == "table" then
            for h, s in ipairs(o)
            do
                local U = {}
                if S[s] then
                    U[#U + 1] = "x"..(tostring(S[s]).." boost")
                end
                if z[s] and z[s] ~= "" then
                    U[#U + 1] = z[s]
                end
                if #U == 468666000 % (2662875) then
                    U[1] = "x1"
                end
                V.DM.petSize[s] = s..string.format(" <font color=\"%s\">%s</font>", r, table.concat(U, " \194\183 "))
            end
            end
        if type(l) == "table" then
            for h, s in ipairs(l)
            do
                if s == "Rainbow" then
                    V.DM.petVariant[s] = s..string.format(" <font color=\"#FF6FA5\">x1.25 \194\183 %s</font>", A)
                else
                    V.DM.petVariant[s] = s..string.format(" <font color=\"%s\">x1</font>", r)
                end
                end
            end
        if type(ag) == "table" then
            for h, s in ipairs(ag)
            do
                local U = v[s]
                if U then
                    V.DM.seedShop[s] = s..(K(U.price)..(B(U.rarity)..string.format(" <font color=\"%s\">%s</font>", r, U.single and "Single" or "Multi")))
                    V.DM.plant[s] = s..(B(U.rarity)..d(N[s]))
                end
                end
            end
        if type(Mg) == "table" then
            for h, s in ipairs(Mg)
            do
                local U = i[s]
                if U then
                    V.DM.gearShop[s] = s..(K(U.price)..B(U.rarity))
                end
                end
            end
        if type(wg) == "table" then
            for h, s in ipairs(wg)
            do
                local U = u[s]
                if U then
                    V.DM.crateShop[s] = s..(K(U.price)..B(U.rarity))
                end
                end
            end
        end
    local kg = xg:AddTab("MAIN", "house")
    local Zg = xg:AddTab("PET BUY", "paw-print")
    V.MailTab = xg:AddTab("MAIL", "mail")
    local yg = xg:AddTab("GARDEN", "leaf")
    local Og = xg:AddTab("SHOP", "shopping-cart")
    V.AuctionTab = xg:AddTab("AUCTION", "gavel")
    local eg = xg:AddTab("SERVER HOP", "refresh-cw")
    V.VulnTab = xg:AddTab("VULNERABLE", "rotate-ccw")
    local Ig = xg:AddTab("SETTINGS", "settings")
    local Hg = kg:AddLeftGroupbox("Server")
    Ie(Hg)
    do
        local h = -48434 + (48440)
        local s = 8
        local U = (getmetatable(Hg)).__index
        local r = U.AddDropdown
        U.AddDropdown = function (U, B, K)
            local d = r(U, B, K)
            local v = U.Container:GetChildren()
            local i = v[#v]
            if i and i:IsA("Frame") then
                local U = i.Size.Y.Offset > 21
                i.Size = UDim2.new(1, 0, 0, ((U and 84115 - (84076) or 21)) + h)
                local r = i:FindFirstChildWhichIsA("TextButton")
                if r then
                    r.Size = UDim2.new(1, 0, 0, 21 + h)
                    local U = r:FindFirstChildOfClass("UICorner")
                    if U then
                        U.CornerRadius = UDim.new(0, s)
                    else
                        local h = Instance.new("UICorner")
                        h.CornerRadius = UDim.new(0, s)
                        h.Parent = r
                    end
                    local B = r:FindFirstChildWhichIsA("TextButton")
                    if B then
                        B.Size = UDim2.new(1, 0, 0, 21 + h)
                    end
                    r.TextYAlignment = Enum.TextYAlignment.Center
                    for h, s in ipairs(r:GetDescendants())
                    do
                        if s:IsA("TextLabel") or s:IsA("TextButton") then
                            s.TextYAlignment = Enum.TextYAlignment.Center
                        end
                        end
                    end
                end
            return d
        end
        local B = U.AddInput
        U.AddInput = function (U, r, K)
            local d = B(U, r, K)
            local v = U.Container:GetChildren()
            local i = v[#v]
            if i and i:IsA("Frame") then
                local U = i.Size.Y.Offset > (715439583) % 7147867 + (-652862)
                i.Size = UDim2.new(1, 0, 0, ((U and -1762359 or 21)) + h)
                local r = i:FindFirstChildWhichIsA("TextBox")
                if r then
                    r.Size = UDim2.new(1, 0, 0, 21 + h)
                    r.ClearTextOnFocus = false r.TextScaled = false r.TextSize = 13
                    r.TextYAlignment = Enum.TextYAlignment.Center
                    for h, s in ipairs(r:GetDescendants())
                    do
                        if s:IsA("TextLabel") or s:IsA("TextButton") then
                            s.TextYAlignment = Enum.TextYAlignment.Center
                        end
                        end
                    local U = r:FindFirstChildOfClass("UICorner")
                    if U then
                        U.CornerRadius = UDim.new(0, s)
                    else
                        local h = Instance.new("UICorner")
                        h.CornerRadius = UDim.new(0, s)
                        h.Parent = r
                    end
                    end
                end
            return d
        end
        end
    Hg:AddToggle("AutoReconnectToggle", {Text = "\240\159\148\129 Auto Reconnect", Default = S.AutoReconnect, Tooltip = "Automatically rejoins a fresh server when disconnected (errors 277/279/288)"})
    Hg:AddLabel("AutoReconnectStatusLabel", {Text = S.AutoReconnect and "\240\159\159\162 Reconnect: Listening..." or "\240\159\148\180 Reconnect: Off", DoesWrap = true})
    Hg:AddDivider()
    Le(Hg, "ServerButtonsPanel", {{"Rejoin Server", function ()
        pcall(G)
        V:Notify("<font color=\"#5BC8FF\">\240\159\148\132 Rejoining server...</font>", 3)
        local h = Instance.new("TeleportOptions")
        h.ServerInstanceId = game.JobId
        local s = pcall(function ()
            r:TeleportAsync(game.PlaceId, {E}, h)
        end)
        if not s then
            V:Notify("<font color=\"#FFA500\">\226\154\160\239\184\143 Retrying with fallback...</font>", 3)
            pcall(function ()
                r:Teleport(game.PlaceId, E)
            end)
        end
        end};
    {"Server Hop";
    function ()
        pcall(G)
        if a then
            V:Notify("<font color=\"#FFA500\">\226\154\160\239\184\143 Already hopping...</font>", 3)
            return
        end
        task.spawn(function ()
            local h, s = Ue()
            if not h then
                V:Notify("<font color=\"#FF6B6B\">\226\154\160\239\184\143 Force Hop failed:</font> "..tostring(s), 4)
            end
            end)
    end}})
    local Tg = nil
    local function Lg(h)
        local s = {}
        if type(h) == "table" then
            for h, U in pairs(h)
            do
                if U then
                    s[h] = true
                end
                end
            elseif type(h) == "string" and h ~= "" then
            s[h] = true
        end
        return s
    end
    local mg = Zg:AddLeftGroupbox("\240\159\144\190 Add to Buy List")
    Ie(mg)
    local cg = Te(mg, "PetNameDropdown", "Pet Name", Q, {multi = false, text = "Pets";
    get = function ()
        return "Any"
    end, displayMap = V.DM.pet, tooltip = "Select a pet to target. Leave unselected to match any pet."})
    local hm = Te(mg, "PetSizeDropdown", "Sizes", o, {multi = true;
    text = "Sizes", store = {};
    displayMap = V.DM.petSize;
    tooltip = "Select one or more sizes to target. Leave empty to match any size."})
    local sm = Te(mg, "PetVariantDropdown", "Variants", l, {multi = true;
    text = "Variants", store = {};
    displayMap = V.DM.petVariant;
    tooltip = "Select one or more variants to target. Leave empty to match any variant."})
    mg:AddDivider()
    mg:AddInput("TargetAmountInput", {Text = "Target Amount", Default = "";
    Numeric = true;
    Placeholder = "0";
    Tooltip = "How many of this entry to buy before it\'s done. Leave at 0 for unlimited.", Finished = false})
    mg:AddDivider()
    local Um = Instance.new("Frame")
    Um.BackgroundTransparency = (610268) - (610267)
    Um.BorderSizePixel = (-590700) + (590700)
    Um.Size = UDim2.new(1, 0, 0, 30)
    local rm = Instance.new("UIListLayout")
    rm.FillDirection = Enum.FillDirection.Horizontal
    rm.HorizontalAlignment = Enum.HorizontalAlignment.Center
    rm.SortOrder = Enum.SortOrder.LayoutOrder
    rm.Padding = UDim.new(0, 4)
    rm.Parent = Um
    local Bm = Instance.new("TextButton")
    Bm.Font = Enum.Font.GothamSemibold
    Bm.TextSize = 13
    Bm.TextColor3 = V.Scheme.FontColor
    Bm.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    Bm.BorderSizePixel = 887170 + (-887170)
    Bm.Size = UDim2.new(0.5, -2, 1, 0)
    Bm.Text = "\226\158\149 Add"
    local Km = Instance.new("UICorner")
    Km.CornerRadius = UDim.new(0, 6)
    Km.Parent = Bm
    local dm = Instance.new("UIStroke")
    dm.Color = V.Scheme.OutlineColor
    dm.Thickness = 500445185 % (7359488)
    dm.Parent = Bm
    Bm.Parent = Um
    local vm = Instance.new("TextButton")
    vm.Font = Enum.Font.GothamSemibold
    vm.TextSize = 13
    vm.TextColor3 = V.Scheme.FontColor
    vm.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    vm.BorderSizePixel = 0
    vm.Size = UDim2.new(0.5, -2, 1, 0)
    vm.Text = "\240\159\167\185 Clear"
    local im = Instance.new("UICorner")
    im.CornerRadius = UDim.new(0, 6)
    im.Parent = vm
    local um = Instance.new("UIStroke")
    um.Color = V.Scheme.OutlineColor
    um.Thickness = 1
    um.Parent = vm
    vm.Parent = Um
    local Em = Instance.new("TextButton")
    Em.Font = Enum.Font.GothamSemibold
    Em.TextSize = 13
    Em.TextColor3 = V.Scheme.FontColor
    Em.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    Em.BorderSizePixel = (-316854) - (-316854)
    Em.Size = UDim2.new(0.33, -2, 1, 0)
    Em.Text = "\240\159\151\145\239\184\143 Delete"
    Em.Visible = false
    local Ym = Instance.new("UICorner")
    Ym.CornerRadius = UDim.new(0, 6)
    Ym.Parent = Em
    local Vm = Instance.new("UIStroke")
    Vm.Color = V.Scheme.OutlineColor
    Vm.Thickness = 1
    Vm.Parent = Em
    Em.Parent = Um
    local function fm(h, s, U)
        h.MouseEnter:Connect(function ()
            h.BackgroundColor3 = U
        end)
        h.MouseLeave:Connect(function ()
            h.BackgroundColor3 = s
        end)
    end
    fm(Bm, Color3.fromRGB(32, 32, 32), Color3.fromRGB(42, 42, 42))
    fm(vm, Color3.fromRGB(32, 32, 32), Color3.fromRGB(42, 42, 42))
    fm(Em, Color3.fromRGB(32, 32, 32), Color3.fromRGB(42, 42, 42))
    mg:AddUIPassthrough("FormButtonsPassthrough", {Instance = Um;
    Height = 30})
    mg:AddDivider()
    Te(mg, "MovementMethodDropdown", "Movement Method", {"Hop";
    "Tween", "Walk"}, {multi = false;
    get = function ()
        return S.MovementMethod
    end, set = function (h)
        S.MovementMethod = h
        P()
    end, tooltip = "How the bot moves. Hop is recommended."})
    mg:AddDivider()
    mg:AddToggle("GuardPetsToggle", {Text = "Guard Tamed Pets", Default = S.GuardPetsEnabled, Tooltip = "Protects your tamed pet from thieves as it walks home. Needs a Shovel."})
    mg:AddToggle("AutoBuyToggle", {Text = "Auto Buy";
    Default = S.AutoBuyEnabled, Tooltip = "Scans for a matching pet, moves to it, and fires the tame packet."})
    local Nm = Zg:AddRightGroupbox("\240\159\155\146 Buy List")
    Ie(Nm)
    local qm = Instance.new("Frame")
    qm.BackgroundTransparency = 724070876 % (5792567)
    qm.BorderSizePixel = 0
    qm.Size = UDim2.new(1, 0, 0, 0)
    local zm = Instance.new("UIListLayout")
    zm.FillDirection = Enum.FillDirection.Vertical
    zm.HorizontalAlignment = Enum.HorizontalAlignment.Center
    zm.SortOrder = Enum.SortOrder.LayoutOrder
    zm.Padding = UDim.new(0, 6)
    zm.Parent = qm
    Nm:AddUIPassthrough("BuyListItemsPassthrough", {Instance = qm, Height = 1})
    local function Am(h, s, U)
        pcall(function ()
            if h then
                h.Size = UDim2.new(1, 0, 0, s)
                if h.Parent and h.Parent:IsA("Frame") then
                    h.Parent.Size = UDim2.new(1, 0, 0, s)
                end
                end
            if U and U.Resize then
                U:Resize()
            end
            end)
    end
    local function lm()
        task.defer(function ()
            pcall(function ()
                local h = (273838272) % (8557446)
                if zm then
                    h = zm.AbsoluteContentSize.Y
                end
                if h == 0 and qm then
                    for s, U in ipairs(qm:GetChildren())
                    do
                        if U:IsA("GuiObject") and U ~= zm then
                            h = (h + U.AbsoluteSize.Y) + (6)
                        end
                        end
                    end
                Am(qm, h, Nm)
            end)
        end)
    end;
    ((function ()
        local h = {boxes = {}}
        V.VH = h
        function h.Box(s, U, r, B)
            local K = (U == "Right") and s:AddRightGroupbox(r) or s:AddLeftGroupbox(r)
            Ie(K)
            table.insert(h.boxes, {gb = K, collapsed = B ~= false})
            return K
        end
        function h.Dropdown(h, s, U, r, B)
            return Te(h, s, U, r, B)
        end
        function h.Input(h, s, U)
            return h:AddInput(s, U)
        end
        function h.Toggle(h, s, U)
            return h:AddToggle(s, U)
        end
        function h.Buttons(h, s, U)
            return Le(h, s, U)
        end
        function h.PlantPicker(h, s, U, r, B)
            return V.AddPlantPicker(h, s, U, r, B)
        end
        function h.List(h, s)
            local U = Instance.new("Frame")
            U.BackgroundTransparency = 1
            U.BorderSizePixel = 0
            U.Size = UDim2.new(1, 0, 0, 0)
            local r = Instance.new("UIListLayout")
            r.FillDirection = Enum.FillDirection.Vertical
            r.HorizontalAlignment = Enum.HorizontalAlignment.Center
            r.SortOrder = Enum.SortOrder.LayoutOrder
            r.Padding = UDim.new(0, 6)
            r.Parent = U
            local B = Instance.new("TextButton")
            B.Name = "__vhDynGuard"
            B.AutomaticSize = Enum.AutomaticSize.Y
            B.Text = ""
            B.Parent = r
            h:AddUIPassthrough(s, {Instance = U;
            Height = 1})
            local function K()
                task.defer(function ()
                    pcall(function ()
                        local s = r.AbsoluteContentSize.Y
                        if s == 0 then
                            for h, U in ipairs(U:GetChildren())
                            do
                                if U:IsA("GuiObject") then
                                    s = (s + U.AbsoluteSize.Y) + 446118743 % (14390927)
                                end
                                end
                            end
                        Am(U, s, h)
                    end)
                end)
            end;
            (r:GetPropertyChangedSignal("AbsoluteContentSize")):Connect(K);
            (U:GetPropertyChangedSignal("AbsoluteSize")):Connect(K)
            task.spawn(function ()
                for h, s in ipairs({1, 3, 8})
                do
                    task.wait(s)
                    K()
                end
                end)
            return {frame = U;
            layout = r;
            resize = K}
        end
        function h.ListRow(h, s, U, r)
            r = r or {}
            local B = Instance.new("TextButton")
            B.LayoutOrder = s
            B.BorderSizePixel = 0
            B.BackgroundColor3 = r.selected and Color3.fromRGB(45, 55, 45) or Color3.fromRGB(32, 32, 32)
            B.Size = UDim2.new(1, 0, 0, 0)
            B.AutomaticSize = Enum.AutomaticSize.Y
            B.Text = ""
            local K = Instance.new("UICorner")
            K.CornerRadius = UDim.new(0, 6)
            K.Parent = B
            local d = Instance.new("UIStroke")
            d.Color = r.selected and Color3.fromRGB(0, 180, 100) or V.Scheme.OutlineColor
            d.Thickness = 1
            d.Parent = B
            local v = Instance.new("UIPadding")
            v.PaddingTop = UDim.new(0, 8)
            v.PaddingBottom = UDim.new(0, 8)
            v.PaddingLeft = UDim.new(0, 8)
            v.PaddingRight = UDim.new(0, 8)
            v.Parent = B
            local i = Instance.new("TextLabel")
            i.BackgroundTransparency = 1
            i.Size = UDim2.new(1, 0, 0, 0)
            i.AutomaticSize = Enum.AutomaticSize.Y
            i.Font = Enum.Font.GothamSemibold
            i.TextSize = -771415 - (-771427)
            i.TextColor3 = Color3.fromRGB(165, 165, 165)
            i.TextXAlignment = Enum.TextXAlignment.Left
            i.TextYAlignment = Enum.TextYAlignment.Center
            i.TextWrapped = true i.RichText = true i.Text = U
            i.Parent = B
            B.MouseEnter:Connect(function ()
                if not r.selected then
                    B.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
                end
                end)
            B.MouseLeave:Connect(function ()
                B.BackgroundColor3 = r.selected and Color3.fromRGB(45, 55, 45) or Color3.fromRGB(32, 32, 32)
            end)
            if r.onClick then
                B.MouseButton1Click:Connect(r.onClick)
            end
            B.Parent = h
            return B, i
        end
        end))()
    local om, Qm
    om = function ()
        Tg = nil pcall(function ()
            cg:SetValue("Any")
            hm:SetValue({})
            sm:SetValue({})
            ng.TargetAmountInput:SetValue("")
        end)
        Bm.Text = "\226\158\149 Add"
        vm.Text = "\240\159\167\185 Clear"
        Em.Visible = false Bm.Size = UDim2.new(0.5, -2, 1, 0)
        vm.Size = UDim2.new(0.5, -2, 1, 0)
        lm()
    end
    Qm = function ()
        for h, s in ipairs(qm:GetChildren())
        do
            if s:IsA("GuiObject") and s ~= zm then
                s:Destroy()
            end
            end
        if type(S.BuyList) ~= "table" then
            S.BuyList = {}
        end
        for h, s in ipairs(S.BuyList)
        do
            local U = {}
            if type(s.Sizes) == "table" then
                for h in pairs(s.Sizes)
                do
                    table.insert(U, h)
                end
                table.sort(U)
            end
            local r = #U > 0 and table.concat(U, ", ") or "Any Size"
            local B = {}
            if type(s.Variants) == "table" then
                for h in pairs(s.Variants)
                do
                    table.insert(B, h)
                end
                table.sort(B)
            end
            local K = #B > 0 and table.concat(B, ", ") or "Any Variant"
            local d = s.Amount or -195306 - (-195306)
            local v = d > 0 and tostring(d) or "Unlimited"
            local i = ue[h] or -529691 - (-529691)
            local u = Instance.new("TextButton")
            u.Name = "BuyListEntry_"..tostring(h)
            u.LayoutOrder = h
            u.BorderSizePixel = 1139394681 % (4688867)
            u.BackgroundColor3 = (Tg == h) and Color3.fromRGB(45, 55, 45) or Color3.fromRGB(32, 32, 32)
            u.Size = UDim2.new(1, 0, 0, 0)
            u.AutomaticSize = Enum.AutomaticSize.Y
            u.Text = ""
            local E = Instance.new("UICorner")
            E.CornerRadius = UDim.new(0, 6)
            E.Parent = u
            local Y = Instance.new("UIStroke")
            Y.Color = (Tg == h) and Color3.fromRGB(0, 180, 100) or V.Scheme.OutlineColor
            Y.Thickness = -883081 - (-883082)
            Y.Parent = u
            local f = Instance.new("UIPadding")
            f.PaddingTop = UDim.new(0, 8)
            f.PaddingBottom = UDim.new(0, 8)
            f.PaddingLeft = UDim.new(0, 8)
            f.PaddingRight = UDim.new(0, 8)
            f.Parent = u
            local N = Instance.new("TextLabel")
            N.BackgroundTransparency = 1
            N.Size = UDim2.new(1, 0, 0, 0)
            N.AutomaticSize = Enum.AutomaticSize.Y
            N.Font = Enum.Font.GothamSemibold
            N.TextSize = 12
            N.TextColor3 = Color3.fromRGB(165, 165, 165)
            N.TextXAlignment = Enum.TextXAlignment.Left
            N.TextYAlignment = Enum.TextYAlignment.Center
            N.TextWrapped = true N.Text = string.format("%d. %s\nSizes: %s\nVariants: %s\nTarget: %s (Tamed: %d)", h, s.PetName or "Any", r, K, v, i)
            N.Parent = u
            u.MouseEnter:Connect(function ()
                if Tg ~= h then
                    u.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
                end
                end)
            u.MouseLeave:Connect(function ()
                if Tg ~= h then
                    u.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
                else
                    u.BackgroundColor3 = Color3.fromRGB(45, 55, 45)
                end
                end)
            u.MouseButton1Click:Connect(function ()
                Tg = h
                pcall(function ()
                    cg:SetValue(s.PetName or "Any")
                    hm:SetValue(s.Sizes or {})
                    sm:SetValue(s.Variants or {})
                    ng.TargetAmountInput:SetValue(s.Amount and tostring(s.Amount) or "")
                end)
                Bm.Text = "\240\159\146\190 Save"
                vm.Text = "\226\157\140 Cancel"
                Em.Visible = true Bm.Size = UDim2.new(0.33, -2, 1, 0)
                vm.Size = UDim2.new(0.33, -2, 1, 0)
                Qm()
            end)
            u.Parent = qm
        end
        lm()
    end
    Bm.MouseButton1Click:Connect(function ()
        local h = cg:GetValue()
        if type(h) == "table" then
            h = next(h) or "Any"
        end
        if not h or h == "" then
            h = "Any"
        end
        local s = Lg(hm:GetValue())
        local U = Lg(sm:GetValue())
        local r = tonumber(ng.TargetAmountInput.Value) or 0
        r = math.max(0, math.floor(r))
        local B = {PetName = h;
        Sizes = s, Variants = U;
        Amount = r}
        if Tg then
            S.BuyList[Tg] = B
            V:Notify("<font color=\"#7EB8FF\">\240\159\146\190 Entry updated</font>", 3)
        else
            table.insert(S.BuyList, B)
            ue[#S.BuyList] = 0
            V:Notify("<font color=\"#7EB8FF\">\226\158\149 Added to buy list</font>", 3)
        end
        P()
        Qm()
        om()
    end)
    vm.MouseButton1Click:Connect(function ()
        if Tg then
            om()
            Qm()
        else
            om()
        end
        end)
    Em.MouseButton1Click:Connect(function ()
        if Tg then
            table.remove(S.BuyList, Tg)
            table.remove(ue, Tg)
            P()
            Qm()
            om()
            V:Notify("<font color=\"#FF8C8C\">\240\159\151\145\239\184\143 Entry deleted</font>", 3)
        end
        end)
    Le(Nm, "ClearAllPanel", {{"\240\159\167\185 Clear All";
    function ()
        S.BuyList = {}
        Tg = nil Ee()
        P()
        Qm()
        om()
        V:Notify("<font color=\"#AAAAAA\">\240\159\167\185 Buy list cleared</font>", 3)
    end}})
    do
        local h = {}
        local function s()
            local s = {}
            local U = E:GetAttribute("PlotId")
            local r = U and (workspace:FindFirstChild("Gardens") and workspace.Gardens:FindFirstChild("Plot"..tostring(U)))
            local B = r and r:FindFirstChild("Plants")
            if B then
                for h, U in ipairs(B:GetChildren())
                do
                    if U:IsA("Model") and U:GetAttribute("UserId") == E.UserId then
                        local h = tostring(U:GetAttribute("SeedName"))
                        s[h] = ((s[h] or -281628)) + (1)
                    end
                    end
                end
            for U, r in ipairs(ag)
            do
                local B = (V.DM and (V.DM.plant and V.DM.plant[r])) or r
                local K, d = B:match("^(.*) <font color=\"([^\"]+)\">%(%d+x%)</font>$")
                if not K then
                    K, d = B, "#8C8C8C"
                end
                h[r] = K..string.format(" <font color=\"%s\">(%dx)</font>", d, s[r] or 0)
            end
            end
        function V.AddPlantPicker(U, r, B, K, d)
            s()
            local v
            v = Te(U, r, B, ag, {multi = true, text = B;
            store = K;
            displayMap = h;
            onChange = P;
            onOpen = function ()
                s()
                pcall(function ()
                    v.Overlay.SetItems(ag, h)
                end)
            end;
            tooltip = d})
            return v
        end
        end
    do
        V.DM = V.DM or {}
        local h = {None = "#AAAAAA";
        Normal = "#AAAAAA", Gold = "#FFD700", Rainbow = "#FF7EF5", Electric = "#FFF14A", Frozen = "#7ED6FF";
        Bloodlit = "#FF4A4A";
        Chained = "#B8B8C4", Starstruck = "#C77EFF", Aurora = "#7EFFC8", Ignited = "#FF8C3A"}
        local s = {"Gold";
        "Rainbow", "Electric";
        "Frozen", "Bloodlit", "Chained";
        "Starstruck";
        "Aurora";
        "Ignited"}
        local r = {}
        pcall(function ()
            local h = require(U.SharedModules.MutationData)
            for s, U in ipairs(s)
            do
                r[U] = tonumber(h.ReturnPriceMultiplier(U))
            end
            end)
        local function B(s)
            local U = r[s]
            return string.format("<font color=\"%s\">%s</font>%s", h[s] or "#FFFFFF", s, U and string.format(" <font color=\"#8C8C8C\">x%s</font>", tostring(U)) or "")
        end
        V.DM.mutation = {None = B("None")}
        for h, s in ipairs(s)
        do
            V.DM.mutation[s] = B(s)
        end
        h.Mega = "#B57EFF"
        V.DM.variant = {Normal = B("Normal"), Gold = V.DM.mutation.Gold;
        Rainbow = V.DM.mutation.Rainbow;
        Mega = B("Mega")}
    end
    local Sm = yg:AddLeftGroupbox("\240\159\140\190 Auto Harvest")
    Ie(Sm)
    V.AddPlantPicker(Sm, "HarvestFilterDropdown", "Collect Fruits", S.HarvestFilterFruits, "Only collect these fruit types. Leave empty to collect every fruit (default).")
    Te(Sm, "HarvestMutationDropdown", "Mutations", {"None", "Gold";
    "Rainbow";
    "Electric", "Frozen", "Bloodlit", "Chained", "Starstruck", "Aurora", "Ignited"}, {multi = true, text = "Mutations", store = S.HarvestFilterMutations, displayMap = V.DM.mutation;
    onChange = P, tooltip = "Only collect fruit with these mutations (None = unmutated). Empty = any mutation."})
    Te(Sm, "HarvestVariantDropdown", "Plant Variant", {"Normal";
    "Gold", "Rainbow", "Mega"}, {multi = true;
    text = "Plant Variant";
    store = S.HarvestFilterVariants;
    displayMap = V.DM.variant;
    onChange = P;
    tooltip = "Only collect from these plant variants \226\128\148 Gold / Rainbow plants. Empty = any plant."})
    Te(Sm, "HarvestWeightModeDropdown", "Weight Filter", {"Off", "Below";
    "Above"}, {multi = false;
    text = "Weight Filter";
    get = function ()
        return S.HarvestWeightMode
    end;
    set = function (h)
        S.HarvestWeightMode = h
        P()
    end, tooltip = "Off: any weight. Below: only fruit lighter than the kg below. Above: only heavier."})
    Sm:AddInput("HarvestWeightKgInput", {Text = "\226\154\150\239\184\143 Weight (kg)", Default = tostring(S.HarvestWeightKg or 0);
    Numeric = true, Placeholder = "0", Tooltip = "The kg threshold used by the Weight Filter above.";
    Finished = false})
    Sm:AddLabel("HarvestFilterSummaryLabel", {Text = "\240\159\167\186 Collecting: all fruits";
    DoesWrap = true})
    do
        local function h(h)
            local s = {}
            if type(h) == "table" then
                for h, U in pairs(h)
                do
                    if U then
                        s[#s + 1] = tostring(h)
                    end
                    end
                end
            table.sort(s)
            return s
        end
        local function s()
            local s = {}
            local U = h(S.HarvestFilterFruits)
            s[#s + 1] = (#U == 0) and "all fruits" or ((#U <= 4) and table.concat(U, ", ") or (#U.." fruit types"))
            local r = h(S.HarvestFilterMutations)
            if #r > 0 then
                s[#s + 1] = table.concat(r, "/")
            end
            local B = h(S.HarvestFilterVariants)
            if #B > 0 then
                s[#s + 1] = table.concat(B, "/").." plants"
            end
            local K = S.HarvestWeightMode
            local d = tonumber(S.HarvestWeightKg) or 921337 - (921337)
            if ((K == "Below" or K == "Above")) and d > 0 then
                s[#s + 1] = string.format("%s %skg", string.lower(K), tostring(d))
            end
            return "\240\159\167\186 Collecting: "..table.concat(s, "  \226\128\162  ")
        end
        task.spawn(function ()
            while true
            do
                pcall(function ()
                    V.Labels.HarvestFilterSummaryLabel:SetText(s())
                end)
                task.wait(2)
            end
            end)
    end
    Sm:AddToggle("HarvestToggle", {Text = "Auto Harvest", Default = S.HarvestEnabled, Tooltip = "Instantly collects all your ready fruit. No movement needed."})
    Sm:AddToggle("PrioHarvestToggle", {Text = "Highest value first";
    Default = S.PrioHarvest, Tooltip = "Harvest the most valuable fruit before the rest."})
    local Rm = yg:AddRightGroupbox("\240\159\146\176 Auto Sell")
    Ie(Rm)
    Rm:AddToggle("GardenSellToggle", {Text = "Auto Sell Inventory", Default = S.GardenSellEnabled;
    Tooltip = "Fires the same SellAll the in-game button uses. Self-paced, no movement."})
    Rm:AddToggle("SellWhenFullToggle", {Text = "Sell Only When Full";
    Default = S.SellWhenFull, Tooltip = "Holds fruit until the inventory is full, then sells it in one batch."})
    Rm:AddToggle("AutoDailyDealToggle", {Text = "Use Daily Deal", Default = S.AutoDailyDeal;
    Tooltip = "When full, use Steven\'s daily deal if it\'s available; otherwise sell normally. Waits for full first."})
    local bm = yg:AddLeftGroupbox("\240\159\140\177 Auto Plant")
    Ie(bm)
    Te(bm, "PlantSeedDropdown", "Plant Seeds", ag, {multi = true, text = "Plant Seeds", store = S.PlantSelected, displayMap = V.DM.plant, tooltip = "Pick which seeds the placer may plant. Leave all selected to plant everything in your backpack.", onChange = P})
    if S.PlacementMode == "Sprinkler Zone" then
        S.PlacementMode = "Boost Zone"
    end
    Te(bm, "PlacementModeDropdown", "Placement Mode", {Jg;
    pg;
    "Boost Zone"}, {multi = false;
    text = "Placement Mode";
    get = function ()
        return S.PlacementMode
    end, set = function (h)
        S.PlacementMode = h
        P()
    end, tooltip = "Farm Middle: the garden center. Saved Position: the spot below. Boost Zone: plant inside the active watering-can splash (else the sprinkler radius) \226\128\148 pair with Auto Sprinkler + Auto Watering for the full synced cycle."})
    bm:AddInput("PlantTargetInput", {Text = "\240\159\142\175 Target Plants", Default = tostring(S.PlantTarget or -559326), Numeric = true, Placeholder = "0", Tooltip = "Plant this many then auto-stop. 0 = unlimited.";
    Finished = false})
    local function am()
        local h = S.SavedPlantPos
        if type(h) == "table" and type(h.x) == "number" then
            return string.format("\240\159\147\141 %s (%.1f, %.1f)", tostring(h.area or "Garden"), h.lx or h.x, h.lz or h.z)
        end
        return "\240\159\147\141 No position saved yet"
    end
    Le(bm, "SavePosPanel", {{"\240\159\147\140 Save Current Position";
    function ()
        local h = ie()
        if not h then
            return
        end
        local s = h.Position
        local U = E:GetAttribute("PlotId")
        local r = U and (workspace:FindFirstChild("Gardens") and workspace.Gardens:FindFirstChild("Plot"..tostring(U)))
        local B, K
        if r then
            for h, U in ipairs(u:GetTagged("PlantArea"))
            do
                if U:IsA("BasePart") and U:IsDescendantOf(r) then
                    local h = ((U.Position - s)).Magnitude
                    if not K or h < K then
                        K = h
                        B = U
                    end
                    end
                end
            end
        local d = Xg(s)
        local v = false
        if not d and B then
            local h = B.CFrame:PointToObjectSpace(s)
            local U = math.clamp(h.X, -B.Size.X / 2, B.Size.X / 2)
            local r = math.clamp(h.Z, -B.Size.Z / 2, B.Size.Z / 2)
            d = B.CFrame:PointToWorldSpace(Vector3.new(U, B.Size.Y / 2.05, r))
            v = true
        end
        if not d then
            d = s - Vector3.new(0, 2.5, 0)
        end
        local i, Y, f = "Garden", d.X, d.Z
        local N, q, z
        if r then
            local h = (r:GetPivot()):PointToObjectSpace(d)
            N, q, z = h.X, h.Y, h.Z
            if B then
                i = (B.Name == "Part" and (B.Parent and B.Parent.Name)) or B.Name
                local h = B.CFrame:PointToObjectSpace(d)
                Y, f = h.X, h.Z
            end
            end
        S.SavedPlantPos = {x = d.X, y = d.Y;
        z = d.Z;
        ox = N, oy = q, oz = z, area = i, lx = Y;
        lz = f}
        P()
        pcall(function ()
            V.Labels.SavedPosLabel:SetText(am())
        end)
        V:Notify(v and "\240\159\147\140 Saved \226\128\148 snapped to your nearest planting area (stand on the soil for an exact spot)." or "\240\159\147\140 Position saved.", v and (1758989966) % 9611967 or (1157904469) % 9117358)
    end}})
    bm:AddLabel("SavedPosLabel", {Text = am();
    DoesWrap = true})
    bm:AddDivider()
    S.LayersStackMode = false bm:AddToggle("PlantGridToggle", {Text = "\240\159\148\179 Grid Placement", Default = S.PlantGridMode, Tooltip = "ON: seeds go onto spaced farm-grid cells. OFF (default): seeds cluster REALLY tight at the placement point \226\128\148 flat on the soil, never stacked."})
    bm:AddDivider()
    bm:AddToggle("PlantToggle", {Text = "\240\159\140\177 Enable Seed Placer";
    Default = S.PlantEnabled, Tooltip = "Plants your selected seeds at the chosen placement, using the stacking modes above."})
    do
        local h = {}
        V.FarmGrid = h
        h.PlaceSpacing = 2.5
        local s, r = nil, nil
        local function B()
            local h = E:GetAttribute("PlotId")
            return h and (workspace:FindFirstChild("Gardens") and workspace.Gardens:FindFirstChild("Plot"..tostring(h)))
        end
        local function K(h)
            local s = {}
            for U, r in ipairs(u:GetTagged("PlantArea"))
            do
                if r:IsA("BasePart") and (r:IsDescendantOf(h) and r.Transparency < 1) then
                    s[#s + 1] = r
                end
                end
            table.sort(s, function (h, s)
                return h.Size.X * h.Size.Z > s.Size.X * s.Size.Z
            end)
            return s
        end
        local function d(h)
            if h.Name == "Part" and h.Parent then
                return h.Parent.Name
            end
            return h.Name
        end
        function h.GroundOnBed(h)
            local s = B()
            if not s then
                return nil
            end
            for s, U in ipairs(K(s))
            do
                local r = U.CFrame:PointToObjectSpace(Vector3.new(h.X, U.Position.Y, h.Z))
                if math.abs(r.X) <= U.Size.X / 1.7 and math.abs(r.Z) <= U.Size.Z / 1.7 then
                    return U.CFrame:PointToWorldSpace(Vector3.new(r.X, U.Size.Y / 2.05, r.Z))
                end
                end
            return nil
        end
        local function v(h)
            local s, U = {}, h * h
            return
            function (r)
                local B, K = math.floor(r.X / h), math.floor(r.Z / h)
                for h = B - 1, B + 1, (-517055) + (517056)
                do
                    for B = K - 1, K + 1, 1
                    do
                        local K = s[h..(":"..B)]
                        if K then
                            for h, s in ipairs(K)
                            do
                                local B, K = r.X - s.X, r.Z - s.Z
                                if B * B + K * K < U then
                                    return false
                                end
                                end
                            end
                        end
                    end
                local d = B..(":"..K)
                local v = s[d]
                if not v then
                    v = {}
                    s[d] = v
                end
                v[#v + 1] = r
                return true
            end
            end
        local i = nil
        function h.Ensure()
            local U = B()
            if not U then
                s = nil r = nil i = nil
                return nil
            end
            local u = K(U)
            local E = #u
            for h, s in ipairs(u)
            do
                E = E + s.Size.X * s.Size.Z
            end
            if s and (r == U and i == E) then
                return U
            end
            r, i = U, E
            s = {}
            h.PerArea = {}
            local Y = v(h.PlaceSpacing * 0.8)
            for U, r in ipairs(u)
            do
                local B, K = r.Size, 0
                local v = -B.X / (2) + (1)
                while v <= B.X / (2) - 340078873 % (16194232)
                do
                    local U = -B.Z / (2) + (1)
                    while U <= B.Z / (2) - (1)
                    do
                        local d = r.CFrame:PointToWorldSpace(Vector3.new(v, B.Y / 2.05, U))
                        if Y(d) then
                            s[#s + 1] = d
                            K = K + (1)
                        end
                        U = U + h.PlaceSpacing
                    end
                    v = v + h.PlaceSpacing
                end
                local i = d(r)
                h.PerArea[i] = ((h.PerArea[i] or -755762)) + K
            end
            return U
        end
        local function Y(h)
            local s = B()
            local U = {}
            local r = s and s:FindFirstChild("Plants")
            if r then
                for s, r in ipairs(r:GetChildren())
                do
                    if r:IsA("Model") and r ~= h then
                        local h, s = pcall(function ()
                            return (r:GetPivot()).Position
                        end)
                        if h then
                            U[#U + 1] = s
                        end
                        end
                    end
                end
            return U
        end
        function h.IsOnCell(U)
            h.Ensure()
            if not s then
                return false
            end
            for h, s in ipairs(s)
            do
                local r, B = U.X - s.X, U.Z - s.Z
                if r * r + B * B < 0.1225 then
                    return true
                end
                end
            return false
        end
        function h.NearestFreeCell(U, r, B, K)
            h.Ensure()
            if not s then
                return nil
            end
            local d = Y(r)
            if type(B) == "table" then
                for h, s in ipairs(B)
                do
                    d[#d + 1] = s
                end
                end
            local v, i
            for h, s in ipairs(s)
            do
                if K == nil or K(s) then
                    local h = true
                    for U, r in ipairs(d)
                    do
                        local B, K = s.X - r.X, s.Z - r.Z
                        if B * B + K * K < 0.81 then
                            h = false
                            break
                        end
                        end
                    if h then
                        local h, r = s.X - U.X, s.Z - U.Z
                        local B = h * h + r * r
                        if not i or B < i then
                            i = B
                            v = s
                        end
                        end
                    end
                end
            return v
        end
        function h.Cells()
            h.Ensure()
            return s or {}
        end
        local f = {["Common Sprinkler"] = 20, ["Uncommon Sprinkler"] = 25;
        ["Rare Sprinkler"] = 30;
        ["Legendary Sprinkler"] = 40;
        ["Super Sprinkler"] = 55}
        pcall(function ()
            for h, s in ipairs(require(U.SharedModules.SprinklerData))
            do
                if s.SprinklerName and tonumber(s.Radius) then
                    f[s.SprinklerName] = tonumber(s.Radius)
                end
                end
            end)
        h.SprinklerRadii = f
        function h.ActiveSprinklers()
            local h = B()
            local s = {}
            local U = h and h:FindFirstChild("Sprinklers")
            if U then
                for h, U in ipairs(U:GetChildren())
                do
                    local r = U:GetAttribute("SprinklerName")
                    local B = r and f[r]
                    if B then
                        local h, K = pcall(function ()
                            return U:IsA("Model") and (U:GetPivot()).Position or U.Position
                        end)
                        if h and K then
                            s[#s + 1] = {Position = K;
                            Radius = B, Name = r}
                        end
                        end
                    end
                end
            return s
        end
        function h.FarmMiddle()
            local s = B()
            if not s then
                return nil
            end
            local U = K(s)
            if #U == -420610 - (-420610) then
                return nil
            end
            local function r(h, s)
                return s == "X" and h.X or h.Z
            end
            local function d(h)
                local s = {}
                for U, B in ipairs(U)
                do
                    s[#s + 1] = r(B.Position, h)
                end
                table.sort(s)
                local B, K = 0, -553273 - (-553273)
                for h = 2, #s, (182750407) % (909206)
                do
                    local U = s[h] - s[h - 1]
                    if U > B then
                        B = U
                        K = ((s[h] + s[h - 1])) / (2)
                    end
                    end
                return B, K
            end
            local v, i = d("X")
            local u, E = d("Z")
            local V = (v >= u) and "X" or "Z"
            local f = (v >= u) and i or E
            local N = Y(nil)
            local q, z = 0, 0
            for h, s in ipairs(N)
            do
                if r(s, V) < f then
                    q = q + 684168755 % (14556782)
                else
                    z = z + (1)
                end
                end
            local A = q > z
            local l, o, Q, S = math.huge, -math.huge, math.huge, -math.huge
            for h, s in ipairs(U)
            do
                local U, r = s.Position, s.Size
                l = math.min(l, U.X - r.X / 2)
                o = math.max(o, U.X + r.X / 2)
                Q = math.min(Q, U.Z - r.Z / 2)
                S = math.max(S, U.Z + r.Z / 2)
            end
            local R, b = ((l + o)) / 2, ((Q + S)) / (2)
            local a, M, w, F, g = math.huge, -math.huge, math.huge, -math.huge, -math.huge
            local j = {}
            for h, s in ipairs(U)
            do
                if (((r(s.Position, V) < f)) == A) then
                    j[#j + 1] = s
                    local h, U = s.Position, s.Size
                    a = math.min(a, h.X - U.X / 2)
                    M = math.max(M, h.X + U.X / 2)
                    w = math.min(w, h.Z - U.Z / 2)
                    F = math.max(F, h.Z + U.Z / 2)
                    g = math.max(g, h.Y + U.Y / 2)
                end
                end
            if #j == 0 then
                return nil
            end
            local J = math.clamp(R, a + 0.5, M - 0.5)
            local p = math.clamp(b, w + 0.5, F - 0.5)
            local D = h.GroundOnBed(Vector3.new(J, g, p))
            if D then
                return D
            end
            local X, W
            for h, s in ipairs(j)
            do
                local U, r = s.Position.X - J, s.Position.Z - p
                local B = U * U + r * r
                if not W or B < W then
                    W = B
                    X = s
                end
                end
            local G = X.CFrame:PointToObjectSpace(Vector3.new(J, X.Position.Y, p))
            local t = math.clamp(G.X, -X.Size.X / 2.5, X.Size.X / 1.5)
            local P = math.clamp(G.Z, -X.Size.Z / 2.5, X.Size.Z / 1.5)
            return X.CFrame:PointToWorldSpace(Vector3.new(t, X.Size.Y / 2.05, P))
        end
        local N = {untilT = 0, owner = nil}
        function V.GearLock(h, s)
            local U = os.clock()
            if N.untilT > U and N.owner ~= h then
                return false
            end
            N.owner = h
            N.untilT = U + ((s or 2))
            return true
        end
        end
    do
        local function h()
            if type(S.TrowelSelected) ~= "table" then
                S.TrowelSelected = {}
            end
            V.TrowelBox = yg:AddLeftGroupbox("\240\159\155\160\239\184\143 Auto Trowel")
            local h = V.TrowelBox
            Ie(h)
            local function s()
                local h = E:GetAttribute("PlotId")
                return h and (workspace:FindFirstChild("Gardens") and workspace.Gardens:FindFirstChild("Plot"..tostring(h)))
            end
            V.AddPlantPicker(h, "TrowelPlantsDropdown", "Move Plants", S.TrowelSelected, "Which plant types the trowel may move. Empty = move nothing.")
            Te(h, "TrowelPlacementDropdown", "Placement Mode", {Jg, pg}, {multi = false;
            text = "Placement Mode", get = function ()
                return S.TrowelPlacementMode
            end;
            set = function (h)
                S.TrowelPlacementMode = h
                P()
            end;
            tooltip = "Where to move the plants. Saved Position uses the trowel\'s own saved spot below."})
            Te(h, "TrowelArrangementDropdown", "Arrangement", {"Tight Cluster", "Grid"}, {multi = false;
            text = "Arrangement", get = function ()
                return S.TrowelArrangement
            end;
            set = function (h)
                S.TrowelArrangement = h
                P()
            end, tooltip = "Tight Cluster: pack plants in a small circle at the point. Grid: fill evenly-spaced farm-grid cells outward from the point (sprinklers/watering reach every plant)."})
            local function U()
                local h = S.TrowelSavedPos
                if type(h) == "table" and type(h.x) == "number" then
                    return string.format("\240\159\147\141 %s (%.1f, %.1f)", tostring(h.area or "Garden"), h.lx or h.x, h.lz or h.z)
                end
                return "\240\159\147\141 No own spot \226\128\148 using Auto Plant\'s"
            end
            Le(h, "TrowelSavePosPanel", {{"\240\159\147\140 Save Current Position", function ()
                local h = ie()
                if not h then
                    return
                end
                local r = h.Position
                local B = s()
                local K, d
                if B then
                    for h, s in ipairs(u:GetTagged("PlantArea"))
                    do
                        if s:IsA("BasePart") and (s:IsDescendantOf(B) and s.Transparency < 1) then
                            local h = ((s.Position - r)).Magnitude
                            if not d or h < d then
                                d = h
                                K = s
                            end
                            end
                        end
                    end
                local v = Xg(r)
                local i = false
                if not v and K then
                    local h = K.CFrame:PointToObjectSpace(r)
                    local s = math.clamp(h.X, -K.Size.X / 2, K.Size.X / 2)
                    local U = math.clamp(h.Z, -K.Size.Z / 2, K.Size.Z / 2)
                    v = K.CFrame:PointToWorldSpace(Vector3.new(s, K.Size.Y / 2.05, U))
                    i = true
                end
                if not v then
                    v = r - Vector3.new(0, 2.5, 0)
                end
                local E, Y, f = "Garden", v.X, v.Z
                local N, q, z
                if B then
                    local h = (B:GetPivot()):PointToObjectSpace(v)
                    N, q, z = h.X, h.Y, h.Z
                    if K then
                        E = (K.Name == "Part" and (K.Parent and K.Parent.Name)) or K.Name
                        local h = K.CFrame:PointToObjectSpace(v)
                        Y, f = h.X, h.Z
                    end
                    end
                S.TrowelSavedPos = {x = v.X;
                y = v.Y;
                z = v.Z;
                ox = N, oy = q, oz = z;
                area = E;
                lx = Y, lz = f}
                P()
                pcall(function ()
                    V.Labels.TrowelSavedPosLabel:SetText(U())
                end)
                V:Notify(i and "\240\159\147\140 Saved \226\128\148 snapped to your nearest planting area." or "\240\159\147\140 Trowel position saved.", 3)
            end}})
            h:AddLabel("TrowelSavedPosLabel", {Text = U();
            DoesWrap = true})
            h:AddDivider()
            h:AddToggle("TrowelToggle", {Text = "\240\159\155\160\239\184\143 Auto Trowel";
            Default = S.TrowelEnabled, Tooltip = "Digs up the selected plants and moves them to the placement point. Each move uses 1 Trowel from your stack."})
            pcall(function ()
                Cg.TrowelToggle:OnChanged(function (h)
                    S.TrowelEnabled = h
                    P()
                end)
            end)
            local r = 4
            local B = 0.4
            local K = 0
            local d = (3014386508) % (12009508)
            local v = 0
            pcall(function ()
                fg.Trowel.MoveRejected.OnClientEvent:Connect(function ()
                    d = d + (1)
                    v = os.clock()
                    if d % 3 == 1 then
                        V:Notify("<font color=\"#FFA500\">\240\159\155\160\239\184\143 Move rejected by server</font> \226\128\148 backing off.", 3)
                    end
                    end)
            end)
            local function i(h)
                if S.TrowelPlacementMode == pg then
                    local s = {}
                    s[#s + 1] = S.TrowelSavedPos
                    s[#s + 1] = S.SavedPlantPos
                    for s, U in ipairs(s)
                    do
                        if type(U) == "table" then
                            if type(U.ox) == "number" and h then
                                local s, r = pcall(function ()
                                    return (h:GetPivot()):PointToWorldSpace(Vector3.new(U.ox, U.oy or 0, U.oz))
                                end)
                                if s and r then
                                    return r
                                end
                                end
                            if type(U.x) == "number" then
                                return Vector3.new(U.x, U.y, U.z)
                            end
                            end
                        end
                    return nil
                end
                return V.FarmGrid and V.FarmGrid.FarmMiddle() or nil
            end
            local function Y()
                local h = E.Character
                local s = h and h:FindFirstChild("Trowel")
                if s and s:IsA("Tool") then
                    return s, true
                end
                local U = E:FindFirstChildOfClass("Backpack")
                s = U and U:FindFirstChild("Trowel")
                if s and s:IsA("Tool") then
                    return s, false
                end
                return nil, false
            end
            local function f(h)
                for h, s in pairs(h)
                do
                    if s then
                        return true
                    end
                    end
                return false
            end
            task.spawn(function ()
                local h = false
                while true
                do
                    local U = false
                    if S.TrowelEnabled and (V.GameLoaded() and (fg and fg.Trowel)) then
                        if os.clock() - v < 5 and v > 0 then
                            task.wait(1)
                            U = true
                        elseif not f(S.TrowelSelected) then
                            else
                            local d = s()
                            local v = d and i(d)
                            local u = d and d:FindFirstChild("Plants")
                            if v and u then
                                local s = S.TrowelArrangement == "Grid" and V.FarmGrid ~= nil
                                local d = nil
                                for h, U in ipairs(u:GetChildren())
                                do
                                    if U:IsA("Model") and (U:GetAttribute("UserId") == E.UserId and S.TrowelSelected[tostring(U:GetAttribute("SeedName"))]) then
                                        local h, B = pcall(function ()
                                            return (U:GetPivot()).Position
                                        end)
                                        if h then
                                            local h
                                            if s then
                                                h = not V.FarmGrid.IsOnCell(B)
                                            else
                                                h = ((Vector3.new(B.X, 0, B.Z) - Vector3.new(v.X, 0, v.Z))).Magnitude > r
                                            end
                                            if h then
                                                d = U
                                                break
                                            end
                                            end
                                        end
                                    end
                                if d then
                                    local r, i = Y()
                                    if not r then
                                        if not h then
                                            h = true V:Notify("<font color=\"#FF6B6B\">\240\159\155\160\239\184\143 No Trowel found</font> \226\128\148 buy one in the Gear Shop.", 4)
                                        end
                                        task.wait(5)
                                        U = true
                                    else
                                        h = false
                                        if V.GearLock and not V.GearLock("trowel", 2.5) then
                                            task.wait(0.3)
                                            U = true
                                        else
                                            if not i then
                                                local h = E.Character
                                                local s = h and h:FindFirstChildOfClass("Humanoid")
                                                if s then
                                                    pcall(function ()
                                                        s:EquipTool(r)
                                                    end)
                                                end
                                                local U = os.clock()
                                                while not ((h and h:FindFirstChild("Trowel"))) and os.clock() - U < 1.2
                                                do
                                                    task.wait(0.1)
                                                end
                                                end
                                            local h = E.Character
                                            if not ((h and h:FindFirstChild("Trowel"))) then
                                                task.wait(1)
                                                U = true
                                            else
                                                local h
                                                if s then
                                                    h = V.FarmGrid.NearestFreeCell(v, d)
                                                else
                                                    local s = {}
                                                    for h, U in ipairs(u:GetChildren())
                                                    do
                                                        if U ~= d and U:IsA("Model") then
                                                            local h, r = pcall(function ()
                                                                return (U:GetPivot()).Position
                                                            end)
                                                            if h then
                                                                s[#s + 1] = r
                                                            end
                                                            end
                                                        end
                                                    for U = 0, 79, 1
                                                    do
                                                        local r = 0.4 * math.sqrt(U)
                                                        local B = U * 2.399963
                                                        local K = Vector3.new(v.X + r * math.cos(B), v.Y, v.Z + r * math.sin(B))
                                                        local d = true
                                                        for h, s in ipairs(s)
                                                        do
                                                            local U, r = K.X - s.X, K.Z - s.Z
                                                            if U * U + r * r < 81133452.75 % (8113345.25) then
                                                                d = false
                                                                break
                                                            end
                                                            end
                                                        if d then
                                                            local s = V.FarmGrid and V.FarmGrid.GroundOnBed(K)
                                                            if s then
                                                                h = s
                                                                break
                                                            end
                                                            end
                                                        end
                                                    if not h then
                                                        for s = 1, 8, 1
                                                        do
                                                            local U = Vector3.new(v.X + math.random(-30, 30) / 10, v.Y, v.Z + math.random(-30, 30) / 10)
                                                            local r = V.FarmGrid and V.FarmGrid.GroundOnBed(U)
                                                            if r then
                                                                h = r
                                                                break
                                                            end
                                                            end
                                                        end
                                                    h = h or v
                                                end
                                                if not h then
                                                    task.wait(3)
                                                    U = true
                                                else
                                                    local s = 2254430424 % (15232638)
                                                    pcall(function ()
                                                        local h = d.PrimaryPart
                                                        if h then
                                                            local U, r, B = h.CFrame:ToEulerAnglesYXZ()
                                                            s = math.deg(r)
                                                        end
                                                        end)
                                                    local r = pcall(function ()
                                                        fg.Trowel.MovePlant:Fire(d.Name, h, s)
                                                    end)
                                                    if r then
                                                        K = K + (1)
                                                    end
                                                    task.wait(B)
                                                    U = true
                                                end
                                                end
                                            end
                                        end
                                    elseif K > 0 then
                                    local h = ""
                                    pcall(function ()
                                        local s = Y()
                                        local U = s and s:GetAttribute("Count")
                                        if U then
                                            h = string.format(" (%s Trowels left)", tostring(U))
                                        end
                                        end)
                                    V:Notify(string.format("<font color=\"#7EFFB0\">\240\159\155\160\239\184\143 Auto Trowel done</font> \226\128\148 moved %d plant%s.%s", K, K == 1 and "" or "s", h), 4)
                                    K = (-153733) - (-153733)
                                end
                                end
                            end
                        elseif K > 2030716962 % (11096814) and not S.TrowelEnabled then
                        K = -201150 - (-201150)
                    end
                    if not U then
                        task.wait(2)
                    end
                    end
                end)
        end
        h()
    end
    do
        local function h()
            if type(S.SprinklerSelected) ~= "table" then
                S.SprinklerSelected = {}
            end
            if type(S.SprinklerPlants) ~= "table" then
                S.SprinklerPlants = {}
            end
            if type(S.WateringSelected) ~= "table" then
                S.WateringSelected = {}
            end
            V.WetZones = V.WetZones or {}
            local h = {"Common Sprinkler", "Uncommon Sprinkler";
            "Rare Sprinkler", "Legendary Sprinkler";
            "Super Sprinkler"}
            local s = {["Common Watering Can"] = {Effect = 10, Radius = 5};
            ["Super Watering Can"] = {Effect = 15;
            Radius = 8}}
            pcall(function ()
                for h, U in ipairs(require(U.SharedModules.WateringcanData))
                do
                    if U.Name then
                        s[U.Name] = {Effect = tonumber(U.EffectTime) or 10;
                        Radius = tonumber(U.SplashRadius) or 5}
                    end
                    end
                end)
            local r = {}
            for h in pairs(s)
            do
                r[#r + 1] = h
            end
            table.sort(r)
            local function B()
                local h = E:GetAttribute("PlotId")
                return h and (workspace:FindFirstChild("Gardens") and workspace.Gardens:FindFirstChild("Plot"..tostring(h)))
            end
            local function K(h, s)
                local function U(U)
                    if not U then
                        return nil
                    end
                    for U, r in ipairs(U:GetChildren())
                    do
                        if r:IsA("Tool") and r:GetAttribute(h) == s then
                            return r
                        end
                        end
                    end
                return U(E.Character) or U(E:FindFirstChildOfClass("Backpack"))
            end
            local function d(h)
                local s = E.Character
                if not s then
                    return false
                end
                if h.Parent == s then
                    return true
                end
                local U = s:FindFirstChildOfClass("Humanoid")
                if U then
                    pcall(function ()
                        U:EquipTool(h)
                    end)
                end
                local r = os.clock()
                while h.Parent ~= s and os.clock() - r < 1.2
                do
                    task.wait(0.1)
                end
                return h.Parent == s
            end
            local function v(h, s)
                local U = tonumber(s)
                if not U then
                    return true
                end
                return ((tonumber(h:GetAttribute("Count")) or 0)) > U
            end
            local function i(h)
                local s = B()
                local U = {}
                local r = s and s:FindFirstChild("Plants")
                if r then
                    for s, r in ipairs(r:GetChildren())
                    do
                        if r:IsA("Model") and r:GetAttribute("UserId") == E.UserId then
                            if not h or h[tostring(r:GetAttribute("SeedName"))] then
                                local h, s = pcall(function ()
                                    return (r:GetPivot()).Position
                                end)
                                if h then
                                    U[#U + 1] = {name = r.Name;
                                    pos = s}
                                end
                                end
                            end
                        end
                    end
                return U
            end
            local function Y(h)
                if h == "Auto Plant" then
                    return S.SavedPlantPos
                end
                if h == "Auto Trowel" then
                    return S.TrowelSavedPos or S.SavedPlantPos
                end
                return S.SprinklerSavedPos or S.SavedPlantPos
            end
            local function f(h)
                local s = B()
                if not s then
                    return nil
                end
                if h == pg then
                    local h = Y(S.SprinklerSavedSource)
                    if type(h) == "table" then
                        if type(h.ox) == "number" then
                            local U, r = pcall(function ()
                                return (s:GetPivot()):PointToWorldSpace(Vector3.new(h.ox, h.oy or 0, h.oz))
                            end)
                            if U then
                                return r
                            end
                            end
                        if type(h.x) == "number" then
                            return Vector3.new(h.x, h.y, h.z)
                        end
                        end
                    return nil
                end
                return V.FarmGrid and V.FarmGrid.FarmMiddle() or nil
            end
            local N
            local function q(h, s)
                if not N then
                    N = {}
                    local h = 1.15
                    for s = -6, 6, 625210 + (-625209)
                    do
                        for U = -6, 6, 1
                        do
                            N[#N + 1] = {x = s * h;
                            z = U * h, d = s * s + U * U}
                        end
                        end
                    table.sort(N, function (h, s)
                        return h.d < s.d
                    end)
                end
                for U, r in ipairs(N)
                do
                    local B = Vector3.new(h.X + r.x, h.Y, h.Z + r.z)
                    local K = V.FarmGrid and V.FarmGrid.GroundOnBed(B)
                    if K then
                        local h = true
                        for s, U in ipairs(s)
                        do
                            local r, B = K.X - U.Position.X, K.Z - U.Position.Z
                            if r * r + B * B < 1.1 then
                                h = false
                                break
                            end
                            end
                        if h then
                            return K
                        end
                        end
                    end
                return nil
            end
            V.SprinklerBox = yg:AddRightGroupbox("\240\159\146\166 Auto Sprinkler")
            Ie(V.SprinklerBox)
            V.AddPlantPicker(V.SprinklerBox, "SprinklerPlantsDropdown", "Cover Plants", S.SprinklerPlants, "Selected Plants mode: which plant types the sprinklers should cover. Empty = cover ALL plants.")
            local z = {["Common Sprinkler"] = "<font color=\"#B8B8C4\">Common Sprinkler</font> <font color=\"#8C8C8C\">r20 \194\183 x1.5</font>", ["Uncommon Sprinkler"] = "<font color=\"#58D66F\">Uncommon Sprinkler</font> <font color=\"#8C8C8C\">r25 \194\183 x2</font>";
            ["Rare Sprinkler"] = "<font color=\"#3498DB\">Rare Sprinkler</font> <font color=\"#8C8C8C\">r30 \194\183 x3</font>", ["Legendary Sprinkler"] = "<font color=\"#FF9C28\">Legendary Sprinkler</font> <font color=\"#8C8C8C\">r40 \194\183 x4</font>";
            ["Super Sprinkler"] = "<font color=\"#EB4082\">Super Sprinkler</font> <font color=\"#8C8C8C\">r55 \194\183 x5</font>"}
            Te(V.SprinklerBox, "SprinklerTierDropdown", "Sprinklers", h, {multi = true, text = "Sprinklers";
            store = S.SprinklerSelected;
            displayMap = z;
            onChange = P, tooltip = "Each selected tier is kept continuously active: placed, then re-placed the moment its 120s lifetime ends."})
            Te(V.SprinklerBox, "SprinklerPlacementDropdown", "Placement Mode", {Jg;
            pg, "Selected Plants"}, {multi = false, text = "Placement Mode";
            get = function ()
                return S.SprinklerPlacementMode
            end, set = function (h)
                S.SprinklerPlacementMode = h
                P()
            end, tooltip = "Selected Plants: place right on the selected plants. Farm Middle / Saved Position: place AT that point (Saved Spot below picks whose)."})
            Te(V.SprinklerBox, "SprinklerSavedSourceDropdown", "Saved Spot", {"Auto Sprinkler";
            "Auto Plant", "Auto Trowel"}, {multi = false, text = "Saved Spot";
            get = function ()
                return S.SprinklerSavedSource
            end, set = function (h)
                S.SprinklerSavedSource = h
                P()
            end, tooltip = "Which saved position Saved Position mode uses: the sprinkler\'s own spot (saved below), Auto Plant\'s, or Auto Trowel\'s."})
            local function A()
                local h = S.SprinklerSavedPos
                if type(h) == "table" and type(h.x) == "number" then
                    return string.format("\240\159\147\141 %s (%.1f, %.1f)", tostring(h.area or "Garden"), h.lx or h.x, h.lz or h.z)
                end
                return "\240\159\147\141 No own spot \226\128\148 using Auto Plant\'s"
            end
            Le(V.SprinklerBox, "SprinklerSavePosPanel", {{"\240\159\147\140 Save Current Position", function ()
                local h = ie()
                if not h then
                    return
                end
                local s = h.Position
                local U = B()
                local r, K
                if U then
                    for h, B in ipairs(u:GetTagged("PlantArea"))
                    do
                        if B:IsA("BasePart") and (B:IsDescendantOf(U) and B.Transparency < 1) then
                            local h = ((B.Position - s)).Magnitude
                            if not K or h < K then
                                K = h
                                r = B
                            end
                            end
                        end
                    end
                local d = V.FarmGrid and V.FarmGrid.GroundOnBed(s) or nil
                local v = false
                if not d and r then
                    local h = r.CFrame:PointToObjectSpace(s)
                    local U = math.clamp(h.X, -r.Size.X / 2, r.Size.X / 2)
                    local B = math.clamp(h.Z, -r.Size.Z / 2, r.Size.Z / 2)
                    d = r.CFrame:PointToWorldSpace(Vector3.new(U, r.Size.Y / 2.05, B))
                    v = true
                end
                if not d then
                    d = s - Vector3.new(0, 2.5, 0)
                end
                local i, E, Y = "Garden", d.X, d.Z
                local f, N, q
                if U then
                    local h = (U:GetPivot()):PointToObjectSpace(d)
                    f, N, q = h.X, h.Y, h.Z
                    if r then
                        i = (r.Name == "Part" and (r.Parent and r.Parent.Name)) or r.Name
                        local h = r.CFrame:PointToObjectSpace(d)
                        E, Y = h.X, h.Z
                    end
                    end
                S.SprinklerSavedPos = {x = d.X, y = d.Y;
                z = d.Z;
                ox = f, oy = N;
                oz = q, area = i;
                lx = E;
                lz = Y}
                P()
                pcall(function ()
                    V.Labels.SprinklerSavedPosLabel:SetText(A())
                end)
                V:Notify(v and "\240\159\147\140 Saved \226\128\148 snapped to your nearest bed." or "\240\159\147\140 Sprinkler position saved.", 3)
            end}})
            V.SprinklerBox:AddLabel("SprinklerSavedPosLabel", {Text = A();
            DoesWrap = true})
            V.SprinklerBox:AddInput("SprinklerKeepInput", {Text = "\240\159\167\176 Keep Count", Default = tostring(S.SprinklerKeepCount or "");
            Numeric = true;
            Placeholder = "off", Tooltip = "Stop placing a tier when you have this many or fewer left. Empty = use them all.";
            Finished = false})
            V.SprinklerBox:AddToggle("SprinklerToggle", {Text = "\240\159\146\166 Auto Sprinkler";
            Default = S.SprinklerEnabled;
            Tooltip = "Places each selected sprinkler per the placement mode; re-places on expiry. 1 gear per placement."})
            pcall(function ()
                ng.SprinklerKeepInput:OnChanged(function ()
                    S.SprinklerKeepCount = ng.SprinklerKeepInput.Value
                    P()
                end)
                Cg.SprinklerToggle:OnChanged(function (h)
                    S.SprinklerEnabled = h
                    P()
                end)
            end)
            V.WateringBox = yg:AddRightGroupbox("\240\159\154\191 Auto Watering Can")
            Ie(V.WateringBox)
            V.AddPlantPicker(V.WateringBox, "WateringPlantsDropdown", "Water Plants", S.WateringSelected, "Plant types to keep watered. Empty = water nothing.")
            local l = {["Common Watering Can"] = "<font color=\"#B8B8C4\">Common Watering Can</font> <font color=\"#8C8C8C\">x3 \194\183 r5</font>";
            ["Super Watering Can"] = "<font color=\"#FFD700\">Super Watering Can</font> <font color=\"#8C8C8C\">x300 \194\183 r8</font>"}
            Te(V.WateringBox, "WateringCanDropdown", "Watering Can", r, {multi = false;
            text = "Watering Can";
            displayMap = l, get = function ()
                return S.WateringCanChoice
            end, set = function (h)
                S.WateringCanChoice = h
                P()
            end;
            tooltip = "Which can to use. Super = \195\151300 growth for 15s in an 8-stud splash; Common = \195\1513 for 10s in 5 studs."})
            V.WateringBox:AddInput("WateringKeepInput", {Text = "\240\159\167\176 Keep Count", Default = tostring(S.WateringKeepCount or ""), Numeric = true, Placeholder = "off";
            Tooltip = "Stop watering when you have this many or fewer cans left. Empty = use them all.", Finished = false})
            V.WateringBox:AddToggle("WaterInSprinklerToggle", {Text = "\240\159\146\166 Water the Sprinkler", Default = S.WaterOnlyInSprinkler, Tooltip = "Ignores plant selection: keeps the active sprinkler\'s center WET, so water + sprinkler boosts overlap in one spot \226\128\148 Boost Zone planting drops seeds right in it."})
            V.WateringBox:AddToggle("WateringToggle", {Text = "\240\159\154\191 Auto Watering Can";
            Default = S.WateringEnabled, Tooltip = "Keeps the selected plants watered: clusters them within the splash radius (fewest can uses) and re-waters when the effect expires."})
            pcall(function ()
                ng.WateringKeepInput:OnChanged(function ()
                    S.WateringKeepCount = ng.WateringKeepInput.Value
                    P()
                end)
                Cg.WaterInSprinklerToggle:OnChanged(function (h)
                    S.WaterOnlyInSprinkler = h
                    P()
                end)
                Cg.WateringToggle:OnChanged(function (h)
                    S.WateringEnabled = h
                    P()
                end)
            end)
            task.spawn(function ()
                while true
                do
                    local s = false
                    if S.SprinklerEnabled and (V.GameLoaded() and (fg and (fg.Place and V.FarmGrid))) then
                        local U = B()
                        local r = tonumber(tostring(E:GetAttribute("PlotId")))
                        if U and r then
                            local U = V.FarmGrid.ActiveSprinklers()
                            local B = {}
                            for h, s in ipairs(U)
                            do
                                B[s.Name] = true
                            end
                            for h, u in ipairs(h)
                            do
                                if S.SprinklerSelected[u] and not B[u] then
                                    local h = K("Sprinkler", u)
                                    if h and v(h, S.SprinklerKeepCount) then
                                        local B = ((V.FarmGrid.SprinklerRadii or {}))[u] or (-532177) - (-532197)
                                        local K = B * B
                                        local v = S.SprinklerPlacementMode
                                        local E, Y
                                        if v == Jg or v == pg then
                                            local h = f(v)
                                            if h then
                                                E = q(h, U)
                                            end
                                            else
                                            local h, s = S.SprinklerPlants, false
                                            if type(h) == "table" then
                                                for h, U in pairs(h)
                                                do
                                                    if U then
                                                        s = true
                                                        break
                                                    end
                                                    end
                                                end
                                            local r = i(s and h or nil)
                                            if #r > 0 then
                                                local h, s = 0, 0
                                                for U, r in ipairs(r)
                                                do
                                                    h = h + r.pos.X
                                                    s = s + r.pos.Z
                                                end
                                                h, s = h / #r, s / #r
                                                local B, d
                                                for U, v in ipairs(V.FarmGrid.Cells())
                                                do
                                                    local i = 0
                                                    for h, s in ipairs(r)
                                                    do
                                                        local U, r = v.X - s.pos.X, v.Z - s.pos.Z
                                                        if U * U + r * r <= K then
                                                            i = i + (1)
                                                        end
                                                        end
                                                    local u, E = v.X - h, v.Z - s
                                                    local V = u * u + E * E
                                                    if not Y or i > Y or (i == Y and V < d) then
                                                        Y = i
                                                        B = v
                                                        d = V
                                                    end
                                                    end
                                                if B then
                                                    E = q(B, U)
                                                end
                                                end
                                            end
                                        if E and (((not V.GearLock or V.GearLock("sprinkler", 3))) and d(h)) then
                                            pcall(function ()
                                                fg.Place.PlaceSprinkler:Fire(E, u, h, r)
                                            end)
                                            V:Notify(Y and string.format("<font color=\"#7EC8FF\">\240\159\146\166 Placed %s</font> <font color=\"#AAAAAA\">(covers %d plants)</font>", u, Y) or string.format("<font color=\"#7EC8FF\">\240\159\146\166 Placed %s</font> <font color=\"#AAAAAA\">(at placement point)</font>", u), 3)
                                            s = true
                                        end
                                        end
                                    if s then
                                        break
                                    end
                                    end
                                end
                            end
                        end
                    task.wait(S.SprinklerEnabled and 1477026692 % (12411989) or 2)
                end
                end)
            local o = {}
            task.spawn(function ()
                while true
                do
                    local h = false
                    if S.WateringEnabled and (V.GameLoaded() and (fg and fg.WateringCan)) then
                        local U = S.WateringCanChoice
                        local r = s[U]
                        local B = r and K("WateringCan", U)
                        if r and (B and v(B, S.WateringKeepCount)) then
                            local s = os.clock()
                            local K = E.Character and E.Character:FindFirstChild("HumanoidRootPart")
                            local function v(h)
                                local K = (V.FarmGrid and V.FarmGrid.GroundOnBed(h)) or h
                                pcall(function ()
                                    fg.WateringCan.UseWateringCan:Fire(K - Vector3.new(0, 0.3, 0), U, B)
                                end)
                                V.WetZones = {{Position = K, Radius = r.Radius, Until = s + r.Effect}}
                            end
                            if S.WaterOnlyInSprinkler then
                                if ((o.__zone or 0)) <= s then
                                    local U = V.FarmGrid and V.FarmGrid.ActiveSprinklers() or {}
                                    local i
                                    for h, s in ipairs(U)
                                    do
                                        if not i or s.Radius > i.Radius then
                                            i = s
                                        end
                                        end
                                    if i and (K and (((i.Position - K.Position)).Magnitude <= 18 and (((not V.GearLock or V.GearLock("water", 2.5))) and d(B)))) then
                                        v(i.Position)
                                        o.__zone = s + r.Effect
                                        h = true
                                    end
                                    end
                                else
                                local U = {}
                                for h, r in ipairs(i(S.WateringSelected))
                                do
                                    if ((o[r.name] or 0)) <= s and (K and ((r.pos - K.Position)).Magnitude <= 18) then
                                        U[#U + 1] = r
                                    end
                                    end
                                if #U > 0 then
                                    local K = r.Radius * r.Radius
                                    local i, u
                                    for h, s in ipairs(U)
                                    do
                                        local r = {}
                                        for h, U in ipairs(U)
                                        do
                                            local B, d = s.pos.X - U.pos.X, s.pos.Z - U.pos.Z
                                            if B * B + d * d <= K then
                                                r[#r + 1] = U
                                            end
                                            end
                                        if not u or #r > #u then
                                            i, u = s, r
                                        end
                                        end
                                    if i and (((not V.GearLock or V.GearLock("water", 2.5))) and d(B)) then
                                        v(i.pos)
                                        for h, U in ipairs(u)
                                        do
                                            o[U.name] = s + r.Effect
                                        end
                                        h = true
                                    end
                                    end
                                end
                            end
                        end
                    task.wait(h and .7 or (1644565784.5) % 15950219.5)
                end
                end)
        end
        h()
    end
    do
        local function h()
            if type(S.PreventWeatherSelected) ~= "table" then
                S.PreventWeatherSelected = {}
            end
            local h = {"Rain";
            "Lightning";
            "Rainbow", "Snowfall", "Starfall";
            "Aurora";
            "Sunburst";
            "Bloodmoon", "Night", "Gold Moon";
            "Rainbow Moon", "Mega Moon"}
            local s = {Rain = "#55AAFF";
            Lightning = "#FFF14A", Rainbow = "#FF7EF5", Snowfall = "#7ED6FF", Starfall = "#C77EFF", Aurora = "#7EFFC8", Sunburst = "#FF8C3A";
            Bloodmoon = "#FF4A4A", Night = "#9A9AC8";
            ["Gold Moon"] = "#FFD700", ["Rainbow Moon"] = "#FF7EF5";
            ["Mega Moon"] = "#B57EFF"}
            local r = {Rain = "x2 growth";
            Lightning = "electric fruit", Rainbow = "rainbow luck", Snowfall = "frozen fruit", Starfall = "starstruck fruit";
            Aurora = "aurora fruit";
            Sunburst = "ignited fruit", Bloodmoon = "event";
            Night = "day cycle";
            ["Gold Moon"] = "drops seed packs", ["Rainbow Moon"] = "drops seed packs", ["Mega Moon"] = "drops seed packs"}
            local B = {}
            for h, U in ipairs(h)
            do
                B[U] = string.format("<font color=\"%s\">%s</font> <font color=\"#8C8C8C\">%s</font>", s[U] or "#FFFFFF", U, r[U] or "")
            end
            local K = false
            local function d(h)
                if K then
                    return
                end
                if not S.PreventWeatherEnabled then
                    return
                end
                if not S.PreventWeatherSelected[h] then
                    return
                end
                K = true V:Notify("\226\155\136\239\184\143 "..(tostring(h).." started \226\128\148 leaving the server\226\128\166"), 5)
                task.wait(1)
                pcall(function ()
                    E:Kick("[TOMI HUB] Prevent Weather: "..tostring(h))
                end)
            end
            V.WeatherBox = yg:AddRightGroupbox("\226\155\136\239\184\143 Prevent Weather")
            Ie(V.WeatherBox)
            Te(V.WeatherBox, "PreventWeatherDropdown", "Weathers", h, {multi = true, text = "Weathers", store = S.PreventWeatherSelected;
            displayMap = B;
            onChange = P;
            tooltip = "Weathers you DON\'T want. The moment one starts you leave the server \226\128\148 turn on Auto Reconnect to land in a fresh, weather-free one."})
            V.WeatherBox:AddToggle("PreventWeatherToggle", {Text = "\226\155\136\239\184\143 Prevent Weather";
            Default = S.PreventWeatherEnabled, Tooltip = "Auto-kicks you out of the game when a selected weather starts. Pair with Auto Reconnect."})
            pcall(function ()
                Cg.PreventWeatherToggle:OnChanged(function (h)
                    S.PreventWeatherEnabled = h
                    P()
                end)
            end)
            task.spawn(function ()
                local h = fg and fg.WeatherEffects
                if not h then
                    return
                end
                local s = {RainStart = "Rain";
                LightningStart = "Lightning", RainbowStart = "Rainbow";
                BlizzardStart = "Snowfall", BloodmoonStart = "Bloodmoon";
                NightStart = "Night", GoldMoonStrike = "Gold Moon", RainbowMoonStrike = "Rainbow Moon"}
                for s, U in pairs(s)
                do
                    local r = h[s]
                    if r and r.OnClientEvent then
                        pcall(function ()
                            r.OnClientEvent:Connect(function ()
                                d(U)
                            end)
                        end)
                    end
                    end
                local U = fg and (fg.SeedPackSpawn and fg.SeedPackSpawn.Announce)
                if U and U.OnClientEvent then
                    pcall(function ()
                        U.OnClientEvent:Connect(function (...)
                            for h = 1, select("#",...), 1
                            do
                                local s = (select(h,...))
                                if type(s) == "string" then
                                    local h = s:lower()
                                    if h:find("mega") then
                                        d("Mega Moon")
                                        return
                                    end
                                    if h:find("gold") then
                                        d("Gold Moon")
                                        return
                                    end
                                    if h:find("rainbow") then
                                        d("Rainbow Moon")
                                        return
                                    end
                                    end
                                end
                            end)
                    end)
                end
                end)
            task.spawn(function ()
                while true
                do
                    if S.PreventWeatherEnabled and not K then
                        local h = U:FindFirstChild("WeatherValues")
                        if h then
                            for h, s in ipairs(h:GetChildren())
                            do
                                local U = s:FindFirstChild("Playing")
                                if U and (U:IsA("BoolValue") and U.Value == true) then
                                    d(s.Name)
                                end
                                end
                            end
                        end
                    task.wait(2)
                end
                end)
        end
        h()
    end
    local Mm = yg:AddLeftGroupbox("\240\159\142\129 Event Seeds")
    Ie(Mm)
    Te(Mm, "EventSeedsMovementDropdown", "Movement Method", {"Hop";
    "Tween", "Walk"}, {multi = false, get = function ()
        local h = S.EventSeedsMethod
        return (h == "Blink") and "Hop" or h
    end;
    set = function (h)
        S.EventSeedsMethod = h
        P()
    end, tooltip = "How the bot moves to event seeds."})
    Mm:AddDivider()
    Mm:AddToggle("EventSeedsToggle", {Text = "Auto Collect Event Seeds", Default = S.EventSeedsEnabled;
    Tooltip = "Moves to event seed-pack spawns around the map and claims them."})
    do
        local h = 54
        local s = ":\247"
        local r = " "
        V.VulnBox = V.VulnTab:AddLeftGroupbox("\226\134\169\239\184\143 Rollback")
        Ie(V.VulnBox)
        Le(V.VulnBox, "VulnButtonsPanel", {{"\226\134\169\239\184\143 Rollback";
        function ()
            if not re then
                V:Notify("\226\154\160\239\184\143 Packet remote missing \226\128\148 can\'t rollback.", 4)
                return
            end
            V:Notify("\226\134\169\239\184\143 Rollback \226\128\148 dropping the session; rejoin to revert unsaved items.", 5)
            pcall(function ()
                re:FireServer(h, s)
            end)
        end};
        {"\240\159\148\129 Rollback and Rejoin", function ()
            if not re then
                V:Notify("\226\154\160\239\184\143 Packet remote missing \226\128\148 can\'t rollback.", 4)
                return
            end
            if not S.AutoReconnect then
                V:Notify("\226\154\160\239\184\143 Turn on Auto Reconnect (Main tab) first \226\128\148 it does the rejoin.", 6)
                return
            end
            V:Notify("\240\159\148\129 Rollback + Rejoin \226\128\148 reverting, then reconnecting\226\128\166", 5)
            pcall(function ()
                re:FireServer(h, s)
            end)
            task.wait(1)
            pcall(function ()
                E:Kick("[TOMI HUB] Rollback & Rejoin \226\128\148 reconnecting\226\128\166")
            end)
        end};
        {"\240\159\146\190 Save", function ()
            if not re then
                V:Notify("\226\154\160\239\184\143 Packet remote missing.", 4)
                return
            end
            pcall(function ()
                re:FireServer(h, r)
            end)
            V:Notify("\240\159\146\190 Save \226\128\148 sent the stand-down packet.", 4)
        end}})
        if type(S.UnliWaterPlants) ~= "table" then
            S.UnliWaterPlants = {}
        end
        local B = {["Common Watering Can"] = {Effect = 10;
        Radius = 5};
        ["Super Watering Can"] = {Effect = 15;
        Radius = 8}}
        pcall(function ()
            for h, s in ipairs(require(U.SharedModules.WateringcanData))
            do
                if s.Name then
                    B[s.Name] = {Effect = tonumber(s.EffectTime) or 10;
                    Radius = tonumber(s.SplashRadius) or 5}
                end
                end
            end)
        local K = {}
        for h in pairs(B)
        do
            K[#K + 1] = h
        end
        table.sort(K)
        local v = {["Common Watering Can"] = "<font color=\"#B8B8C4\">Common Watering Can</font> <font color=\"#8C8C8C\">x3 \194\183 r5</font>", ["Super Watering Can"] = "<font color=\"#FFD700\">Super Watering Can</font> <font color=\"#8C8C8C\">x300 \194\183 r8</font>"}
        local function i(h, s)
            local function U(U)
                if not U then
                    return nil
                end
                for U, r in ipairs(U:GetChildren())
                do
                    if r:IsA("Tool") and r:GetAttribute(h) == s then
                        return r
                    end
                    end
                end
            return U(E.Character) or U(E:FindFirstChildOfClass("Backpack"))
        end
        local function u(h)
            local s = E.Character
            if not s then
                return false
            end
            if h.Parent == s then
                return true
            end
            local U = s:FindFirstChildOfClass("Humanoid")
            if U then
                pcall(function ()
                    U:EquipTool(h)
                end)
            end
            local r = os.clock()
            while h.Parent ~= s and os.clock() - r < 1.2
            do
                task.wait(0.1)
            end
            return h.Parent == s
        end
        local Y = {}
        local function f()
            Y = {}
            for h, s in ipairs(d:GetPlayers())
            do
                if s ~= E then
                    Y[#Y + 1] = s.DisplayName
                end
                end
            table.sort(Y)
        end
        f()
        d.PlayerAdded:Connect(function ()
            f()
            pcall(function ()
                if V.UnliWaterPlayerOverlay then
                    V.UnliWaterPlayerOverlay.SetItems(Y)
                end
                end)
        end)
        d.PlayerRemoving:Connect(function ()
            task.defer(function ()
                f()
                pcall(function ()
                    if V.UnliWaterPlayerOverlay then
                        V.UnliWaterPlayerOverlay.SetItems(Y)
                    end
                    end)
            end)
        end)
        local function N(h, s)
            local U
            for s, r in ipairs(d:GetPlayers())
            do
                if r.DisplayName == h or r.Name == h then
                    U = r
                    break
                end
                end
            if not U then
                return {}
            end
            local r = U:GetAttribute("PlotId")
            local B = r and (workspace:FindFirstChild("Gardens") and workspace.Gardens:FindFirstChild("Plot"..tostring(r)))
            local K = B and B:FindFirstChild("Plants")
            local v = {}
            if K then
                local h = false
                if type(s) == "table" then
                    for s, U in pairs(s)
                    do
                        if U then
                            h = true
                            break
                        end
                        end
                    end
                for r, B in ipairs(K:GetChildren())
                do
                    if B:IsA("Model") and B:GetAttribute("UserId") == U.UserId then
                        local U = tostring(B:GetAttribute("SeedName") or "")
                        if not h or (s and s[U]) then
                            local h, s = pcall(function ()
                                return (B:GetPivot()).Position
                            end)
                            if h then
                                v[#v + 1] = {name = B.Name;
                                pos = s;
                                seed = U}
                            end
                            end
                        end
                    end
                end
            return v
        end
        V.UnliWaterBox = V.VulnTab:AddLeftGroupbox("\240\159\146\167 Unli Watering Can")
        Ie(V.UnliWaterBox)
        V.UnliWaterPlayerOverlay = Te(V.UnliWaterBox, "UnliWaterTargetDropdown", "Target Player", Y, {multi = false;
        text = "Target Player", get = function ()
            return S.UnliWaterTarget
        end;
        set = function (h)
            S.UnliWaterTarget = h
            P()
        end, tooltip = "The player whose plants you want to water."})
        V.AddPlantPicker(V.UnliWaterBox, "UnliWaterPlantsDropdown", "Target Plants", S.UnliWaterPlants, "Plant types to water. Empty = water all plants on the target plot.")
        Te(V.UnliWaterBox, "UnliWaterCanDropdown", "Watering Can", K, {multi = false, text = "Watering Can", displayMap = v, get = function ()
            return S.UnliWaterCan
        end, set = function (h)
            S.UnliWaterCan = h
            P()
        end, tooltip = "Which watering can to use. Super = \195\151300 growth for 15s in an 8-stud splash; Common = \195\1513 for 10s in 5 studs."})
        Te(V.UnliWaterBox, "UnliWaterMovementDropdown", "Movement Method", {"Hop", "Tween";
        "Walk"}, {multi = false, get = function ()
            return S.UnliWaterMethod
        end;
        set = function (h)
            S.UnliWaterMethod = h
            P()
        end;
        tooltip = "How the bot moves to the target plants."})
        V.UnliWaterBox:AddInput("UnliWaterUsesInput", {Text = "Uses Per Cycle";
        Default = tostring(S.UnliWaterUses or ""), Numeric = true;
        Placeholder = "0 = till empty", Tooltip = "How many watering can uses before rollback. Empty / 0 = use till the can is empty.";
        Finished = true})
        V.UnliWaterBox:AddInput("UnliWaterRejoinsInput", {Text = "Number of Rejoins", Default = tostring(S.UnliWaterRejoins or ""), Numeric = true, Placeholder = "0", Tooltip = "How many rollback+rejoin cycles to run. Persists across rejoins.";
        Finished = true})
        V.UnliWaterBox:AddInput("UnliWaterDelayInput", {Text = "Delay to Rejoin (sec)";
        Default = tostring(S.UnliWaterDelay or ""), Numeric = true;
        Placeholder = "3", Tooltip = "Seconds to wait after watering before the kick.";
        Finished = true})
        V.UnliWaterBox:AddToggle("UnliWaterToggle", {Text = "\240\159\146\167 Unli Watering Can";
        Default = S.UnliWaterEnabled;
        Tooltip = "Waters the target player\'s plants with your cans, then rollback+rejoin to recover them. Needs Auto Reconnect ON."})
        pcall(function ()
            ng.UnliWaterUsesInput:OnChanged(function ()
                S.UnliWaterUses = ng.UnliWaterUsesInput.Value
                P()
            end)
        end)
        pcall(function ()
            ng.UnliWaterRejoinsInput:OnChanged(function ()
                S.UnliWaterRejoins = ng.UnliWaterRejoinsInput.Value
                P()
            end)
        end)
        pcall(function ()
            ng.UnliWaterDelayInput:OnChanged(function ()
                S.UnliWaterDelay = ng.UnliWaterDelayInput.Value
                P()
            end)
        end)
        local function q(h)
            if h then
                V:Notify(h, 6)
            end
            S.UnliWaterEnabled = false P()
            pcall(function ()
                Cg.UnliWaterToggle:SetValue(false)
            end)
        end
        local z = false
        local function A()
            if z then
                return
            end
            z = true
            local U = tonumber(S.UnliWaterRemaining) or 0
            if U <= 0 then
                q("\226\156\133 Unli Watering Can finished.")
                z = false
                return
            end
            if not S.AutoReconnect then
                q("\226\154\160\239\184\143 Unli Watering Can needs Auto Reconnect ON \226\128\148 stopped.")
                z = false
                return
            end
            if not re then
                q("\226\154\160\239\184\143 Packet remote missing \226\128\148 Unli Watering Can stopped.")
                z = false
                return
            end
            if not fg or not fg.WateringCan then
                q("\226\154\160\239\184\143 Watering can network missing \226\128\148 stopped.")
                z = false
                return
            end
            local r = S.UnliWaterTarget
            if r == "" then
                q("\226\154\160\239\184\143 No target player selected.")
                z = false
                return
            end
            local K = S.UnliWaterCan
            local d = B[K]
            if not d then
                q("\226\154\160\239\184\143 Unknown watering can: "..tostring(K))
                z = false
                return
            end
            local v = tonumber(S.UnliWaterUses) or -590192
            local Y = v > 0 and v or math.huge
            local f = 0
            pcall(function ()
                re:FireServer(h, s)
            end)
            V:Notify("\240\159\155\161\239\184\143 Rollback armed \226\128\148 can uses are protected from now on.", 4)
            pcall(c)
            if not S.UnliWaterEnabled then
                z = false
                return
            end
            V:Notify((("\240\159\146\167 Unli Watering Can \226\128\148 watering %s\'s plants; %d rejoin(s) left.")):format(r, U), 5)
            local A, l = {}, 1438872966 % (11154054)
            while Y > 0 and S.UnliWaterEnabled
            do
                local h = i("WateringCan", K)
                if not h then
                    V:Notify("\240\159\146\167 Out of "..(K.." \226\128\148 proceeding to rollback."), 4)
                    break
                end
                local s = tonumber(h:GetAttribute("Count")) or (381630) + -381630
                if s <= 471543600 % (6287248) then
                    V:Notify("\240\159\146\167 Watering can empty \226\128\148 proceeding to rollback.", 4)
                    break
                end
                if l >= #A then
                    A = N(r, S.UnliWaterPlants)
                    l = 0
                    if #A == 0 then
                        V:Notify("\240\159\146\167 No target plants found \226\128\148 proceeding to rollback.", 4)
                        break
                    end
                    end
                l = l + (1)
                local U = A[l]
                local B = E.Character and E.Character:FindFirstChild("HumanoidRootPart")
                if not B then
                    break
                end
                local d = false
                if ((U.pos - B.Position)).Magnitude > 16 then
                    Xe(U.pos, function ()
                        local h = E.Character and E.Character:FindFirstChild("HumanoidRootPart")
                        return S.UnliWaterEnabled and (h ~= nil and ((U.pos - h.Position)).Magnitude > 16)
                    end, S.UnliWaterMethod)
                    B = E.Character and E.Character:FindFirstChild("HumanoidRootPart")
                    if not S.UnliWaterEnabled then
                        break
                    end
                    if not B or ((U.pos - B.Position)).Magnitude > (-390690) - (-390708) then
                        d = true
                    end
                    end
                if d then
                    task.wait(0.2)
                elseif u(h) then
                    pcall(function ()
                        fg.WateringCan.UseWateringCan:Fire(U.pos - Vector3.new(0, 0.3, 0), K, h)
                    end)
                    f = f + (1)
                    Y = Y - (1)
                    task.wait(1)
                else
                    l = l - 1
                    task.wait(0.2)
                end
                end
            V:Notify((("\240\159\146\167 Watered %d time(s) \226\128\148 rolling back\226\128\166")):format(f), 5)
            local o = tonumber(S.UnliWaterDelay) or 3
            if o < 0 then
                o = 167942775 % (7997275)
            end
            task.wait(o)
            S.UnliWaterRemaining = U - (1)
            P()
            pcall(function ()
                re:FireServer(h, s)
            end)
            task.wait(1)
            pcall(function ()
                E:Kick("[TOMI HUB] Unli Watering Can \226\128\148 rollback & rejoin\226\128\166")
            end)
            z = false
        end
        pcall(function ()
            Cg.UnliWaterToggle:OnChanged(function (h)
                S.UnliWaterEnabled = h
                if h then
                    if not S.AutoReconnect then
                        q("\226\154\160\239\184\143 Turn on Auto Reconnect (Main tab) first \226\128\148 it does the rejoin.")
                        return
                    end
                    if S.UnliWaterTarget == "" then
                        q("\226\154\160\239\184\143 Select a target player first.")
                        return
                    end
                    S.UnliWaterRemaining = tonumber(S.UnliWaterRejoins) or (335960250) % (1343841)
                    P()
                    if ((S.UnliWaterRemaining or -985416)) <= 0 then
                        q("Set Number of Rejoins > 0 first.")
                        return
                    end
                    task.spawn(A)
                else
                    P()
                end
                end)
        end)
        task.spawn(function ()
            task.wait(8)
            if S.UnliWaterEnabled and ((tonumber(S.UnliWaterRemaining) or -1787010)) > 0 then
                A()
            end
            end)
        if type(S.UnliSeeds) ~= "table" then
            S.UnliSeeds = {}
        end
        V.UnliBox = V.VulnTab:AddRightGroupbox("\240\159\146\166 Unli Sprinkler")
        Ie(V.UnliBox)
        Te(V.UnliBox, "UnliSeedDropdown", "Seeds to Drop", ag, {multi = true, text = "Seeds to Drop", store = S.UnliSeeds, displayMap = V.DM.plant;
        onChange = P;
        tooltip = "Seeds dropped each cycle before the rollback+rejoin. Same list as Auto Plant."})
        V.UnliBox:AddInput("UnliRejoinsInput", {Text = "Number of Rejoins", Default = tostring(S.UnliRejoins or ""), Numeric = true, Placeholder = "0";
        Tooltip = "How many drop \226\134\146 rejoin cycles to run. Persists across rejoins.";
        Finished = true})
        V.UnliBox:AddInput("UnliDelayInput", {Text = "Delay to Rejoin (sec)";
        Default = tostring(S.UnliDelay or "");
        Numeric = true, Placeholder = "3";
        Tooltip = "Seconds to wait after dropping the seeds before the kick.";
        Finished = true})
        V.UnliBox:AddToggle("UnliToggle", {Text = "\240\159\146\166 Unli Sprinkler", Default = S.UnliEnabled, Tooltip = "Drops the selected seeds then rollback+rejoins, N times. Needs Auto Reconnect ON."})
        pcall(function ()
            ng.UnliRejoinsInput:OnChanged(function ()
                S.UnliRejoins = ng.UnliRejoinsInput.Value
                P()
            end)
        end)
        pcall(function ()
            ng.UnliDelayInput:OnChanged(function ()
                S.UnliDelay = ng.UnliDelayInput.Value
                P()
            end)
        end)
        local function l()
            local h = E.Character and E.Character:FindFirstChildOfClass("Humanoid")
            local s, U = 0, {}
            local function r(r)
                if not r then
                    return
                end
                for r, B in ipairs(r:GetChildren())
                do
                    local K = B:IsA("Tool") and B:GetAttribute("SeedTool")
                    if K and (S.UnliSeeds[K] and not U[K]) then
                        U[K] = true
                        if h then
                            pcall(function ()
                                h:EquipTool(B)
                            end)
                        end
                        task.wait(0.15)
                        pcall(function ()
                            fg.DroppedItem.RequestDrop:Fire("Seeds", K)
                        end)
                        s = s + (1)
                        task.wait(0.15)
                    end
                    end
                end
            r(E:FindFirstChildOfClass("Backpack"))
            r(E.Character)
            return s
        end
        local function o(h)
            if h then
                V:Notify(h, 6)
            end
            S.UnliEnabled = false P()
            pcall(function ()
                Cg.UnliToggle:SetValue(false)
            end)
        end
        local Q = false
        local function R()
            if Q then
                return
            end
            Q = true
            local U = tonumber(S.UnliRemaining) or 0
            if U <= 1073356110 % (12480885) then
                o("\226\156\133 Unli Sprinkler finished.")
                Q = false
                return
            end
            if not S.AutoReconnect then
                o("\226\154\160\239\184\143 Unli Sprinkler needs Auto Reconnect ON \226\128\148 stopped.")
                Q = false
                return
            end
            if not re then
                o("\226\154\160\239\184\143 Packet remote missing \226\128\148 Unli Sprinkler stopped.")
                Q = false
                return
            end
            pcall(function ()
                re:FireServer(h, s)
            end)
            V:Notify("\240\159\155\161\239\184\143 Rollback armed \226\128\148 dropped seeds are protected from now on.", 4)
            pcall(c)
            if not S.UnliEnabled then
                Q = false
                return
            end
            local r = l()
            V:Notify((("\240\159\146\166 Unli Sprinkler \226\128\148 dropped %d seed(s); %d rejoin(s) left.")):format(r, U), 5)
            local B = tonumber(S.UnliDelay) or (-371608) + 371611
            if B < 0 then
                B = 0
            end
            task.wait(B)
            S.UnliRemaining = U - (1)
            P()
            pcall(function ()
                re:FireServer(h, s)
            end)
            task.wait(1)
            pcall(function ()
                E:Kick("[TOMI HUB] Unli Sprinkler \226\128\148 rollback & rejoin\226\128\166")
            end)
            Q = false
        end
        pcall(function ()
            Cg.UnliToggle:OnChanged(function (h)
                S.UnliEnabled = h
                if h then
                    if not S.AutoReconnect then
                        o("\226\154\160\239\184\143 Turn on Auto Reconnect (Main tab) first \226\128\148 it does the rejoin.")
                        return
                    end
                    S.UnliRemaining = tonumber(S.UnliRejoins) or 0
                    P()
                    if ((S.UnliRemaining or 0)) <= 1603215956 % (9321023) then
                        o("Set Number of Rejoins > 0 first.")
                        return
                    end
                    task.spawn(R)
                else
                    P()
                end
                end)
        end)
        task.spawn(function ()
            task.wait(6)
            if S.UnliEnabled and ((tonumber(S.UnliRemaining) or -672308)) > 0 then
                R()
            end
            end)
    end
    local wm = Og:AddLeftGroupbox("\240\159\140\177 Seed Shop")
    Ie(wm)
    Te(wm, "SeedSelectDropdown", "Seed Targets", ag, {multi = true, store = Fg, onChange = P, displayMap = V.DM.seedShop})
    wm:AddDivider()
    wm:AddToggle("BuySeedsToggle", {Text = "Auto Buy Seeds";
    Default = S.BuySeedsEnabled, Tooltip = "Buys the selected seeds whenever they\'re in stock."})
    local Fm = Og:AddRightGroupbox("\226\154\153\239\184\143 Gear Shop")
    Ie(Fm)
    Te(Fm, "GearSelectDropdown", "Gear Targets", Mg, {multi = true, store = gg, onChange = P;
    displayMap = V.DM.gearShop})
    Fm:AddDivider()
    Fm:AddToggle("BuyGearsToggle", {Text = "Auto Buy Gears";
    Default = S.BuyGearsEnabled;
    Tooltip = "Buys the selected gears whenever they\'re in stock."})
    local gm = Og:AddLeftGroupbox("\240\159\147\166 Crate Shop")
    Ie(gm)
    Te(gm, "CrateSelectDropdown", "Crate Targets", wg, {multi = true, store = jg;
    onChange = P, displayMap = V.DM.crateShop})
    gm:AddDivider()
    gm:AddToggle("BuyCratesToggle", {Text = "Auto Buy Crates";
    Default = S.BuyCratesEnabled, Tooltip = "Buys the selected crates whenever they\'re in stock."})
    do
        local function h()
            if type(S.AuctionBuyList) ~= "table" then
                S.AuctionBuyList = {}
            end
            if S.AuctionShecklesFloor == nil then
                S.AuctionShecklesFloor = ""
            end
            local h, s = {"Any"}, {}
            local function r(U)
                if type(U) ~= "table" then
                    return
                end
                for U, r in ipairs(U)
                do
                    if type(r) == "string" and (r ~= "" and (r:sub(1, 3) ~= "No " and not s[r])) then
                        s[r] = true table.insert(h, r)
                    end
                    end
                end
            if type(S.AuctionKnownItems) ~= "table" then
                S.AuctionKnownItems = {}
            end
            r(ag)
            r(Mg)
            r(wg)
            pcall(function ()
                local h = require(U.SharedModules.EggData)
                for h, s in pairs(h.Data or h)
                do
                    if type(s) == "table" and (type(s.EggName) == "string" and s.EggName ~= "Test Egg") then
                        r({s.EggName})
                    end
                    end
                end)
            pcall(function ()
                local h = require(U.SharedModules.SeedPackData)
                for h, s in pairs(h.Data or h)
                do
                    if type(s) == "table" and type(s.PackName) == "string" then
                        r({s.PackName})
                    end
                    end
                end)
            r(S.AuctionKnownItems)
            local function B()
                table.sort(h, function (h, s)
                    if h == "Any" then
                        return true
                    elseif s == "Any" then
                        return false
                    end
                    return h < s
                end)
            end
            B()
            local K, d
            do
                local h, s = pcall(require, U.SharedModules.Networking)
                if h then
                    K = s
                end
                end
            do
                local h, s = pcall(require, U.SharedModules.Auctioneer)
                if h then
                    d = s
                end
                end
            local function v()
                local h, s = pcall(function ()
                    return workspace:GetServerTimeNow()
                end)
                if h then
                    return s
                end
                return os.time()
            end
            local function i()
                local h = E:FindFirstChild("leaderstats")
                local s = h and h:FindFirstChild("Sheckles")
                return (s and tonumber(s.Value)) or 600154245 % (4445587)
            end
            local function u(h)
                if type(h) ~= "table" then
                    return false
                end
                for h, s in pairs(h)
                do
                    if s then
                        return true
                    end
                    end
                return false
            end
            local Y, f = {}, {}
            local N = {}
            local q = {}
            local z = {}
            local A, l, o
            local Q = {}
            for h, s in ipairs(h)
            do
                Q[s] = true
            end
            local function R(s)
                local U = false
                for s, r in ipairs(s)
                do
                    local B = ((type(r) == "table" and r.item ~= nil)) and tostring(r.item) or nil
                    if B and (B ~= "" and not Q[B]) then
                        Q[B] = true table.insert(h, B)
                        table.insert(S.AuctionKnownItems, B)
                        U = true
                    end
                    end
                if U then
                    B()
                    pcall(function ()
                        if o and o.Overlay then
                            o.Overlay:SetItems(h)
                        end
                        end)
                    P()
                end
                end
            local function b(h)
                if type(h) ~= "table" then
                    return
                end
                local s = h.manifest
                if type(s) == "table" and type(s.lots) == "table" then
                    Y = {}
                    for h, s in ipairs(s.lots)
                    do
                        if type(s) == "table" and type(s.lotId) == "string" then
                            table.insert(Y, s)
                        end
                        end
                    R(Y)
                end
                if type(h.stock) == "table" then
                    f = h.stock
                end
                end
            if K and K.Auctioneer then
                pcall(function ()
                    K.Auctioneer.Snapshot.OnClientEvent:Connect(b)
                    K.Auctioneer.StockUpdate.OnClientEvent:Connect(function (h)
                        if type(h) == "table" and type(h.stock) == "table" then
                            f = h.stock
                        end
                        end)
                    K.Auctioneer.PurchaseResult.OnClientEvent:Connect(function (h, s)
                        local U = q[h]
                        q[h] = nil
                        if s and (U and S.AuctionBuyList[U]) then
                            N[U] = ((N[U] or 0)) + (2869145896) % (12420545)
                            pcall(function ()
                                A()
                            end)
                        end
                        end)
                end)
            end
            local function a(h, s)
                if s.Item and (s.Item ~= "" and s.Item ~= "Any") then
                    if tostring(h.item) ~= s.Item then
                        return false
                    end
                    end
                return true
            end
            local function M(h, s)
                local U = tonumber(h.startPrice) or 740921 + (-740921)
                if d and d.CurrentPrice then
                    local r, B = pcall(d.CurrentPrice, h, s)
                    if r and type(B) == "number" then
                        U = B
                    end
                    end
                return U
            end
            local function w(h, s, U, r, B)
                local v = h.lotId
                local i = f[v]
                if d and d.IsActive then
                    local s, U = pcall(d.IsActive, h, r, i)
                    if s and not U then
                        return 0
                    end
                    end
                if h.expiresAt and r >= h.expiresAt then
                    return (-333427) - (-333427)
                end
                if i ~= nil and i <= 0 then
                    return (-213096) - (-213096)
                end
                local u = tonumber(U.Limit) or 0
                if u > 0 and ((N[s] or 0)) >= u then
                    return 768170 + (-768170)
                end
                local E = z[v]
                if E and (os.clock() - E) < 2054199157 % (14365029) then
                    return -395787 - (-395787)
                end
                local Y = M(h, r)
                local A = tonumber(h.startPrice) or Y
                local l = tonumber(h.minPrice) or Y
                local o = A - l
                local Q = -721050 + (721051)
                if o > -569197 - (-569197) then
                    Q = ((A - Y)) / o
                end
                local R = tonumber(U.Threshold)
                if not R then
                    R = 90
                end
                if R < 0 then
                    R = 0
                elseif R > -694958 - (-695058) then
                    R = 100
                end
                if Q * 100 < R then
                    return (1226762208) % 4868104
                end
                if Y > B then
                    return -2007648
                end
                local b = tonumber(S.AuctionShecklesFloor)
                if b and (B - Y) < b then
                    return (137047644) % 3806879
                end
                local a = (U.Item ~= "Any" and U.Item) or tostring(h.item)
                if S.AuctionDryRun then
                    V:Notify(string.format("<font color=\"#7EB8FF\">\240\159\167\170 Dry-run: would buy</font> %s <font color=\"#AAAAAA\">for %s\194\162 (%d%% down)</font>", tostring(a), We(Y), math.floor(Q * 100)), 3)
                    z[v] = os.clock()
                    return 0
                end
                z[v] = os.clock()
                q[v] = s
                pcall(function ()
                    K.Auctioneer.PurchaseLot:Fire(v, Y)
                end)
                V:Notify(string.format("<font color=\"#7EFFB0\">\240\159\148\168 Buying</font> %s <font color=\"#AAAAAA\">for %s\194\162</font>", tostring(a), We(Y)), 3)
                return Y
            end
            local F = V.AuctionTab:AddLeftGroupbox("\240\159\148\168 Auction Auto-Buy")
            V.AuctionFormBox = F
            Ie(F)
            o = Te(F, "AuctionItemDropdown", "Item", h, {multi = false, text = "Item", get = function ()
                return "Any"
            end, tooltip = "Item to buy. Leave as Any to match every item. New items are learned automatically from the live auction."})
            F:AddDivider()
            F:AddInput("AuctionThresholdInput", {Text = "Buy Threshold %";
            Default = "", Numeric = true, Placeholder = "90";
            Tooltip = "How far down toward the floor before buying. 100 = wait for the minimum, 0 = buy instantly. Empty = 90.", Finished = false})
            F:AddInput("AuctionLimitInput", {Text = "Buy Limit";
            Default = "", Numeric = true, Placeholder = "0 = unlimited", Tooltip = "How many of this entry to buy before it\'s done. Empty / 0 = unlimited.";
            Finished = false})
            F:AddInput("AuctionShecklesFloorInput", {Text = "\240\159\170\153 Sheckles Floor", Default = tostring(S.AuctionShecklesFloor or ""), Numeric = true;
            Placeholder = "off", Tooltip = "Stop buying if a purchase would drop your Sheckles below this. Empty = disabled.", Finished = false})
            F:AddDivider()
            local g = Instance.new("Frame")
            g.BackgroundTransparency = 1
            g.BorderSizePixel = 0
            g.Size = UDim2.new(1, 0, 0, 30)
            local j = Instance.new("UIListLayout")
            j.FillDirection = Enum.FillDirection.Horizontal
            j.HorizontalAlignment = Enum.HorizontalAlignment.Center
            j.SortOrder = Enum.SortOrder.LayoutOrder
            j.Padding = UDim.new(0, 4)
            j.Parent = g
            local function J(h, s)
                local U = Instance.new("TextButton")
                U.Font = Enum.Font.GothamSemibold
                U.TextSize = (-927751) - (-927764)
                U.TextColor3 = V.Scheme.FontColor
                U.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
                U.BorderSizePixel = 0
                U.Size = UDim2.new(s, -2, 1, 0)
                U.Text = h
                local r = Instance.new("UICorner")
                r.CornerRadius = UDim.new(0, 6)
                r.Parent = U
                local B = Instance.new("UIStroke")
                B.Color = V.Scheme.OutlineColor
                B.Thickness = 1
                B.Parent = U
                U.MouseEnter:Connect(function ()
                    U.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
                end)
                U.MouseLeave:Connect(function ()
                    U.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
                end)
                U.Parent = g
                return U
            end
            local p = J("\226\158\149 Add", 0.5)
            local D = J("\240\159\167\185 Clear", 0.5)
            local X = J("\240\159\151\145\239\184\143 Delete", 0.33)
            X.Visible = false F:AddUIPassthrough("AuctionFormButtons", {Instance = g;
            Height = 30})
            pcall(function ()
                ng.AuctionShecklesFloorInput:OnChanged(function ()
                    S.AuctionShecklesFloor = ng.AuctionShecklesFloorInput.Value
                    P()
                end)
            end)
            local W = V.AuctionTab:AddRightGroupbox("\240\159\147\156 Auction List")
            V.AuctionListBox = W
            Ie(W)
            local G = Instance.new("Frame")
            G.BackgroundTransparency = 1
            G.BorderSizePixel = 0
            G.Size = UDim2.new(1, 0, 0, 0)
            local t = Instance.new("UIListLayout")
            t.FillDirection = Enum.FillDirection.Vertical
            t.HorizontalAlignment = Enum.HorizontalAlignment.Center
            t.SortOrder = Enum.SortOrder.LayoutOrder
            t.Padding = UDim.new(0, 6)
            t.Parent = G
            local x = Instance.new("TextButton")
            x.Name = "__aDynGuard"
            x.AutomaticSize = Enum.AutomaticSize.Y
            x.Text = ""
            x.Parent = t
            W:AddUIPassthrough("AuctionListPassthrough", {Instance = G, Height = 1})
            local function C()
                task.defer(function ()
                    pcall(function ()
                        local h = t.AbsoluteContentSize.Y
                        if h == 0 then
                            for s, U in ipairs(G:GetChildren())
                            do
                                if U:IsA("GuiObject") and U ~= t then
                                    h = (h + U.AbsoluteSize.Y) + 6
                                end
                                end
                            end
                        Am(G, h, W)
                    end)
                end)
            end;
            (t:GetPropertyChangedSignal("AbsoluteContentSize")):Connect(C);
            (G:GetPropertyChangedSignal("AbsoluteSize")):Connect(C)
            task.spawn(function ()
                for h, s in ipairs({1;
                3, 8})
                do
                    task.wait(s)
                    C()
                end
                end)
            local n = nil l = function ()
                n = nil pcall(function ()
                    o:SetValue("Any")
                    ng.AuctionThresholdInput:SetValue("")
                    ng.AuctionLimitInput:SetValue("")
                end)
                p.Text = "\226\158\149 Add"
                D.Text = "\240\159\167\185 Clear"
                X.Visible = false p.Size = UDim2.new(0.5, -2, 1, 0)
                D.Size = UDim2.new(0.5, -2, 1, 0)
                C()
            end
            local function k(h)
                local s = {}
                if type(h) == "table" then
                    for h, U in pairs(h)
                    do
                        if U then
                            table.insert(s, h)
                        end
                        end
                    end
                table.sort(s)
                return #s > 533933 + (-533933) and table.concat(s, ", ") or nil
            end
            A = function ()
                for h, s in ipairs(G:GetChildren())
                do
                    if s:IsA("GuiObject") and s ~= t then
                        s:Destroy()
                    end
                    end
                if type(S.AuctionBuyList) ~= "table" then
                    S.AuctionBuyList = {}
                end
                for h, s in ipairs(S.AuctionBuyList)
                do
                    local U = tonumber(s.Limit) or (-873681) + (873681)
                    local r = U > 0 and tostring(U) or "Unlimited"
                    local B = ((s.Threshold ~= nil and s.Threshold ~= "")) and (tostring(s.Threshold).."%") or "90%"
                    local K = N[h] or 0
                    local d = Instance.new("TextButton")
                    d.Name = "AuctionEntry_"..tostring(h)
                    d.LayoutOrder = h
                    d.BorderSizePixel = 0
                    d.BackgroundColor3 = (n == h) and Color3.fromRGB(45, 55, 45) or Color3.fromRGB(32, 32, 32)
                    d.Size = UDim2.new(1, 0, 0, 0)
                    d.AutomaticSize = Enum.AutomaticSize.Y
                    d.Text = ""
                    local v = Instance.new("UICorner")
                    v.CornerRadius = UDim.new(0, 6)
                    v.Parent = d
                    local i = Instance.new("UIStroke")
                    i.Color = (n == h) and Color3.fromRGB(0, 180, 100) or V.Scheme.OutlineColor
                    i.Thickness = 1
                    i.Parent = d
                    local u = Instance.new("UIPadding")
                    u.PaddingTop = UDim.new(0, 8)
                    u.PaddingBottom = UDim.new(0, 8)
                    u.PaddingLeft = UDim.new(0, 8)
                    u.PaddingRight = UDim.new(0, 8)
                    u.Parent = d
                    local E = Instance.new("TextLabel")
                    E.BackgroundTransparency = 1
                    E.Size = UDim2.new(1, 0, 0, 0)
                    E.AutomaticSize = Enum.AutomaticSize.Y
                    E.Font = Enum.Font.GothamSemibold
                    E.TextSize = 12
                    E.TextColor3 = Color3.fromRGB(165, 165, 165)
                    E.TextXAlignment = Enum.TextXAlignment.Left
                    E.TextYAlignment = Enum.TextYAlignment.Center
                    E.TextWrapped = true E.Text = string.format("%d. %s\nThreshold: %s | Limit: %s (Bought: %d)", h, s.Item or "Any", B, r, K)
                    E.Parent = d
                    d.MouseEnter:Connect(function ()
                        if n ~= h then
                            d.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
                        end
                        end)
                    d.MouseLeave:Connect(function ()
                        d.BackgroundColor3 = (n == h) and Color3.fromRGB(45, 55, 45) or Color3.fromRGB(32, 32, 32)
                    end)
                    d.MouseButton1Click:Connect(function ()
                        n = h
                        pcall(function ()
                            o:SetValue(s.Item or "Any")
                            ng.AuctionThresholdInput:SetValue(s.Threshold and tostring(s.Threshold) or "")
                            ng.AuctionLimitInput:SetValue(((tonumber(s.Limit) or (127460144) % 9104296)) > 621172656 % (4741776) and tostring(s.Limit) or "")
                        end)
                        p.Text = "\240\159\146\190 Save"
                        D.Text = "\226\157\140 Cancel"
                        X.Visible = true p.Size = UDim2.new(0.33, -2, 1, 0)
                        D.Size = UDim2.new(0.33, -2, 1, 0)
                        A()
                    end)
                    d.Parent = G
                end
                C()
            end
            p.MouseButton1Click:Connect(function ()
                local h = o:GetValue()
                if type(h) == "table" then
                    h = next(h) or "Any"
                end
                if not h or h == "" then
                    h = "Any"
                end
                local s = math.max(0, math.floor(tonumber(ng.AuctionLimitInput.Value) or 0))
                local U = ng.AuctionThresholdInput.Value
                local r = ((U == nil or U == "")) and "" or tostring(math.clamp(math.floor(tonumber(U) or 90), 0, 100))
                local B = {Item = h;
                Limit = s;
                Threshold = r}
                if n then
                    S.AuctionBuyList[n] = B
                    V:Notify("<font color=\"#7EB8FF\">\240\159\146\190 Auction entry updated</font>", 3)
                else
                    table.insert(S.AuctionBuyList, B)
                    N[#S.AuctionBuyList] = 0
                    V:Notify("<font color=\"#7EB8FF\">\226\158\149 Added to auction list</font>", 3)
                end
                P()
                A()
                l()
            end)
            D.MouseButton1Click:Connect(function ()
                l()
                if n == nil then
                    A()
                end
                end)
            X.MouseButton1Click:Connect(function ()
                if n then
                    table.remove(S.AuctionBuyList, n)
                    table.remove(N, n)
                    P()
                    A()
                    l()
                    V:Notify("<font color=\"#FF8C8C\">\240\159\151\145\239\184\143 Auction entry deleted</font>", 3)
                end
                end)
            Le(W, "AuctionClearAllPanel", {{"\240\159\167\185 Clear All";
            function ()
                S.AuctionBuyList = {}
                n = nil N = {}
                P()
                A()
                l()
                V:Notify("<font color=\"#AAAAAA\">\240\159\167\185 Auction list cleared</font>", 3)
            end}})
            W:AddDivider()
            W:AddToggle("AuctionDryRunToggle", {Text = "\240\159\167\170 Dry-run (log only)", Default = S.AuctionDryRun;
            Tooltip = "Logs what it WOULD buy without spending. Verify your list before going live."})
            W:AddToggle("AuctionAutoBuyToggle", {Text = "\240\159\148\168 Auto Buy Auction";
            Default = S.AuctionAutoBuyEnabled, Tooltip = "Scans the auction and buys matching lots at your threshold. No NPC needed."})
            pcall(function ()
                Cg.AuctionDryRunToggle:OnChanged(function (h)
                    S.AuctionDryRun = h
                    P()
                end)
                Cg.AuctionAutoBuyToggle:OnChanged(function (h)
                    S.AuctionAutoBuyEnabled = h
                    P()
                end)
            end)
            A()
            task.spawn(function ()
                task.spawn(function ()
                    while true
                    do
                        if S.AuctionAutoBuyEnabled and (K and K.Auctioneer) then
                            pcall(function ()
                                local h = K.Auctioneer.RequestSnapshot:Fire()
                                if type(h) == "table" then
                                    b(h)
                                end
                                end)
                            task.wait(15)
                        else
                            task.wait(3)
                        end
                        end
                    end)
                while true
                do
                    if S.AuctionAutoBuyEnabled and (K and #Y > 0) then
                        local h = v()
                        local s = i()
                        for U, r in ipairs(Y)
                        do
                            if type(r) == "table" then
                                for U, B in ipairs(S.AuctionBuyList)
                                do
                                    if a(r, B) then
                                        s = s - ((w(r, U, B, h, s) or 0))
                                        break
                                    end
                                    end
                                end
                            end
                        end
                    task.wait(0.5)
                end
                end)
        end
        h()
    end
    local jm = eg:AddLeftGroupbox("\240\159\140\144 Server Hop")
    Ie(jm)
    jm:AddToggle("HopHuntToggle", {Text = "\240\159\140\144 Server Hop";
    Default = S.ServerHopEnabled;
    Tooltip = "Hops to a new, never-before-visited (last 50) server. Works alongside Auto Buy or on its own."})
    V.JoinServerBox = eg:AddRightGroupbox("\240\159\154\170 Join Server")
    Ie(V.JoinServerBox)
    V.JoinServerBox:AddInput("JoinServerInput", {Text = "Server Info";
    Default = "", Placeholder = "jobId", Tooltip = "Paste the jobId, then press Join to teleport into that exact server.", Finished = false})
    Le(V.JoinServerBox, "JoinServerPanel", {{"\240\159\154\170 Join Server", function ()
        local h = (((ng.JoinServerInput and ng.JoinServerInput.Value) or "")):gsub("[%s`]", "")
        if h == "" then
            V:Notify("Paste a server code first", 3)
            return
        end
        local s, U
        local B, K = h:match("^(%d+):(.+)$")
        if B then
            s, U = R, K
        else
            s, U = R, h
        end
        if not U or U == "" then
            V:Notify("Invalid server code", 3)
            return
        end
        V:Notify("\240\159\140\144 Joining server\226\128\166", 4)
        local d = false
        local v
        v = r.TeleportInitFailed:Connect(function ()
            d = true
        end)
        local i = pcall(function ()
            r:TeleportToPlaceInstance(s, U, E)
        end)
        task.delay(9, function ()
            if v then
                v:Disconnect()
            end
            if (not i) or d then
                V:Notify("\226\157\140 Join failed \226\128\148 server may be full or closed", 3)
            end
            end)
    end}})
    local Jm = Ig:AddRightGroupbox("Dev Tools")
    Ie(Jm)
    Le(Jm, "DevToolsPanel", {{"DEX";
    function ()
        V:Notify("<font color=\"#AAAAAA\">Loading DEX Explorer...</font>", 3)
        pcall(function ()
            (loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/download/stable-3.0/out.lua")))()
        end)
    end}, {"SPY", function ()
        V:Notify("<font color=\"#AAAAAA\">Loading Remote Spy...</font>", 3)
        pcall(function ()
            (loadstring(game:HttpGet("https://github.com/notpoiu/cobalt/releases/latest/download/Cobalt.luau")))()
        end)
    end}})
    V.ESPFruitsBox = Ig:AddRightGroupbox("\240\159\145\129\239\184\143 ESP Fruits")
    Ie(V.ESPFruitsBox)
    Te(V.ESPFruitsBox, "ESPFruitDropdown", "ESP Fruits", ag, {multi = true, text = "ESP Fruits";
    store = S.ESPFruitFilter, onChange = P;
    tooltip = "Show name + weight on these fruit types. Leave empty to label every fruit."})
    V.ESPFruitsBox:AddToggle("ESPUnripeToggle", {Text = "Include Unripe Fruit";
    Default = S.ESPIncludeUnripe, Tooltip = "Also label fruit that isn\'t ripe yet (shows its projected full weight)."})
    V.ESPFruitsBox:AddToggle("ESPFruitsToggle", {Text = "Enable Fruit ESP", Default = S.ESPFruitsEnabled, Tooltip = "Labels each fruit in your garden with its name and weight (kg shown in yellow)."})
    V.ESPFruitsBox:AddToggle("ESPSprinklersToggle", {Text = "Enable Sprinkler ESP", Default = S.ESPSprinklersEnabled;
    Tooltip = "Labels each of your placed sprinklers (green) with its type and remaining time."})
    local pm = Ig:AddLeftGroupbox("\240\159\155\161\239\184\143 Protection")
    Ie(pm)
    pm:AddToggle("AntiFlingToggle", {Text = "Anti-Fling", Default = S.AntiFlingEnabled, Tooltip = "Blocks other players from flinging or smacking your character."})
    pm:AddInput("AutoLockSecondsInput", {Text = "\226\143\177\239\184\143 Away Seconds", Default = tostring(S.AutoLockSeconds or ""), Numeric = true, Placeholder = "0 = always";
    Tooltip = "How long you may stay outside your garden before Auto Lock pulls you back. Empty/0 = return immediately.", Finished = false})
    pm:AddToggle("AutoLockIgnoreToggle", {Text = "\240\159\153\136 Ignore Buys & Events", Default = S.AutoLockIgnoreBuys, Tooltip = "ON: lock anyway \226\128\148 ignore Pet Buy / Event Seeds and just stay in the middle. OFF: let those tasks finish their runs before locking."})
    pm:AddToggle("AutoLockToggle", {Text = "\240\159\148\146 Auto Lock Garden";
    Default = S.AutoLockEnabled;
    Tooltip = "Teleports you back (in-game TP) and stands you in the literal middle of your garden whenever you\'re away too long \226\128\148 guards your fruit from stealers."})
    pcall(function ()
        ng.AutoLockSecondsInput:OnChanged(function ()
            S.AutoLockSeconds = ng.AutoLockSecondsInput.Value
            P()
        end)
        Cg.AutoLockIgnoreToggle:OnChanged(function (h)
            S.AutoLockIgnoreBuys = h
            P()
        end)
        Cg.AutoLockToggle:OnChanged(function (h)
            S.AutoLockEnabled = h
            P()
        end)
    end)
    do
        task.spawn(function ()
            local h = nil
            while true
            do
                if S.AutoLockEnabled and V.GameLoaded() then
                    local s = (not S.AutoLockIgnoreBuys) and ((V.TameActive == true or V.EventActive == true))
                    local U = workspace:FindFirstChild("Gardens") and workspace.Gardens:FindFirstChild("Plot"..tostring(E:GetAttribute("PlotId")))
                    local r = ie()
                    if s then
                        h = nil
                    elseif U and r then
                        local s, B
                        local K = U:FindFirstChild("Visual")
                        local d = K and K:FindFirstChild("GardenZonePart")
                        if d and d:IsA("BasePart") then
                            local h = d.CFrame:PointToObjectSpace(r.Position)
                            s = math.abs(h.X) <= d.Size.X / (2) + (3) and math.abs(h.Z) <= d.Size.Z / (2) + (3)
                            B = d.Position
                        else
                            local h, K, d, v = math.huge, -math.huge, math.huge, -math.huge
                            local i = false
                            for s, r in ipairs(u:GetTagged("PlantArea"))
                            do
                                if r:IsA("BasePart") and (r:IsDescendantOf(U) and r.Transparency < 1) then
                                    i = true
                                    local s, U = r.Position, r.Size
                                    h = math.min(h, s.X - U.X / 2)
                                    K = math.max(K, s.X + U.X / 2)
                                    d = math.min(d, s.Z - U.Z / 2)
                                    v = math.max(v, s.Z + U.Z / 2)
                                end
                                end
                            if i then
                                local U = r.Position
                                s = U.X >= h - (25) and (U.X <= K + (25) and (U.Z >= d - (25) and U.Z <= v + 25))
                                B = Vector3.new(((h + K)) / 2, U.Y, ((d + v)) / 2)
                            end
                            end
                        if s == true then
                            h = nil
                        elseif s == false then
                            h = h or os.clock()
                            local s = tonumber(S.AutoLockSeconds) or -178380
                            if os.clock() - h >= s then
                                h = nil V:Notify("\240\159\148\146 Auto Lock \226\128\148 returning to your garden\226\128\166", 4)
                                if fg and fg.TeleportButton then
                                    pcall(function ()
                                        fg.TeleportButton.Request:Fire("Garden")
                                    end)
                                    task.wait(1.2)
                                end
                                local s = ie()
                                local U = 85260744 % (2368354)
                                while s and (B and U < 12)
                                do
                                    local h = Vector3.new(B.X - s.Position.X, 0, B.Z - s.Position.Z)
                                    if h.Magnitude <= 3 then
                                        break
                                    end
                                    local r = math.min(20, h.Magnitude)
                                    pcall(function ()
                                        s.CFrame = CFrame.new(s.Position + h.Unit * r)
                                    end)
                                    U = U + (1)
                                    task.wait(0.12)
                                    s = ie()
                                end
                                end
                            end
                        end
                    else
                    h = nil
                end
                task.wait(1)
            end
            end)
    end
    local Dm = Ig:AddLeftGroupbox("General")
    Ie(Dm)
    Dm:AddLabel("ConfigInfoLabel", {Text = "\226\154\153\239\184\143 Settings save automatically.", DoesWrap = true})
    Dm:AddToggle("UniversalConfigToggle", {Text = "\240\159\140\141 Use Universal Config";
    Default = D;
    Tooltip = "Saves and loads settings across all your accounts. Re-execute script to apply changes."})
    Cg.UniversalConfigToggle:OnChanged(function (h)
        if h ~= D then
            D = h
            pcall(function ()
                if writefile then
                    W()
                    writefile(p, s:JSONEncode({UseUniversalConfig = D}))
                end
                end)
            V:Notify("<font color=\"#FFD700\">\226\154\153\239\184\143 Config mode changed!</font> Re-execute script to apply.", 6)
        end
        end)
    local Xm = Ig:AddLeftGroupbox("Webhook")
    Ie(Xm)
    Xm:AddInput("TameWebhookURLInput", {Text = "Discord Webhook URL";
    Default = S.TameWebhookURL;
    Placeholder = "https://discord.com/api/webhooks/..."})
    Xm:AddToggle("TameWebhookToggle", {Text = "Enable Tame Webhook";
    Default = S.TameWebhookEnabled;
    Tooltip = "Sends a Discord embed every time a pet is successfully tamed."})
    Xm:AddDivider()
    Xm:AddInput("MailWebhookURLInput", {Text = "Mail Webhook URL";
    Default = S.MailWebhookURL, Placeholder = "https://discord.com/api/webhooks/..."})
    Xm:AddToggle("MailWebhookToggle", {Text = "Enable Mail Webhook";
    Default = S.MailWebhookEnabled;
    Tooltip = "Posts a Discord receipt every time you send mail from the Mail tab."})
    Xm:AddDivider()
    Le(Xm, "WebhookTestPanel", {{"Test Webhook", function ()
        local h = S.TameWebhookURL
        if h == "" or not h:find("discord.com") then
            V:Notify("<font color=\"#FF6B6B\">\226\154\160\239\184\143 Enter a valid Discord webhook URL.</font>", 3)
            return
        end
        if not S.TameWebhookEnabled then
            V:Notify("<font color=\"#FFA500\">\226\154\160\239\184\143 Tame Webhook is disabled</font> \226\128\148 enable the toggle first.", 3)
            return
        end
        local U = Ge()
        if not U then
            V:Notify("<font color=\"#FF6B6B\">\226\154\160\239\184\143 Executor doesn\'t support HTTP requests.</font>", 3)
            return
        end
        local r = s:JSONEncode({content = "\240\159\144\190 **TOMI HUB Connection Test**", embeds = {{title = "\226\156\133 Tame Webhook Linked Successfully!", description = "TOMI HUB is now ready to send pet tame logs to this channel.";
        color = 65280, footer = {text = "TOMI HUB Wild Pet"}}}})
        local B, K = pcall(function ()
            U({Url = h;
            Method = "POST";
            Headers = {["Content-Type"] = "application/json"};
            Body = r})
        end)
        V:Notify(B and "<font color=\"#49E685\">\226\156\133 Check Discord!</font>" or ("<font color=\"#FF6B6B\">\226\156\151 Failed:</font> "..tostring(K)), 3)
    end}})
    local Wm = Ig:AddRightGroupbox("Performance")
    Ie(Wm)
    Wm:AddToggle("GardenOptimizerToggle", {Text = "Cull World Models";
    Default = S.GardenOptimizerEnabled;
    Tooltip = "Hides world models so they don\'t render \226\128\148 big FPS win."})
    Te(Wm, "CullModeDropdown", "Cull Mode", {me, ce}, {multi = false;
    get = function ()
        return S.CullMode
    end, set = function (h)
        S.CullMode = h
        P()
        if S.GardenOptimizerEnabled then
            rg()
        end
        end;
    tooltip = "All: cull everything. Keep My Garden: leave your plot usable."})
    Wm:AddToggle("ZeroTextureToggle", {Text = "Zero Texture";
    Default = S.ZeroTextureEnabled;
    Tooltip = "Strips textures, particles, post-FX and clouds for max GPU/memory savings."})
    Wm:AddToggle("BlackScreenToggle", {Text = "Black Screen", Default = S.BlackScreenEnabled, Tooltip = "Parks the camera away so nothing renders \226\128\148 big GPU saver. UI stays usable."})
    Wm:AddToggle("HidePlantsToggle", {Text = "Hide Plants";
    Default = S.HidePlantsEnabled;
    Tooltip = "Makes your plants invisible for FPS. Still harvestable; toggle off to restore."})
    Wm:AddToggle("HidePetsToggle", {Text = "Hide Pets";
    Default = S.HidePetsEnabled, Tooltip = "Hides all players\' pets for FPS. Cosmetic only; toggle off to restore."})
    Wm:AddToggle("SellStripToggle", {Text = "Strip Carried Items";
    Default = S.SellStripEnabled, Tooltip = "Clears other players\' carried items and backpacks \226\128\148 FPS + memory win."});
    ((function ()
        local h = Color3.fromRGB(32, 32, 32)
        local s = V.Scheme.OutlineColor
        local U = 4
        local function r(h)
            if not h:IsA("Frame") then
                return false
            end
            local s, U, r = 0, false, false
            for h, B in ipairs(h:GetDescendants())
            do
                if B:IsA("TextBox") then
                    U = true
                end
                if B:IsA("UIListLayout") then
                    r = true
                end
                if B:IsA("TextButton") and B.BackgroundTransparency == -493218 + 16952892 % (5486558) then
                    s = s + (1)
                end
                end
            if U then
                return false
            end
            if s >= 2 then
                return true
            end
            if s == 1 and r then
                return true
            end
            return false
        end
        local function B(h)
            if not h:IsA("Frame") then
                return false
            end
            for h, s in ipairs(h:GetDescendants())
            do
                if s:IsA("TextButton") or s:IsA("TextBox") then
                    return false
                end
                if s:IsA("TextLabel") and s.Text ~= "" then
                    return false
                end
                if s:IsA("UIListLayout") then
                    return false
                end
                if s:IsA("ImageLabel") or s:IsA("ImageButton") then
                    return false
                end
                end
            return true
        end
        local function K(h)
            if not h:IsA("Frame") then
                return false
            end
            for h, s in ipairs(h:GetDescendants())
            do
                if s:IsA("TextButton") and s.AutomaticSize == Enum.AutomaticSize.Y then
                    return true
                end
                end
            return false
        end
        local function d(d)
            local v = d and d.Container
            if not v then
                return
            end
            local i = v:FindFirstChildOfClass("UIListLayout")
            if i then
                i.Padding = UDim.new(0, U)
            end
            for U, d in ipairs(v:GetChildren())
            do
                if not d:IsA("GuiObject") then
                    elseif B(d) then
                    d.Visible = false d.Size = UDim2.new(d.Size.X.Scale, d.Size.X.Offset, 0, 0)
                elseif K(d) then
                    else
                    local U = r(d)
                    d.BackgroundColor3 = h
                    d.BackgroundTransparency = (-138973) + (138973)
                    if d:IsA("TextButton") then
                        d.AutoButtonColor = false
                    end
                    if not d:FindFirstChildOfClass("UICorner") then
                        local h = Instance.new("UICorner")
                        h.CornerRadius = UDim.new(0, 6)
                        h.Parent = d
                    end
                    if not d:FindFirstChildOfClass("UIStroke") then
                        local h = Instance.new("UIStroke")
                        h.Color = s
                        h.Thickness = 1
                        h.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                        h.Parent = d
                    end
                    local B = d:FindFirstChildOfClass("UIPadding") or Instance.new("UIPadding")
                    B.PaddingLeft = UDim.new(0, 10)
                    B.PaddingRight = UDim.new(0, 10)
                    B.Parent = d
                    for h, s in ipairs(d:GetDescendants())
                    do
                        if s:IsA("TextLabel") and not s.TextWrapped then
                            s.TextTruncate = Enum.TextTruncate.AtEnd
                        end
                        end
                    if d:IsA("TextButton") then
                        if d.Size.Y.Offset < 30 then
                            d.Size = UDim2.new(d.Size.X.Scale, d.Size.X.Offset, 0, 30)
                        end
                        for h, s in ipairs(d:GetChildren())
                        do
                            if s:IsA("TextLabel") then
                                s.TextYAlignment = Enum.TextYAlignment.Center
                            elseif s:IsA("Frame") then
                                s.AnchorPoint = Vector2.new(s.AnchorPoint.X, 0.5)
                                s.Position = UDim2.new(s.Position.X.Scale, s.Position.X.Offset, 0.5, 0)
                            end
                            end
                        elseif d:IsA("Frame") then
                        if U then
                            B.PaddingLeft = UDim.new(0, 4)
                            B.PaddingRight = UDim.new(0, 4)
                            B.PaddingTop = UDim.new(0, 3)
                            B.PaddingBottom = UDim.new(0, 3)
                            if d.AutomaticSize ~= Enum.AutomaticSize.Y and d.AutomaticSize ~= Enum.AutomaticSize.XY then
                                d.Size = UDim2.new(d.Size.X.Scale, d.Size.X.Offset, 0, d.Size.Y.Offset + 6)
                            end
                            for h, U in ipairs(d:GetDescendants())
                            do
                                if U:IsA("TextButton") and U.BackgroundTransparency == 0 then
                                    local h = U:FindFirstChildOfClass("UIStroke") or Instance.new("UIStroke")
                                    h.Color = s
                                    h.Thickness = 1
                                    h.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                                    h.Parent = U
                                end
                                end
                            else
                            B.PaddingLeft = UDim.new(0, 4)
                            B.PaddingRight = UDim.new(0, 4)
                            B.PaddingTop = UDim.new(0, 3)
                            B.PaddingBottom = UDim.new(0, 3)
                            if d.AutomaticSize ~= Enum.AutomaticSize.Y and d.AutomaticSize ~= Enum.AutomaticSize.XY then
                                d.Size = UDim2.new(d.Size.X.Scale, d.Size.X.Offset, 0, d.Size.Y.Offset + 6)
                            end
                            for U, r in ipairs(d:GetDescendants())
                            do
                                local B
                                if ((r:IsA("TextButton") or r:IsA("TextBox"))) and r.BackgroundTransparency == 0 then
                                    B = r
                                elseif r:IsA("TextBox") and (r.BackgroundTransparency == 1 and (r.Parent and (r.Parent:IsA("Frame") and (r.Parent ~= d and r.Parent.BackgroundTransparency == 0)))) then
                                    B = r.Parent
                                end
                                if B then
                                    B.BackgroundColor3 = h
                                    if not B:FindFirstChildOfClass("UIStroke") then
                                        local h = Instance.new("UIStroke")
                                        h.Color = s
                                        h.Thickness = 1
                                        h.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                                        h.Parent = B
                                    end
                                    end
                                end
                            end
                        end
                    end
                end
            if i then
                (i:GetPropertyChangedSignal("AbsoluteContentSize")):Connect(function ()
                    if d.Resize then
                        pcall(function ()
                            d:Resize()
                        end)
                    end
                    end)
            end
            task.defer(function ()
                for h = 1, 3, 1
                do
                    task.wait()
                end
                if d.Resize then
                    pcall(function ()
                        d:Resize()
                    end)
                end
                end)
        end;
        (getgenv()).__VHCardifyBox = d
        for h, s in ipairs({Wm, Hg;
        mg;
        Sm;
        Rm, bm;
        Mm;
        wm;
        Fm, gm;
        jm, V.JoinServerBox;
        V.TrowelBox, V.SprinklerBox;
        V.WateringBox;
        V.WeatherBox;
        pm, Dm;
        Xm, V.ESPFruitsBox, V.AuctionFormBox;
        V.UnliBox;
        V.UnliWaterBox})
        do
            pcall(d, s)
        end
        for h, s in ipairs((V.VH and V.VH.boxes) or {})
        do
            pcall(d, s.gb)
        end
        end))()
    local Gm = V:AddDraggableButton("TOMI HUB", function ()
        V:Toggle()
    end)
    Gm.Button.Size = UDim2.fromOffset(120, 36)
    Gm.Button.TextSize = 17
    do
        local h = V:GetIcon("paw-print")
        if h then
            local s = Instance.new("UIPadding")
            s.PaddingLeft = UDim.new(0, 35)
            s.PaddingRight = UDim.new(0, 6)
            s.Parent = Gm.Button
            local U = Instance.new("ImageLabel")
            U.Name = "pawicon"
            U.AnchorPoint = Vector2.new(0, 0.5)
            U.Size = UDim2.fromOffset(22, 22)
            U.Position = UDim2.new(0, -24, 0.5, 0)
            U.BackgroundTransparency = 1
            U.Image = h.Url
            U.ImageRectOffset = h.ImageRectOffset
            U.ImageRectSize = h.ImageRectSize
            U.ImageColor3 = Color3.fromRGB(255, 255, 255)
            U.ZIndex = 108060298 % (643216)
            U.Parent = Gm.Button
        end
        end
    Cg.AutoReconnectToggle:OnChanged(function (h)
        S.AutoReconnect = h
        P()
        if h then
            g()
            V.Labels.AutoReconnectStatusLabel:SetText("\240\159\159\162 Reconnect: Listening...")
        else
            j()
            V.Labels.AutoReconnectStatusLabel:SetText("\240\159\148\180 Reconnect: Off")
        end
        end)
    Cg.AutoBuyToggle:OnChanged(function (h)
        S.AutoBuyEnabled = h
        P()
        if h then
            ee()
        else
            V:Notify("<font color=\"#AAAAAA\">\226\143\184\239\184\143 Auto Buy stopped</font>", 3)
        end
        end)
    Cg.GuardPetsToggle:OnChanged(function (h)
        S.GuardPetsEnabled = h
        P()
        if not h then
            (getgenv()).__voidGuardPet = nil
        end
        V:Notify(h and "\240\159\155\161\239\184\143 Pet Guard ON \226\128\148 will shovel-smack thieves near your walking pets" or "<font color=\"#AAAAAA\">\240\159\155\161\239\184\143 Pet Guard off</font>", h and 27016 + (-27012) or (3789874891) % 16549672)
    end)
    Cg.HopHuntToggle:OnChanged(function (h)
        S.ServerHopEnabled = h
        P()
        if h then
            ee()
        end
        end)
    Cg.HarvestToggle:OnChanged(function (h)
        S.HarvestEnabled = h
        P()
        V:Notify(h and "\240\159\140\190 Auto Harvest ON" or "\240\159\140\190 Auto Harvest OFF", h and 4 or 3)
    end)
    Cg.PrioHarvestToggle:OnChanged(function (h)
        S.PrioHarvest = h
        P()
    end)
    ng.HarvestWeightKgInput:OnChanged(function ()
        S.HarvestWeightKg = tonumber(ng.HarvestWeightKgInput.Value) or 0
        P()
    end)
    Cg.ESPFruitsToggle:OnChanged(function (h)
        S.ESPFruitsEnabled = h
        P()
        V:Notify(h and "\240\159\145\129\239\184\143 Fruit ESP ON" or "\240\159\145\129\239\184\143 Fruit ESP OFF", h and 4 or 3)
    end)
    Cg.ESPSprinklersToggle:OnChanged(function (h)
        S.ESPSprinklersEnabled = h
        P()
        V:Notify(h and "\240\159\146\166 Sprinkler ESP ON" or "\240\159\146\166 Sprinkler ESP OFF", h and 4 or -346645)
    end)
    Cg.ESPUnripeToggle:OnChanged(function (h)
        S.ESPIncludeUnripe = h
        P()
    end)
    Cg.GardenSellToggle:OnChanged(function (h)
        S.GardenSellEnabled = h
        P()
        V:Notify(h and "\240\159\146\176 Auto Sell ON" or "\240\159\146\176 Auto Sell OFF", h and 4 or (-807199) - -807202)
    end)
    Cg.SellWhenFullToggle:OnChanged(function (h)
        S.SellWhenFull = h
        P()
        V:Notify(h and "\240\159\147\166 Sell Only When Full ON" or "\240\159\147\166 Sell Only When Full OFF", h and (1470360964) % 16337344 or 3)
    end)
    Cg.AutoDailyDealToggle:OnChanged(function (h)
        S.AutoDailyDeal = h
        P()
        V:Notify(h and "\240\159\164\157 Use Daily Deal ON" or "\240\159\164\157 Use Daily Deal OFF", h and 4 or (-604764) + 604767)
    end)
    Cg.PlantToggle:OnChanged(function (h)
        S.PlantEnabled = h
        if h then
            Dg = 0
        end
        P()
        V:Notify(h and "\240\159\140\177 Seed Placer ON" or "\240\159\140\177 Seed Placer OFF", h and -1584256 or -2094305)
    end)
    Cg.PlantGridToggle:OnChanged(function (h)
        S.PlantGridMode = h
        P()
    end)
    ng.PlantTargetInput:OnChanged(function ()
        S.PlantTarget = tonumber(ng.PlantTargetInput.Value) or -752583 - (-752583)
        P()
    end)
    Cg.AntiFlingToggle:OnChanged(function (h)
        S.AntiFlingEnabled = h
        P()
        V:Notify(h and "\240\159\170\130 Anti-Fling ON" or "<font color=\"#AAAAAA\">\240\159\170\130 Anti-Fling off</font>", h and 42584 + (-42580) or 3)
    end)
    Cg.EventSeedsToggle:OnChanged(function (h)
        S.EventSeedsEnabled = h
        P()
        V:Notify(h and "\240\159\142\129 Event Seeds ON" or "\240\159\142\129 Event Seeds OFF", h and (1229398174) % 7983105 or 3)
    end)
    Cg.BuySeedsToggle:OnChanged(function (h)
        S.BuySeedsEnabled = h
        P()
        V:Notify(h and "\240\159\140\177 Auto Buy Seeds ON" or "\240\159\140\177 Auto Buy Seeds OFF", h and 2720848454 % (14320255) or -536089)
    end)
    Cg.BuyGearsToggle:OnChanged(function (h)
        S.BuyGearsEnabled = h
        P()
        V:Notify(h and "\226\154\153\239\184\143 Auto Buy Gears ON" or "\226\154\153\239\184\143 Auto Buy Gears OFF", h and (-1038412) - (-1038416) or (-866204) - -866207)
    end)
    Cg.BuyCratesToggle:OnChanged(function (h)
        S.BuyCratesEnabled = h
        P()
        V:Notify(h and "\240\159\147\166 Auto Buy Crates ON" or "\240\159\147\166 Auto Buy Crates OFF", h and 4 or 3)
    end)
    ng.TameWebhookURLInput:OnChanged(function ()
        S.TameWebhookURL = ng.TameWebhookURLInput.Value
        P()
    end)
    Cg.TameWebhookToggle:OnChanged(function (h)
        S.TameWebhookEnabled = h
        P()
    end)
    ng.MailWebhookURLInput:OnChanged(function ()
        S.MailWebhookURL = ng.MailWebhookURLInput.Value
        P()
    end)
    Cg.MailWebhookToggle:OnChanged(function (h)
        S.MailWebhookEnabled = h
        P()
    end)
    Cg.GardenOptimizerToggle:OnChanged(function (h)
        S.GardenOptimizerEnabled = h
        P()
        if h then
            rg()
        else
            sg()
        end
        end)
    Cg.ZeroTextureToggle:OnChanged(function (h)
        S.ZeroTextureEnabled = h
        P()
        if h then
            Bg()
        else
            Kg()
        end
        end)
    Cg.BlackScreenToggle:OnChanged(function (h)
        S.BlackScreenEnabled = h
        P()
        if h then
            ig()
        else
            ug()
        end
        end)
    Cg.HidePlantsToggle:OnChanged(function (h)
        S.HidePlantsEnabled = h
        P()
        Eg(h)
    end)
    Cg.HidePetsToggle:OnChanged(function (h)
        S.HidePetsEnabled = h
        P()
        Yg(h)
    end)
    Cg.SellStripToggle:OnChanged(function (h)
        S.SellStripEnabled = h
        P()
        Vg(h)
        V:Notify(h and "\240\159\167\185 Strip Carried ON" or "\240\159\167\185 Strip Carried OFF", h and 4 or (-281986) - -281989)
    end)
    task.spawn(function ()
        task.wait(2)
        if S.AutoReconnect then
            pcall(function ()
                Cg.AutoReconnectToggle:SetValue(true)
            end)
        end
        if S.TameWebhookURL and S.TameWebhookURL ~= "" then
            pcall(function ()
                ng.TameWebhookURLInput:SetValue(S.TameWebhookURL)
            end)
        end
        if S.TameWebhookEnabled then
            pcall(function ()
                Cg.TameWebhookToggle:SetValue(true)
            end)
        end
        if S.MovementMethod and S.MovementMethod ~= "" then
            pcall(function ()
                ng.MovementMethodDropdown:SetValue(S.MovementMethod)
            end)
        end
        if S.ServerHopEnabled then
            pcall(function ()
                Cg.HopHuntToggle:SetValue(true)
            end)
        end
        if S.AutoBuyEnabled then
            pcall(function ()
                Cg.AutoBuyToggle:SetValue(true)
            end)
        end
        if S.GardenOptimizerEnabled then
            pcall(function ()
                Cg.GardenOptimizerToggle:SetValue(true)
            end)
        end
        if S.ZeroTextureEnabled then
            pcall(function ()
                Cg.ZeroTextureToggle:SetValue(true)
            end)
        end
        if S.BlackScreenEnabled then
            pcall(function ()
                Cg.BlackScreenToggle:SetValue(true)
            end)
        end
        if S.HidePlantsEnabled then
            pcall(function ()
                Cg.HidePlantsToggle:SetValue(true)
            end)
        end
        if S.HidePetsEnabled then
            pcall(function ()
                Cg.HidePetsToggle:SetValue(true)
            end)
        end
        if S.SellStripEnabled then
            pcall(function ()
                Cg.SellStripToggle:SetValue(true)
            end)
        end
        pcall(Ee)
        pcall(Qm)
        pcall(om)
    end)
    task.defer(function ()
        task.wait(1)
        local h = V.ScreenGui or V.Root or V.Main
        if not h then
            pcall(function ()
                for s, U in pairs(E.PlayerGui:GetChildren())
                do
                    if U:IsA("ScreenGui") and ((U.Name:find("Obsidian") or U.Name:find("TOMI HUB"))) then
                        h = U
                        break
                    end
                    end
                end)
        end
        if h then
            for h, s in pairs(h:GetDescendants())
            do
                if s:IsA("TextBox") then
                    s.TextScaled = false s.TextSize = 14
                    s.ClearTextOnFocus = false s.TextTruncate = Enum.TextTruncate.AtEnd
                    if s.Parent then
                        s.Parent.ClipsDescendants = true
                    end
                    end
                end
            h.DescendantAdded:Connect(function (h)
                if h:IsA("TextBox") then
                    task.defer(function ()
                        h.TextScaled = false h.TextSize = 14
                        h.ClearTextOnFocus = false h.TextTruncate = Enum.TextTruncate.AtEnd
                        if h.Parent then
                            h.Parent.ClipsDescendants = true
                        end
                        end)
                end
                end)
        end
        end)
    do
        local h = {ctls = {};
        pickerLabels = {};
        pickerMap = {}, pickerDisplay = {}}
        local U = fg and fg.Mailbox
        local r = game:GetService("Players")
        local B = {"Sprinklers", "WateringCans";
        "Mushrooms";
        "Gnomes", "Trowels";
        "Crates";
        "Raccoons", "SeedPacks";
        "EmptyPots"}
        local K = {}
        local d
        if type(S.MailRecipients) ~= "table" then
            S.MailRecipients = {}
        end
        if type(S.MailCart) ~= "table" then
            S.MailCart = {}
        end
        S.MailRecipient = type(S.MailRecipient) == "string" and S.MailRecipient or ""
        S.MailAutoClaimEnabled = S.MailAutoClaimEnabled == true pcall(function ()
            h.PSC = require((game:GetService("ReplicatedStorage")).ClientModules.PlayerStateClient)
        end)
        function h.inv()
            if not h.PSC then
                return nil
            end
            local s = h.PSC:WaitForLocalReplica(5)
            return s and (s.Data and s.Data.Inventory)
        end
        function h.petNames(h)
            local s, U = {}, h and h.Pets
            if type(U) == "table" then
                for h, U in pairs(U)
                do
                    if type(U) == "table" and (U.Id and (U.Equipped ~= true and U.Name)) then
                        s[U.Name] = true
                    end
                    end
                end
            return s
        end
        function h.countNames(h, s)
            local U, r = {}, h and h[s]
            if type(r) == "table" then
                for h, s in pairs(r)
                do
                    if type(s) == "number" and s > 0 then
                        U[h] = true
                    end
                    end
                end
            return U
        end
        function h.gearNames(h)
            local s = {}
            for U, r in ipairs(B)
            do
                local B = h and h[r]
                if type(B) == "table" then
                    for h, U in pairs(B)
                    do
                        if type(U) == "number" and U > 0 then
                            s[h] = true
                        end
                        end
                    end
                end
            return s
        end
        pcall(function ()
            h.MIC = require(game.Players.LocalPlayer.PlayerScripts.Controllers.MailboxController.MailboxItemCatalog)
        end)
        h.seedRarity, h.seedSingle = {}, {}
        pcall(function ()
            for s, U in require((game:GetService("ReplicatedStorage")).SharedModules.SeedData)
            do
                if U.SeedName then
                    h.seedRarity[U.SeedName] = U.Rarity
                    h.seedSingle[U.SeedName] = U.IsSingleHarvest == true
                end
                end
            end)
        h.rarityColor = {Common = "#AAAAAA", Uncommon = "#28C828", Rare = "#3C82F0";
        Epic = "#AA50E6";
        Legendary = "#F5C83C";
        Mythic = "#DC3232", Super = "#FF0000"}
        h.dimColor = "#9AA0AA"
        function h.rarityOf(s, U)
            if s == "Pets" and (h.MIC and h.MIC.ResolveRarity) then
                local s, r = pcall(h.MIC.ResolveRarity, "Pets", U)
                if s and (type(r) == "string" and r ~= "") then
                    return r
                end
                elseif s == "Seeds" then
                return h.seedRarity[U]
            end
            return nil
        end
        function h.richLabel(s, U)
            local r = {U}
            local B = h.rarityOf(s, U)
            if B then
                r[#r + 1] = string.format("<font color=\"%s\">%s</font>", h.rarityColor[B] or h.dimColor, B)
            end
            if s == "Seeds" and h.seedSingle[U] ~= nil then
                r[#r + 1] = string.format("<font color=\"%s\">%s</font>", h.dimColor, h.seedSingle[U] and "Single" or "Multi")
            end
            r[#r + 1] = string.format("<font color=\"%s\">(%dx)</font>", h.dimColor, h.available(s, U))
            return table.concat(r, "  ")
        end
        function h.catItemNames(s)
            local U, r = h.inv(), {}
            if s == "Pets" then
                for h in pairs(h.petNames(U))
                do
                    r[h] = "Pets"
                end
                elseif s == "Seeds" then
                for h in pairs(h.countNames(U, "Seeds"))
                do
                    r[h] = "Seeds"
                end
                elseif s == "Props" then
                for h in pairs(h.countNames(U, "Props"))
                do
                    r[h] = "Props"
                end
                else
                for s, B in ipairs(B)
                do
                    for h in pairs(h.countNames(U, B))
                    do
                        r[h] = B
                    end
                    end
                end
            return r
        end
        h.selectedCat = (type(h.selectedCat) == "string") and h.selectedCat or "Seeds"
        function h.buildPicker()
            table.clear(h.pickerLabels)
            table.clear(h.pickerMap)
            table.clear(h.pickerDisplay)
            for s, U in pairs(h.catItemNames(h.selectedCat))
            do
                h.pickerMap[s] = {Cat = U, Name = s}
                h.pickerDisplay[s] = h.richLabel(U, s)
                h.pickerLabels[#h.pickerLabels + 1] = s
            end
            table.sort(h.pickerLabels)
        end
        function h.checkUser()
            local h = S.MailRecipient
            local function s(h)
                pcall(function ()
                    V.Labels.MailCheckStatus:SetText(h)
                end)
            end
            if type(h) ~= "string" or h == "" then
                s("\226\154\160\239\184\143 No recipient set \226\128\148 type one and press Enter.")
                return
            end
            for U, r in ipairs(r:GetPlayers())
            do
                if r.Name:lower() == h:lower() then
                    s("<font color=\"#54D15A\">\226\156\133 "..(r.Name.." \226\128\148 in this server.</font>"))
                    return
                end
                end
            if not U then
                s("\226\154\160\239\184\143 Mail unavailable.")
                return
            end
            local B, K, d = pcall(function ()
                return U.LookupPlayer:Fire(h)
            end)
            if B and (type(K) == "number" and K > 0) then
                s(string.format("<font color=\"#54D15A\">\226\156\133 Found: %s  (id %d)</font>", (type(d) == "string" and (d ~= "" and d)) or h, K))
            else
                s("<font color=\"#F2674C\">\226\157\140 No player found with that username.</font>")
            end
            end
        function h.forgetRecipient()
            local s = S.MailRecipient
            if type(s) ~= "string" or s == "" then
                return
            end
            for h = #S.MailRecipients, 1, -1
            do
                if (tostring(S.MailRecipients[h])):lower() == s:lower() then
                    table.remove(S.MailRecipients, h)
                end
                end
            S.MailRecipient = ""
            P()
            h.rebuildRecipItems()
            pcall(function ()
                d.Overlay.SetItems(K)
            end)
            pcall(function ()
                d:SetValue("")
            end)
            pcall(function ()
                V.Labels.MailCheckStatus:SetText("Recipient cleared.")
            end)
            V:Notify("\240\159\151\145\239\184\143 Removed recipient: "..s, 3)
        end
        function h.available(s, U)
            local r = h.inv()
            if s == "Pets" then
                local h, s = 0, r and r.Pets
                if type(s) == "table" then
                    for s, r in pairs(s)
                    do
                        if type(r) == "table" and (r.Id and (r.Equipped ~= true and r.Name == U)) then
                            h = h + (1)
                        end
                        end
                    end
                return h
            end
            local B = r and r[s]
            return ((type(B) == "table" and type(B[U]) == "number")) and B[U] or (-433129) - (-433129)
        end
        function h.expandCart()
            local s = h.inv()
            local U = {}
            if not s or type(S.MailCart) ~= "table" then
                return U
            end
            for h, r in ipairs(S.MailCart)
            do
                local B, K = r.Cat, r.Name
                local d = math.max(1, math.floor(tonumber(r.Amount) or (629342) - 629341))
                if B == "Pets" then
                    local h, r = 0, s.Pets
                    if type(r) == "table" then
                        for s, r in pairs(r)
                        do
                            if h >= d then
                                break
                            end
                            if type(r) == "table" and (r.Id and (r.Equipped ~= true and r.Name == K)) then
                                U[#U + 1] = {Category = "Pets", ItemKey = r.Id;
                                Count = 1}
                                h = h + (1)
                            end
                            end
                        end
                    else
                    local h = s[B]
                    local r = ((type(h) == "table" and type(h[K]) == "number")) and h[K] or (-586265) + 586265
                    local v = math.min(d, r)
                    if v > 0 then
                        U[#U + 1] = {Category = B;
                        ItemKey = K;
                        Count = v}
                    end
                    end
                end
            return U
        end
        function h.resolveRecipient()
            local h = S.MailRecipient
            if type(h) ~= "string" or h == "" then
                return nil, "no recipient set"
            end
            if h:lower() == E.Name:lower() then
                return nil, "can\'t mail yourself"
            end
            for s, U in ipairs(r:GetPlayers())
            do
                if U ~= E and ((U.Name:lower() == h:lower() or (U.DisplayName and U.DisplayName:lower() == h:lower()))) then
                    return U.UserId, U.Name
                end
                end
            if not U then
                return nil, "mail unavailable"
            end
            local s, B, K = pcall(function ()
                return U.LookupPlayer:Fire(h)
            end)
            if s and (type(B) == "number" and B > 0) then
                return B, (type(K) == "string" and (K ~= "" and K) or h)
            end
            return nil, "player not found"
        end
        h.sendBusy = false
        function h.sendOnce(s)
            if h.sendBusy then
                return
            end
            h.sendBusy = true pcall(function ()
                local r, B = h.resolveRecipient()
                if not r then
                    if s then
                        V:Notify("\240\159\147\173 Mail: "..tostring(B), 4)
                    end
                    return
                end
                if type(S.MailCart) == "table" then
                    local U = {}
                    for s, r in ipairs(S.MailCart)
                    do
                        local B = h.available(r.Cat, r.Name)
                        local K = math.max(1, math.floor(tonumber(r.Amount) or 1))
                        if B < K then
                            U[#U + 1] = string.format("%s (have %d/%d)", r.Name, B, K)
                        end
                        end
                    if #U > 0 then
                        if s then
                            V:Notify("\226\157\140 Send cancelled \226\128\148 not enough: "..table.concat(U, ", "), 6)
                        end
                        return
                    end
                    end
                local K = h.expandCart()
                if #K == 0 then
                    if s then
                        V:Notify("\240\159\147\173 Mail: list is empty", 4)
                    end
                    return
                end
                local d = 0
                for h = 1, #K, -874327 + (874347)
                do
                    local s = {}
                    for h = h, math.min(h + 19, #K), 1
                    do
                        s[#s + 1] = K[h]
                    end
                    local B, v = pcall(function ()
                        return U.SendBatch:Fire(r, s, "")
                    end)
                    if B and v then
                        d = d + #s
                    end
                    task.wait(1.6)
                end
                if s then
                    V:Notify(string.format("\240\159\147\164 Mail: sent %d/%d items to %s", d, #K, B), 4)
                end
                if d > 0 then
                    pcall(h.sendMailReceipt, B, S.MailCart, d)
                end
                end)
            h.sendBusy = false
        end
        function h.refreshCounts()
            h.buildPicker()
            pcall(function ()
                h.ctls.picker.Overlay.SetItems(h.pickerLabels, h.pickerDisplay)
            end)
            h.refreshCart()
            V:Notify("\240\159\148\132 Item counts refreshed", 3)
        end
        function h.sendMailReceipt(h, U, r)
            if not S.MailWebhookEnabled or type(S.MailWebhookURL) ~= "string" or S.MailWebhookURL == "" then
                return
            end
            local K = Ge()
            if not K then
                return
            end
            local d = {}
            for h, s in ipairs(B)
            do
                d[s] = true
            end
            local v, i = {}, 0
            if type(U) == "table" then
                for h, s in ipairs(U)
                do
                    local U = math.max(1, math.floor(tonumber(s.Amount) or (152063) - 152062))
                    i = i + U
                    local r = (s.Cat == "Pets" and "Pets") or (s.Cat == "Seeds" and "Seeds") or (s.Cat == "Props" and "Props") or (d[s.Cat] and "Gears") or "Other"
                    v[r] = v[r] or {}
                    table.insert(v[r], string.format("%-22s x%d", tostring(s.Name), U))
                end
                end
            local u = {Pets = "\240\159\144\190", Seeds = "\240\159\140\177", Gears = "\226\154\153\239\184\143";
            Props = "\240\159\147\166", Other = "\226\128\162"}
            local Y = {}
            for h, s in ipairs({"Pets";
            "Seeds";
            "Gears";
            "Props";
            "Other"})
            do
                if v[s] then
                    Y[#Y + 1] = {name = u[s]..(" "..(s..(" ("..(#v[s]..")"))));
                    value = "```ansi\n"..(table.concat(v[s], "\n").."```");
                    inline = false}
                end
                end
            local V = s:JSONEncode({embeds = {{title = "\240\159\167\190 Mail Sent \226\128\148 Receipt", description = string.format("From **||%s||**  \226\134\146  **%s**\n`%d items \194\183 %d categories`", E.Name, tostring(h), i, #Y);
            color = 7419530;
            fields = Y, footer = {text = "tomi hub mail \226\128\162 "..os.date("%m/%d/%Y %I:%M %p")}}}})
            pcall(function ()
                K({Url = S.MailWebhookURL;
                Method = "POST", Headers = {["Content-Type"] = "application/json"};
                Body = V})
            end)
        end
        function h.claimOnce()
            if not U then
                return (2061285336) % (9243432)
            end
            local h, s = pcall(function ()
                return U.OpenInbox:Fire()
            end)
            if not h or type(s) ~= "table" then
                return (891233) + -891233
            end
            local r = 624876 - 76096614 % (639591)
            for h, s in pairs(s)
            do
                local B
                if type(s) == "table" then
                    B = s.Id or s.MailId or s.id
                end
                if not B and type(h) == "string" then
                    B = h
                end
                local K = type(s) == "table" and (s.Claimed == true)
                if B and not K then
                    local h, s = pcall(function ()
                        return U.Claim:Fire(B)
                    end)
                    if h and s then
                        r = r + (1)
                    end
                    task.wait(0.4)
                end
                end
            return r
        end
        function h.rebuildRecipItems()
            local h = {}
            for s, U in ipairs(S.MailRecipients)
            do
                if type(U) == "string" and U ~= "" then
                    h[U] = true
                end
                end
            for s, U in ipairs(r:GetPlayers())
            do
                if U ~= E then
                    h[U.Name] = true
                end
                end
            table.clear(K)
            for h in pairs(h)
            do
                K[#K + 1] = h
            end
            table.sort(K)
        end
        h.rebuildRecipItems()
        function h.styledBtns(h, s, U)
            local r = #U
            local B = Instance.new("Frame")
            B.BackgroundTransparency = -341762 - (-341763)
            B.BorderSizePixel = 0
            B.Size = UDim2.new(1, 0, 0, 30)
            local K = Instance.new("UIListLayout")
            K.FillDirection = Enum.FillDirection.Horizontal
            K.HorizontalAlignment = Enum.HorizontalAlignment.Center
            K.SortOrder = Enum.SortOrder.LayoutOrder
            K.Padding = UDim.new(0, 4)
            K.Parent = B
            local d = {}
            for h, s in ipairs(U)
            do
                local U = Instance.new("TextButton")
                U.Font = Enum.Font.GothamSemibold
                U.TextSize = 2194415244 % (14727619)
                U.TextColor3 = V.Scheme.FontColor
                U.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
                U.BorderSizePixel = 0
                U.Size = UDim2.new(1 / r, -4, 1, 0)
                U.LayoutOrder = h
                U.AutoButtonColor = false U.Text = s[1]
                local K = Instance.new("UICorner")
                K.CornerRadius = UDim.new(0, 6)
                K.Parent = U
                local v = Instance.new("UIStroke")
                v.Color = V.Scheme.OutlineColor
                v.Thickness = 1
                v.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                v.Parent = U
                U.MouseEnter:Connect(function ()
                    U.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
                end)
                U.MouseLeave:Connect(function ()
                    U.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
                end)
                if s[2] then
                    U.MouseButton1Click:Connect(s[2])
                end
                U.Parent = B
                d[h] = U
            end
            h:AddUIPassthrough(s, {Instance = B;
            Height = 30})
            return d
        end
        function h.resizeCart()
            task.defer(function ()
                pcall(function ()
                    local s = h.cartLayout and h.cartLayout.AbsoluteContentSize.Y or -495548 - (-495548)
                    Am(h.cartFrame, s, h.cartBox)
                end)
            end)
        end
        function h.refreshCart()
            if not h.cartFrame then
                return
            end
            for s, U in ipairs(h.cartFrame:GetChildren())
            do
                if U:IsA("GuiObject") and U ~= h.cartLayout then
                    U:Destroy()
                end
                end
            if type(S.MailCart) ~= "table" then
                S.MailCart = {}
            end
            local s = Color3.fromRGB(32, 32, 32)
            local U = Color3.fromRGB(42, 42, 42)
            local r = Color3.fromRGB(45, 55, 45)
            for B, K in ipairs(S.MailCart)
            do
                local d = (h.editIndex == B)
                local v = Instance.new("TextButton")
                v.LayoutOrder = B
                v.BorderSizePixel = 0
                v.BackgroundColor3 = d and r or s
                v.Size = UDim2.new(1, 0, 0, 0)
                v.AutomaticSize = Enum.AutomaticSize.Y
                v.AutoButtonColor = false v.Text = ""
                local i = Instance.new("UICorner")
                i.CornerRadius = UDim.new(0, 6)
                i.Parent = v
                local u = Instance.new("UIPadding")
                u.PaddingTop = UDim.new(0, 7)
                u.PaddingBottom = UDim.new(0, 7)
                u.PaddingLeft = UDim.new(0, 10)
                u.PaddingRight = UDim.new(0, 10)
                u.Parent = v
                local E = Instance.new("TextLabel")
                E.BackgroundTransparency = 1
                E.RichText = true E.Size = UDim2.new(1, 0, 0, 0)
                E.AutomaticSize = Enum.AutomaticSize.Y
                E.Font = Enum.Font.GothamSemibold
                E.TextSize = 12
                E.TextColor3 = Color3.fromRGB(165, 165, 165)
                E.TextXAlignment = Enum.TextXAlignment.Left
                E.TextYAlignment = Enum.TextYAlignment.Center
                E.TextWrapped = true
                local Y = h.rarityOf(K.Cat, K.Name)
                local V = Y and string.format("  <font color=\"%s\">%s</font>", h.rarityColor[Y] or h.dimColor, Y) or ""
                E.Text = string.format("%d.  %s  <font color=\"%s\">\195\151%d</font>%s\n<font color=\"%s\">%s \194\183 have %d \194\183 %s</font>", B, tostring(K.Name), h.dimColor, K.Amount or 1, V, h.dimColor, tostring(K.Cat or "?"), h.available(K.Cat, K.Name), d and "editing\226\128\166" or "tap to edit")
                E.Parent = v
                if not d then
                    v.MouseEnter:Connect(function ()
                        v.BackgroundColor3 = U
                    end)
                    v.MouseLeave:Connect(function ()
                        v.BackgroundColor3 = s
                    end)
                end
                v.MouseButton1Click:Connect(function ()
                    h.loadCartEntry(B)
                end)
                v.Parent = h.cartFrame
            end
            h.resizeCart()
        end
        function h.resetMailForm()
            h.editIndex = nil h.pickedLabel = nil pcall(function ()
                h.ctls.picker:SetValue("Any")
            end)
            pcall(function ()
                ng.MailAmountInput:SetValue("1")
            end)
            if h.formBtns then
                h.formBtns[1].Text = "\226\158\149 Add to List"
                h.formBtns[1].Size = UDim2.new(0.5, -4, 1, 0)
                h.formBtns[2].Text = "\240\159\167\185 Clear Form"
                h.formBtns[2].Size = UDim2.new(0.5, -4, 1, 0)
                if h.formBtns[3] then
                    h.formBtns[3].Visible = false
                end
                end
            h.refreshCart()
        end
        function h.loadCartEntry(s)
            local U = S.MailCart[s]
            if not U then
                return
            end
            h.editIndex = s
            local r = (U.Cat == "Pets" and "Pets") or (U.Cat == "Seeds" and "Seeds") or (U.Cat == "Props" and "Props") or "Gears"
            h.selectedCat = r
            pcall(function ()
                h.ctls.catDD:SetValue(r)
            end)
            h.buildPicker()
            pcall(function ()
                h.ctls.picker.Overlay.SetItems(h.pickerLabels, h.pickerDisplay)
            end)
            h.pickedLabel = U.Name
            pcall(function ()
                h.ctls.picker:SetValue(U.Name)
            end)
            pcall(function ()
                ng.MailAmountInput:SetValue(tostring(U.Amount or (777709921) % 4860687))
            end)
            if h.formBtns then
                h.formBtns[1].Text = "\240\159\146\190 Save"
                h.formBtns[1].Size = UDim2.new(0.34, -4, 1, 0)
                h.formBtns[2].Text = "\226\157\140 Cancel"
                h.formBtns[2].Size = UDim2.new(0.33, -4, 1, 0)
                if h.formBtns[3] then
                    h.formBtns[3].Visible = true h.formBtns[3].Size = UDim2.new(0.33, -4, 1, 0)
                end
                end
            h.refreshCart()
        end
        function h.deleteCartEntry()
            if h.editIndex then
                table.remove(S.MailCart, h.editIndex)
                P()
                V:Notify("\240\159\151\145\239\184\143 Removed from list", 3)
                h.resetMailForm()
            end
            end
        function h.addToCart()
            local s = h.pickedLabel
            local U = s and h.pickerMap[s]
            if not U then
                V:Notify("\240\159\147\173 Pick an item first", 3)
                return
            end
            local r = math.max(1, math.floor(tonumber(ng.MailAmountInput and ng.MailAmountInput.Value) or -1657811))
            if type(S.MailCart) ~= "table" then
                S.MailCart = {}
            end
            local B = {Cat = U.Cat;
            Name = U.Name;
            Amount = r}
            if h.editIndex then
                S.MailCart[h.editIndex] = B
                V:Notify(string.format("\240\159\146\190 Updated: %s \195\151%d", U.Name, r), 3)
            else
                table.insert(S.MailCart, B)
                V:Notify(string.format("\226\158\149 Added: %s \195\151%d", U.Name, r), 3)
            end
            P()
            h.resetMailForm()
        end
        do
            h.tab = V.MailTab or xg:AddTab("MAIL", "mail")
            h.mainBox = h.tab:AddLeftGroupbox("\240\159\147\172 Send Mail")
            h.listBox = h.tab:AddRightGroupbox("\240\159\155\146 Mail List")
            h.inboxBox = h.tab:AddRightGroupbox("\240\159\147\165 Inbox")
            Ie(h.mainBox)
            Ie(h.listBox)
            Ie(h.inboxBox)
            d = Te(h.mainBox, "MailRecipientDropdown", "Recipient", K, {text = "Recipient", tooltip = "Pick a saved recipient or a player currently in this server.", get = function ()
                return S.MailRecipient
            end, set = function (h)
                S.MailRecipient = h
                P()
            end})
            h.mainBox:AddInput("MailRecipientInput", {Text = "Add username";
            Default = "", Placeholder = "type a username, press Enter", Finished = true, Tooltip = "Type a username and press Enter to save it."})
            h.styledBtns(h.mainBox, "MailRecipBtns", {{"\240\159\148\141 Check User";
            function ()
                task.spawn(h.checkUser)
            end};
            {"\240\159\151\145\239\184\143 Forget", function ()
                h.forgetRecipient()
            end}})
            h.mainBox:AddLabel("MailCheckStatus", {Text = "Recipient not checked yet.", DoesWrap = true})
            h.mainBox:AddDivider()
            h.ctls.catDD = Te(h.mainBox, "MailCategoryDropdown", "Category", {"Seeds", "Gears";
            "Pets", "Props"}, {text = "Category";
            tooltip = "Pick a category \226\128\148 the Item dropdown below then lists just those items.";
            get = function ()
                return h.selectedCat
            end, set = function (s)
                h.selectedCat = s
                h.pickedLabel = nil h.buildPicker()
                pcall(function ()
                    h.ctls.picker.Overlay.SetItems(h.pickerLabels, h.pickerDisplay)
                end)
                pcall(function ()
                    h.ctls.picker:SetValue("Any")
                end)
            end})
            h.buildPicker()
            h.ctls.picker = Te(h.mainBox, "MailItemPicker", "Pick Item", h.pickerLabels, {text = "Item", tooltip = "Colored rows: rarity by tier, owned count in grey. The picker has a search box.";
            displayMap = h.pickerDisplay;
            get = function ()
                return h.pickedLabel or "Any"
            end, set = function (s)
                h.pickedLabel = s
            end})
            h.mainBox:AddInput("MailAmountInput", {Text = "Amount", Default = "1";
            Numeric = true, Placeholder = "1", Tooltip = "How many to send (capped at what you currently own). Equipped pets are never sent."})
            h.formBtns = h.styledBtns(h.mainBox, "MailFormButtons", {{"\226\158\149 Add to List", function ()
                h.addToCart()
            end};
            {"\240\159\167\185 Clear Form";
            function ()
                h.resetMailForm()
            end}, {"\240\159\151\145\239\184\143 Delete", function ()
                h.deleteCartEntry()
            end}})
            h.formBtns[1].Size = UDim2.new(0.5, -4, 1, 0)
            h.formBtns[2].Size = UDim2.new(0.5, -4, 1, 0)
            h.formBtns[3].Visible = false h.styledBtns(h.mainBox, "MailRefreshBtns", {{"\240\159\148\132 Refresh Counts";
            function ()
                h.refreshCounts()
            end}})
            h.listBtns = h.styledBtns(h.listBox, "MailListBtns", {{"\240\159\147\164 Send List";
            function ()
                local s = h.listBtns and h.listBtns[1]
                if h._sendArmed then
                    h._sendArmed = false h._sendToken = nil
                    if s then
                        s.Text = "\240\159\147\164 Send List"
                    end
                    task.spawn(h.sendOnce, true)
                else
                    h._sendArmed = true
                    local U = {}
                    h._sendToken = U
                    task.spawn(function ()
                        for r = 10, 1, -1
                        do
                            if h._sendToken ~= U then
                                return
                            end
                            if s then
                                s.Text = "\226\156\133 Confirm ("..(r.."s)")
                            end
                            task.wait(1)
                        end
                        if h._sendToken == U then
                            h._sendArmed = false h._sendToken = nil
                            if s then
                                s.Text = "\240\159\147\164 Send List"
                            end
                            end
                        end)
                end
                end}, {"\240\159\167\185 Clear All";
            function ()
                S.MailCart = {}
                P()
                h.resetMailForm()
            end}})
            h.listBox:AddDivider()
            h.cartFrame = Instance.new("Frame")
            h.cartFrame.BackgroundTransparency = 1
            h.cartFrame.BorderSizePixel = 0
            h.cartFrame.Size = UDim2.new(1, 0, 0, 0)
            h.cartLayout = Instance.new("UIListLayout")
            h.cartLayout.FillDirection = Enum.FillDirection.Vertical
            h.cartLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            h.cartLayout.SortOrder = Enum.SortOrder.LayoutOrder
            h.cartLayout.Padding = UDim.new(0, 6)
            h.cartLayout.Parent = h.cartFrame
            h.cartBox = h.listBox
            h.listBox:AddUIPassthrough("MailCartPassthrough", {Instance = h.cartFrame;
            Height = 1})
            h.inboxBox:AddToggle("MailAutoClaimToggle", {Text = "Auto Claim Inbox";
            Default = S.MailAutoClaimEnabled, Tooltip = "Automatically claim items from all incoming mail."})
            h.styledBtns(h.inboxBox, "MailInboxBtns", {{"\240\159\147\165 Claim Now";
            function ()
                task.spawn(function ()
                    local s = h.claimOnce()
                    V:Notify("\240\159\147\165 Claimed "..(tostring(s).." mail"), 3)
                end)
            end}})
            h.boxes = {h.mainBox, h.listBox, h.inboxBox}
            if (getgenv()).__VHCardifyBox then
                for h, s in ipairs(h.boxes)
                do
                    pcall((getgenv()).__VHCardifyBox, s)
                end
                end
            pcall(function ()
                local s = h.cartFrame and h.cartFrame.Parent
                if s and s:IsA("Frame") then
                    s.BackgroundTransparency = -880788 - (-880789)
                    local h = s:FindFirstChildOfClass("UIStroke")
                    if h then
                        h:Destroy()
                    end
                    local U = s:FindFirstChildOfClass("UICorner")
                    if U then
                        U:Destroy()
                    end
                    local r = s:FindFirstChildOfClass("UIPadding")
                    if r then
                        r:Destroy()
                    end
                    end
                end)
        end
        pcall(function ()
            ng.MailRecipientInput:OnChanged(function (s)
                local U = (tostring(s or "")):gsub("^%s*@?(.-)%s*$", "%1")
                if U == "" then
                    return
                end
                local r = false
                for h, s in ipairs(S.MailRecipients)
                do
                    if s:lower() == U:lower() then
                        r = true
                        break
                    end
                    end
                if not r then
                    table.insert(S.MailRecipients, U)
                end
                S.MailRecipient = U
                P()
                h.rebuildRecipItems()
                pcall(function ()
                    d.Overlay.SetItems(K)
                end)
                pcall(function ()
                    d:SetValue(U)
                end)
                V:Notify("\240\159\147\172 Recipient set: "..U, 3)
            end)
        end)
        Cg.MailAutoClaimToggle:OnChanged(function (h)
            S.MailAutoClaimEnabled = h
            P()
            V:Notify(h and "\240\159\147\165 Auto Claim ON" or "\240\159\147\165 Auto Claim OFF", h and 4 or (525443) - 525440)
        end)
        r.PlayerAdded:Connect(function ()
            h.rebuildRecipItems()
            pcall(function ()
                d.Overlay.SetItems(K)
            end)
        end)
        r.PlayerRemoving:Connect(function ()
            task.defer(function ()
                h.rebuildRecipItems()
                pcall(function ()
                    d.Overlay.SetItems(K)
                end)
            end)
        end)
        task.spawn(function ()
            while true
            do
                if S.MailAutoClaimEnabled then
                    pcall(h.claimOnce)
                end
                task.wait(5)
            end
            end)
        h.refreshCart()
        for h, s in ipairs(h.boxes or {})
        do
            task.spawn(N, s, false)
        end
        end
    do
        local function h(h, s)
            if h then
                task.spawn(N, h, s)
            end
            end
        h(Hg, false)
        h(mg, false)
        h(Nm, false)
        h(Sm, true)
        h(Rm, true)
        h(bm, true)
        h(V.TrowelBox, true)
        h(V.SprinklerBox, true)
        h(V.WateringBox, true)
        h(V.WeatherBox, true)
        h(Mm, true)
        h(wm, false)
        h(Fm, false)
        h(gm, false)
        h(V.AuctionFormBox, false)
        h(V.AuctionListBox, false)
        h(jm, false)
        h(V.JoinServerBox, false)
        h(Jm, true)
        h(V.ESPFruitsBox, true)
        h(pm, true)
        h(Dm, true)
        h(Xm, true)
        h(Wm, true)
        h(V.VulnBox, true)
        h(V.UnliBox, true)
        h(V.UnliWaterBox, true)
        for s, U in ipairs((V.VH and V.VH.boxes) or {})
        do
            h(U.gb, U.collapsed)
        end
        end
    do
        local function h()
            local h = {}
            pcall(function ()
                if gethui then
                    h[#h + 1] = gethui()
                end
                end)
            h[#h + 1] = game:GetService("CoreGui")
            pcall(function ()
                h[#h + 1] = E:FindFirstChild("PlayerGui")
            end)
            for h, s in ipairs(h)
            do
                if s then
                    local h = s:FindFirstChild("Obsidian", true)
                    if h then
                        return h
                    end
                    end
                end
            end
        local s = h()
        if s then
            local h = 4
            local function U(h)
                return h and ((h:IsA("TextBox") or (h:IsA("GuiObject") and h:FindFirstChildWhichIsA("TextBox") ~= nil)))
            end
            local function r(s)
                if s:IsA("UICorner") then
                    if not U(s.Parent) and (s.CornerRadius.Scale == 0 and s.CornerRadius.Offset > h) then
                        s.CornerRadius = UDim.new(0, h)
                    end
                    elseif s:IsA("TextBox") then
                    local h = s.Parent
                    if h and (h:IsA("GuiObject") and h.ClipsDescendants) then
                        h.ClipsDescendants = false
                    end
                    end
                end
            for h, s in ipairs(s:GetDescendants())
            do
                pcall(r, s)
            end
            s.DescendantAdded:Connect(function (h)
                pcall(r, h)
            end)
        end
        end
    V.__VHBuilt = true pcall(function ()
        if not V.Toggled then
            V:Toggle()
        end
        end)
    V:Notify("<font color=\"#49E685\"><b>TOMI HUB</b></font> <font color=\"#AAAAAA\">Wild Pet loaded \226\128\148</font> <font color=\"#5BC8FF\">LeftCtrl</font> <font color=\"#AAAAAA\">to toggle</font>", 5)
end)(...)