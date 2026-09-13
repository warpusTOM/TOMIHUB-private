return (function (...)
    local K = game.GameId == 7500518143
    local Y = K and 108890465381070 or 129954712878720
    if game.PlaceId == Y then
        return
    end
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    task.wait(0.5)
    if (getgenv()).__TomiHubUIActive then
        print("\240\159\140\141 [TOMI HUB] Another TOMI HUB script is already active ("..(tostring((getgenv()).__TomiHubUIActive).."). Aborting."))
        return
    end;
    (getgenv()).__TomiHubUIActive = "MainWorld"
    local I = game:GetService("HttpService")
    local L = game:GetService("ReplicatedStorage")
    local S = game:GetService("TweenService")
    local E = game:GetService("Players")
    local j = E.LocalPlayer or (E:GetPropertyChangedSignal("LocalPlayer")):Wait() or E.LocalPlayer
    local T = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
    local D = (loadstring(game:HttpGet(T.."Library.lua")))()
    local B
    pcall(function ()
        B = (loadstring(game:HttpGet("https://upio-github-mirror.pages.dev/source.lua")))()
    end)
    if B then
        D:SetIconModule(B)
    end
    local function J(K, Y)
        if not K.ToggleCollapsed then
            return
        end
        local I = Instance.new("TextButton")
        I.Name = "CollapseButton"
        I.BackgroundTransparency = 1
        I.Size = UDim2.new(1, -34, 0, 34)
        I.Position = UDim2.new(0, 0, 0, 0)
        I.Text = ""
        I.ZIndex = K.Holder.ZIndex + 2
        I.Parent = K.Holder
        I.MouseButton1Click:Connect(function ()
            K:ToggleCollapsed()
        end)
        if Y then
            K:SetCollapsed(true)
        end
        end
    local W = {}
    local M = {}
    function W.StyleGroupboxPanel(K)
        local Y = D.Scheme.MainColor
        local I = D.Scheme.OutlineColor
        local L = 6
        local S = 35
        local E = K.Holder
        local j = K.Container
        local T = j:FindFirstChildOfClass("UIListLayout")
        j.Position = UDim2.new(0, L, 0, S + L)
        j.Size = UDim2.new(1, -L * 2, 1, -((S + L * 2)))
        j.BackgroundColor3 = Y
        j.BackgroundTransparency = 368332 + (-368332)
        j.BorderSizePixel = 0
        local B = Instance.new("UICorner")
        B.CornerRadius = UDim.new(0, 8)
        B.Parent = j
        local J
        for K, Y in ipairs(E:GetChildren())
        do
            if Y:IsA("Frame") and (Y.Position.Y.Offset == -671726 - (-671760) and Y.Size.Y.Offset <= 2) then
                J = Y
                break
            end
            end
        K.Resize = function (K,...)
            if J then
                J.Visible = not K.Collapsed
            end
            if K.Collapsed then
                E.Size = UDim2.new(1, 0, 0, 34)
                return
            end
            E.Size = UDim2.new(1, 0, 0, ((T.AbsoluteContentSize.Y / D.DPIScale) + 49) + L * 2)
        end
        K:Resize()
    end
    function W.MakeTargetOverlay(K)
        local Y = K.Title or "Targets"
        local I = K.Items or {}
        local L = K.Store or {}
        local S = K.DisplayMap
        local E = K.OnDone
        local T = K.OnToggle
        local B = K.Single
        local J
        local W = D.Scheme.BackgroundColor
        local M = D.Scheme.MainColor
        local x = D.Scheme.OutlineColor
        local p = D.Scheme.FontColor
        local b = D.Scheme.AccentColor
        local Q = D:GetBetterColor(p, -90)
        local z = M
        local C = D:GetBetterColor(M, 18)
        local X = D.ScreenGui
        if not X then
            local K, Y = pcall(function ()
                return gethui and gethui()
            end)
            if K and Y then
                X = Y
            end
            end
        if not X then
            pcall(function ()
                X = game:GetService("CoreGui")
            end)
        end
        if not X then
            X = j:WaitForChild("PlayerGui")
        end
        local l = Instance.new("Frame")
        l.Name = "TOMIHUBTargetOverlay"
        l.Size = UDim2.fromScale(1, 1)
        l.BackgroundColor3 = Color3.new(0, 0, 0)
        l.BackgroundTransparency = 0.45
        l.BorderSizePixel = 610924 + (-610924)
        l.ZIndex = 9000
        l.Visible = false l.Parent = X
        local r = Instance.new("TextButton")
        r.BackgroundTransparency = -153731 - (-153732)
        r.Size = UDim2.fromScale(1, 1)
        r.Text = ""
        r.ZIndex = 9000
        r.Parent = l
        local g = Instance.new("Frame")
        g.AnchorPoint = Vector2.new(0.5, 0.5)
        g.Position = UDim2.fromScale(0.5, 0.5)
        g.Size = UDim2.fromOffset(560, 460)
        g.BackgroundColor3 = W
        g.BorderSizePixel = 0
        g.ZIndex = -2407 - (-11408)
        g.Active = true g.Parent = l
        local Z = Instance.new("UICorner")
        Z.CornerRadius = UDim.new(0, 12)
        Z.Parent = g
        local y = Instance.new("UIStroke")
        y.Color = x
        y.Thickness = 316910731 % (1545906)
        y.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        y.Parent = g
        local q = Instance.new("Frame")
        q.Size = UDim2.new(1, 0, 0, 56)
        q.BackgroundTransparency = 1
        q.ZIndex = 9002
        q.Active = true q.Parent = g
        local F = Instance.new("TextLabel")
        F.BackgroundTransparency = (1587745492) % 16536423 + (-248883)
        F.Position = UDim2.fromOffset(20, 14)
        F.Size = UDim2.new(1, -160, 0, 30)
        F.FontFace = D.Scheme.Font
        F.Text = "\240\159\166\150 "..Y
        F.TextSize = 22
        F.TextColor3 = p
        F.TextXAlignment = Enum.TextXAlignment.Left
        F.ZIndex = 9003
        F.Parent = q
        local N = Instance.new("TextButton")
        N.AnchorPoint = Vector2.new(1, 0)
        N.Position = UDim2.new(1, -16, 0, 12)
        N.Size = UDim2.fromOffset(110, 34)
        N.BackgroundColor3 = b
        N.Text = "Done"
        N.FontFace = D.Scheme.Font
        N.TextSize = 15
        N.TextColor3 = p
        N.AutoButtonColor = true N.ZIndex = 9003
        N.Parent = q
        local G = Instance.new("UICorner")
        G.CornerRadius = UDim.new(0, 8)
        G.Parent = N
        pcall(function ()
            D:MakeDraggable(g, q, true, false)
        end)
        local a = Instance.new("Frame")
        a.Position = UDim2.fromOffset(16, 60)
        a.Size = UDim2.new(1, -32, 1, -76)
        a.BackgroundColor3 = M
        a.BorderSizePixel = 0
        a.ZIndex = 9001
        a.Parent = g
        local V = Instance.new("UICorner")
        V.CornerRadius = UDim.new(0, 10)
        V.Parent = a
        local s = Instance.new("UIStroke")
        s.Color = x
        s.Thickness = 1
        s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        s.Parent = a
        local k = Instance.new("TextBox")
        k.Position = UDim2.fromOffset(14, 14)
        k.Size = UDim2.new(1, -28, 0, 40)
        k.BackgroundColor3 = W
        k.Text = ""
        k.PlaceholderText = "Search items..."
        k.PlaceholderColor3 = Q
        k.FontFace = D.Scheme.Font
        k.TextSize = 397695 - 1434234929 % (5735349)
        k.TextColor3 = p
        k.TextXAlignment = Enum.TextXAlignment.Left
        k.ClearTextOnFocus = false k.ZIndex = -996460 + (1005462)
        k.Parent = a
        local e = Instance.new("UICorner")
        e.CornerRadius = UDim.new(0, 8)
        e.Parent = k
        local u = Instance.new("UIPadding")
        u.PaddingLeft = UDim.new(0, 14)
        u.Parent = k
        local R = Instance.new("UIStroke")
        R.Color = x
        R.Thickness = 1
        R.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        R.Parent = k
        local function d(K, Y)
            local I = Instance.new("TextButton")
            I.AnchorPoint = Vector2.new(1, 0)
            I.Position = UDim2.new(1, Y, 0, 62)
            I.Size = UDim2.fromOffset(54, 24)
            I.BackgroundColor3 = W
            I.Text = K
            I.FontFace = D.Scheme.Font
            I.TextSize = 13
            I.TextColor3 = p
            I.ZIndex = 9003
            I.Parent = a
            local L = Instance.new("UICorner")
            L.CornerRadius = UDim.new(0, 6)
            L.Parent = I
            local S = Instance.new("UIStroke")
            S.Color = x
            S.Thickness = 1
            S.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            S.Parent = I
            return I
        end
        local A = Instance.new("ScrollingFrame")
        A.Position = UDim2.fromOffset(14, 94)
        A.Size = UDim2.new(1, -28, 1, -108)
        A.BackgroundColor3 = W
        A.BorderSizePixel = 0
        A.ScrollBarThickness = 5
        A.ScrollBarImageColor3 = x
        A.CanvasSize = UDim2.new()
        A.ZIndex = 5086 - (-3916)
        A.Parent = a
        local n = Instance.new("UICorner")
        n.CornerRadius = UDim.new(0, 8)
        n.Parent = A
        local w = Instance.new("UIListLayout")
        w.Padding = UDim.new(0, 4)
        w.SortOrder = Enum.SortOrder.LayoutOrder
        w.Parent = A
        local i = Instance.new("UIPadding")
        i.PaddingLeft = UDim.new(0, 8)
        i.PaddingRight = UDim.new(0, 8)
        i.PaddingTop = UDim.new(0, 8)
        i.PaddingBottom = UDim.new(0, 8)
        i.Parent = A;
        (w:GetPropertyChangedSignal("AbsoluteContentSize")):Connect(function ()
            A.CanvasSize = UDim2.new(0, 0, 0, w.AbsoluteContentSize.Y + 16)
        end)
        local o = {}
        local t = {}
        local function U(K)
            local Y = Instance.new("TextButton")
            Y.Size = UDim2.new(1, 0, 0, 40)
            Y.BackgroundColor3 = L[K] and C or z
            Y.AutoButtonColor = false Y.Text = ""
            Y.ZIndex = 9003
            Y.Parent = A
            local I = Instance.new("UICorner")
            I.CornerRadius = UDim.new(0, 6)
            I.Parent = Y
            local E = Instance.new("TextLabel")
            E.BackgroundTransparency = 1
            E.Position = UDim2.fromOffset(14, 0)
            E.Size = UDim2.new(1, -22, 1, 0)
            E.RichText = true E.Text = (S and S[K]) or K
            E.FontFace = D.Scheme.Font
            E.TextSize = 15
            E.TextColor3 = p
            E.TextXAlignment = Enum.TextXAlignment.Left
            E.ZIndex = 196080 + (-187076)
            E.Parent = Y
            local function j()
                Y.BackgroundColor3 = L[K] and C or z
            end
            Y.MouseButton1Click:Connect(function ()
                if B then
                    for K in pairs(L)
                    do
                        L[K] = nil
                    end
                    L[K] = true
                    for K, Y in pairs(o)
                    do
                        Y()
                    end
                    if T then
                        pcall(T, K, true)
                    end
                    else
                    L[K] = not L[K]
                    j()
                    if T then
                        pcall(T, K, L[K])
                    end
                    end
                end)
            o[K] = j
            t[K] = Y
        end
        local function v(K)
            for K, Y in pairs(t)
            do
                Y:Destroy()
            end
            o = {}
            t = {}
            for K, Y in ipairs(K)
            do
                U(Y)
            end
            end
        v(I)
        if not B then
            (d("None", -14)).MouseButton1Click:Connect(function ()
                for K in pairs(t)
                do
                    L[K] = false o[K]()
                end
                if T then
                    pcall(T)
                end
                end);
            (d("All", -74)).MouseButton1Click:Connect(function ()
                for K in pairs(t)
                do
                    L[K] = true o[K]()
                end
                if T then
                    pcall(T)
                end
                end)
        end;
        (k:GetPropertyChangedSignal("Text")):Connect(function ()
            local K = string.lower(k.Text)
            for Y, I in pairs(t)
            do
                I.Visible = (K == "") or string.find(string.lower(Y), K, 1, true) ~= nil
            end
            end)
        local function c()
            l.Visible = false
            if E then
                pcall(E)
            end
            end
        J = c
        N.MouseButton1Click:Connect(c)
        return {Open = function ()
            k.Text = ""
            for K in pairs(t)
            do
                t[K].Visible = true o[K]()
            end
            l.Visible = true
        end;
        SetItems = function (K, Y)
            I = K
            if Y ~= nil then
                S = Y
            end
            v(K)
        end, Repaint = function ()
            for K in pairs(t)
            do
                o[K]()
            end
            end}
    end
    function W.MakeButtonPanel(K, Y, I)
        local L = Color3.fromRGB(32, 32, 32)
        local S = Color3.fromRGB(42, 42, 42)
        local E = D.Scheme.FontColor
        local j = D.Scheme.OutlineColor
        local T = 30
        local B = 4
        local J = (#I * T) + (((#I - 1)) * B)
        local W = Instance.new("Frame")
        W.BackgroundTransparency = 1
        W.BorderSizePixel = 0
        W.Size = UDim2.new(1, 0, 0, J)
        local M = Instance.new("UIListLayout")
        M.FillDirection = Enum.FillDirection.Vertical
        M.HorizontalAlignment = Enum.HorizontalAlignment.Center
        M.SortOrder = Enum.SortOrder.LayoutOrder
        M.Padding = UDim.new(0, B)
        M.Parent = W
        for K, Y in ipairs(I)
        do
            local I = Instance.new("TextButton")
            I.Text = Y[1]
            I.Font = Enum.Font.GothamSemibold
            I.TextSize = 13
            I.TextColor3 = E
            I.BackgroundColor3 = L
            I.BorderSizePixel = 465137670 % (4896186)
            I.Size = UDim2.new(1, 0, 0, T)
            I.LayoutOrder = K
            I.AutoButtonColor = false
            local D = Instance.new("UICorner")
            D.CornerRadius = UDim.new(0, 6)
            D.Parent = I
            local B = Instance.new("UIStroke")
            B.Color = j
            B.Thickness = 1
            B.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            B.Parent = I
            I.MouseEnter:Connect(function ()
                I.BackgroundColor3 = S
            end)
            I.MouseLeave:Connect(function ()
                I.BackgroundColor3 = L
            end)
            I.MouseButton1Click:Connect(Y[2])
            I.Parent = W
        end
        K:AddUIPassthrough(Y, {Instance = W;
        Height = J})
        return W
    end
    function W.AttachOverlayToDropdown(K, Y)
        Y = Y or {}
        if not K then
            return
        end
        local I = (K.Multi == true) or (type(K.Value) == "table")
        local L = {}
        local function S()
            for K in pairs(L)
            do
                L[K] = nil
            end
            local Y = K.Value
            if I then
                if type(Y) == "table" then
                    for K, Y in pairs(Y)
                    do
                        if Y then
                            L[K] = true
                        end
                        end
                    end
                else
                if type(Y) == "string" and Y ~= "" then
                    L[Y] = true
                end
                end
            end
        local E = W.MakeTargetOverlay({Title = Y.title or K.Text or "Select", Items = K.Values or {}, Store = L, Single = not I;
        OnToggle = function (S)
            if I then
                local Y = {}
                for K, I in pairs(L)
                do
                    if I then
                        Y[K] = true
                    end
                    end
                pcall(function ()
                    K:SetValue(Y)
                end)
            elseif S then
                pcall(function ()
                    K:SetValue(S)
                end)
            end
            if Y.onChange then
                pcall(Y.onChange)
            end
            end})
        task.defer(function ()
            local Y = K.Holder
            if not Y then
                return
            end
            local I = Y:FindFirstChildWhichIsA("TextButton", true)
            local L = I or Y
            local j = Instance.new("TextButton")
            j.Name = "TOMIHUBOverlayCatcher"
            j.BackgroundTransparency = 1
            j.Text = ""
            j.Size = UDim2.fromScale(1, 1)
            j.Position = UDim2.fromScale(0, 0)
            j.ZIndex = ((L.ZIndex or (20270113) % 3378352)) + (50)
            j.Active = true j.AutoButtonColor = false j.Parent = L
            local T = j.MouseButton1Click:Connect(function ()
                pcall(function ()
                    if K.Menu and K.Menu.Close then
                        K.Menu:Close()
                    end
                    end)
                S()
                pcall(function ()
                    E.SetItems(K.Values or {})
                end)
                E.Open()
            end)
            pcall(function ()
                D:GiveSignal(T)
            end)
            pcall(function ()
                for K, Y in ipairs(Y:GetDescendants())
                do
                    if Y:IsA("TextLabel") or Y:IsA("TextButton") then
                        Y.TextXAlignment = Enum.TextXAlignment.Left
                        Y.TextYAlignment = Enum.TextYAlignment.Center
                    end
                    end
                end)
        end)
        return E
    end
    local x = {}
    local p = D.Notify
    task.spawn(function ()
        while true
        do
            if #x > 0 then
                local K = table.remove(x, 1)
                pcall(function ()
                    p(D, K.msg, K.duration)
                end)
            end
            task.wait(0.1)
        end
        end)
    local function b(K, Y)
        table.insert(x, {msg = tostring(K);
        duration = Y or 5})
    end
    D.Notify = function (K, Y, I)
        b(Y, I)
    end
    local Q = false
    local z = function ()
        end
    local C = nil pcall(function ()
        C = (game:GetService("ReplicatedStorage")).GameEvents:WaitForChild("Notification", 5)
    end)
    if C then
        local K = -795788 - (-795802)
        local Y = {}
        local function I(Y)
            pcall(function ()
                local I = Y.Size
                Y.Size = UDim2.new(I.X.Scale, I.X.Offset, 0, 28)
                local L = Y:FindFirstChildOfClass("UIPadding")
                if L then
                    L.PaddingTop = UDim.new(0, 2)
                    L.PaddingBottom = UDim.new(0, 2)
                end
                local S = Y:FindFirstChild("TextLabel")
                if S then
                    S.TextSize = K
                    S.TextScaled = false S.TextStrokeTransparency = 0.5
                    S.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    local Y = S.Size
                    S.Size = UDim2.new(Y.X.Scale, Y.X.Offset, 0, 24)
                end
                local E = Y:FindFirstChildOfClass("ImageLabel")
                if E then
                    E.ImageTransparency = 83516785 % (5219799)
                    E.BackgroundTransparency = (-52139) - (-52140)
                end
                end)
        end
        local function L(L)
            if Y[L] then
                return
            end
            Y[L] = true I(L)
            pcall(function ()
                local Y = L:FindFirstChildOfClass("ImageLabel")
                if Y then
                    (Y:GetPropertyChangedSignal("ImageTransparency")):Connect(function ()
                        if Y.ImageTransparency ~= 1 then
                            Y.ImageTransparency = 1403717953 % (16710928)
                        end
                        end);
                    (Y:GetPropertyChangedSignal("BackgroundTransparency")):Connect(function ()
                        if Y.BackgroundTransparency ~= 1 then
                            Y.BackgroundTransparency = 1
                        end
                        end)
                end
                local I = L:FindFirstChild("TextLabel")
                if I then
                    (I:GetPropertyChangedSignal("TextStrokeTransparency")):Connect(function ()
                        if I.TextStrokeTransparency ~= 0.5 then
                            I.TextStrokeTransparency = 0.5
                        end
                        end);
                    (I:GetPropertyChangedSignal("TextSize")):Connect(function ()
                        if I.TextSize ~= K then
                            I.TextSize = K
                        end
                        end);
                    (I:GetPropertyChangedSignal("Text")):Connect(function ()
                        if I.Text:match("%[X%d+%]$") then
                            I.TextColor3 = Color3.fromRGB(255, 220, 50)
                        else
                            I.TextColor3 = Color3.fromRGB(255, 255, 255)
                        end
                        end)
                end
                end)
            task.spawn(function ()
                task.wait(0.35)
                I(L)
            end)
        end
        task.spawn(function ()
            task.wait(2)
            pcall(function ()
                local K = (((game:GetService("Players")).LocalPlayer:WaitForChild("PlayerGui")):WaitForChild("Top_Notification")):WaitForChild("Frame")
                for K, Y in ipairs(K:GetChildren())
                do
                    if Q and Y:IsA("Frame") then
                        L(Y)
                    end
                    end
                K.ChildAdded:Connect(function (K)
                    if Q and K:IsA("Frame") then
                        L(K)
                    end
                    end)
            end)
        end)
        C.OnClientEvent:Connect(function (Y,...)
            if not Q or type(Y) ~= "string" then
                return
            end
            task.wait()
            pcall(function ()
                local I = (((game:GetService("Players")).LocalPlayer:WaitForChild("PlayerGui")):WaitForChild("Top_Notification")):WaitForChild("Frame")
                local S = 0
                for K, I in ipairs(I:GetChildren())
                do
                    if I:IsA("Frame") and I:GetAttribute("OG") == Y then
                        S = S + 1
                    end
                    end
                if S > (-647401) - (-647402) then
                    local E = nil
                    for K, I in ipairs(I:GetChildren())
                    do
                        if I:IsA("Frame") and I:GetAttribute("OG") == Y then
                            if not E then
                                E = I
                            else
                                I:Destroy()
                            end
                            end
                        end
                    if E then
                        local I = E:FindFirstChild("VAL_OBJ")
                        local j = I and (I.Value) or S
                        if I then
                            I.Value = j
                        end
                        local T = E:FindFirstChild("TextLabel")
                        if T then
                            T.Text = Y..(" [X"..(j.."]"))
                            T.TextSize = K
                            T.TextScaled = false T.TextColor3 = Color3.fromRGB(255, 220, 50)
                            T.TextStrokeTransparency = (345637751) % (16458940.5)
                        end
                        E:SetAttribute("NotificationTimer", 3.5)
                        L(E)
                    end
                    end
                end)
        end)
    end
    local X = require((L:WaitForChild("Modules")):WaitForChild("DataService"))
    local l = L:WaitForChild("GameEvents")
    local r = l:WaitForChild("PetAgeLimitBreak_SubmitHeld")
    local g = l:WaitForChild("PetAgeLimitBreak_Submit")
    local Z = l:WaitForChild("PetAgeLimitBreak_Skip")
    local y = l:WaitForChild("PetAgeLimitBreak_Claim")
    local q = l:WaitForChild("PetAgeLimitBreak_Cancel")
    local F = l:WaitForChild("PetsService")
    local N = l:WaitForChild("PetCooldownsUpdated")
    local G = nil pcall(function ()
        G = l:WaitForChild("TradeWorld", 5) and l.TradeWorld:WaitForChild("TravelToTradeWorld", 5)
    end)
    local a = require(((L:WaitForChild("Data")):WaitForChild("PetRegistry")):WaitForChild("PetMutationRegistry"))
    local function V(K)
        return ((((tostring(K)):reverse()):gsub("%d%d%d", "%1,")):reverse()):gsub("^,", "")
    end
    local function s(K, Y)
        local I = 0.1
        local L = tonumber(K) or -1786832
        local S = math.max(1, tonumber(Y) or 0)
        local E = L + ((L * I) * S)
        return math.floor(E * 100.5) / (100)
    end
    local k = tostring(j.UserId)
    local e = j.Name
    local u = "TOMIHUB_AgeBreak_"..(k..".json")
    local R = {TargetPetUUIDs = {};
    DupePetUUIDs = {}, BaseWeightLimit = true, LevelLimit = false, SkipToken = false;
    TargetLevel = 125;
    LimitWeight = 0;
    EnableAgeBreak = false, WebhookURL = "";
    WebhookEnabled = false, AntiAFK = true;
    AutoTradeWorld = false;
    TradeWorldDelay = 15, AutoSendTicket = false;
    AutoAcceptTrade = false;
    AutoGiftMode = false, EnableTradeTicket = false, AutoConfirmAccept = false;
    SelectedItemType = "Pet";
    SelectedItemName = "";
    SelectedItemNames = {};
    TargetPlayerName = "";
    SendDelay = 5, PetMinWeight = 0.8, PetMaxWeight = 2.8;
    PetMinAge = 1, PetMaxAge = 100;
    HoldableMinWeight = 1, HoldableMaxWeight = 50, EnablePetPnP = false, PnPPetTimer = 5;
    PnPPets = {};
    PnPDelayUnequip = 0.5;
    PnPDelayEquip = 0.5;
    PnPUseThreading = true;
    FastAgeBreak = false, HoldUntilNearFull = false, NearFullThreshold = 92;
    EnableGardenAuto = false, GardenTargetPetUUIDs = {}, GardenAgeTeamUUIDs = {}, GardenElephantUUIDs = {};
    GardenMaxTeamUUIDs = {}, GardenSwapLimitAge = 100;
    GardenTargetWeight = 100, GardenSmartSwap = true;
    GardenEnableMaxLevel = true, GardenBatchMaxLevel = false, GardenMaxLevelSwapAge = 60, GardenMaxAge = 500;
    GardenAgeBoostOnly = false, SellPetTypes = {}, SellPetMinWeight = 0.8;
    SellPetMaxWeight = 2.8;
    SellPetMinLevel = 1, SellPetMaxLevel = 2, EnableAutoSell = false}
    local function d()
        pcall(function ()
            writefile(u, I:JSONEncode(R))
        end)
    end
    local function A()
        pcall(function ()
            if isfile(u) then
                local K = readfile(u)
                local Y = I:JSONDecode(K)
                for K, Y in pairs(Y)
                do
                    R[K] = Y
                end
                if type(R.TargetPetUUIDs) ~= "table" then
                    R.TargetPetUUIDs = {}
                end
                if type(R.DupePetUUIDs) ~= "table" then
                    R.DupePetUUIDs = {}
                end
                if type(R.SelectedItemNames) ~= "table" then
                    R.SelectedItemNames = {}
                end
                if type(R.GardenTargetPetUUIDs) ~= "table" then
                    R.GardenTargetPetUUIDs = {}
                end
                if type(R.GardenAgeTeamUUIDs) ~= "table" then
                    R.GardenAgeTeamUUIDs = {}
                end
                if type(R.GardenElephantUUIDs) ~= "table" then
                    R.GardenElephantUUIDs = {}
                end
                if type(R.GardenMaxTeamUUIDs) ~= "table" then
                    R.GardenMaxTeamUUIDs = {}
                end
                if type(R.GardenSingleTargetRestrict) ~= "boolean" then
                    R.GardenSingleTargetRestrict = false
                end
                if type(R.GardenMaxAge) ~= "number" then
                    R.GardenMaxAge = 500
                end
                if type(R.GardenAgeBoostOnly) ~= "boolean" then
                    R.GardenAgeBoostOnly = false
                end
                if type(R.SellPetTypes) ~= "table" then
                    R.SellPetTypes = {}
                end
                if type(R.SellPetType) == "string" and (R.SellPetType ~= "" and #R.SellPetTypes == 0) then
                    table.insert(R.SellPetTypes, R.SellPetType)
                end
                R.SellPetType = nil
            else
                print("[AgeBreak] No config found for "..(e..", using defaults."))
            end
            end)
    end
    pcall(A)
    local n = false _G.TOMIHUB_FastAgeBreak = _G.TOMIHUB_FastAgeBreak or {Active = false;
    PetReady = false, MainPlaceId = game.PlaceId}
    local w = {}
    local i = {}
    local o = {}
    local function t(K)
        if not K then
            return "Normal"
        end
        local Y = K.MutationType
        if Y and (a and a.EnumToPetMutation) then
            return a.EnumToPetMutation[Y] or "Normal"
        end
        return "Normal"
    end
    local function U(K)
        for Y, I in ipairs(i)
        do
            if I.label == K or I.targetLabel == K then
                return I.uuid
            end
            end
        return nil
    end
    local function v()
        local K = {}
        for Y, I in ipairs(i)
        do
            K[I.uuid] = I.label
        end
        w = {}
        i = {}
        o = {}
        local Y = {}
        local I = 0
        local L, S = pcall(function ()
            local K = X:GetData()
            if not K or not K.PetsData or not K.PetsData.PetInventory then
                print("[AgeBreak] WARNING: No PetInventory data found!")
                return
            end
            local L = K.PetsData.PetInventory.Data
            local S = {}
            for K, L in pairs(L)
            do
                I = I + (1)
                o[K] = L
                Y[K] = true
                local E = L.PetData or {}
                local j = L.PetType or "Unknown"
                local T = E.Level or -756638 - (-756638)
                local D = E.BaseWeight or -1606546
                local B = s(D, T)
                local J = t(E)
                local W = string.upper(string.sub(J, 1, 2))
                local M = E.IsFavorite and "\226\157\164\239\184\143" or ""
                local x = (T >= 100) and "\226\173\144" or ""
                local p = string.sub(K, 1, 6)
                local b = E.IsFavorite or false
                local Q = D * 1.1
                local z = string.format("%s%s%d.%.2fkg [%s]%s {%s}", M, x, T, B, W, j, p)
                local C = string.format("%s%s%d.%.2fkg(a1) [%s]%s {%s}", M, x, T, Q, W, j, p)
                table.insert(S, {label = z, targetLabel = C;
                uuid = K;
                species = j;
                level = T, isFavorite = b})
            end
            table.sort(S, function (K, Y)
                if K.species == Y.species then
                    return K.level < Y.level
                end
                return K.species < Y.species
            end)
            for K, Y in ipairs(S)
            do
                table.insert(w, Y.label)
                table.insert(i, {label = Y.label, targetLabel = Y.targetLabel, uuid = Y.uuid;
                isFavorite = Y.isFavorite;
                level = Y.level;
                isAgebreak = false})
            end
            end)
        if not L then
            warn("[AgeBreak] RefreshInventory ERROR: "..tostring(S))
        end
        local E = nil pcall(function ()
            local K = X:GetData()
            E = K and K.PetAgeBreakMachine or nil
        end)
        local j = {}
        local T = {}
        if E and E.SubmittedPet then
            local K = E.SubmittedPet
            local I = K.PetData or {}
            local L = K.UUID
            if L and not Y[L] then
                local Y = K.PetType or "Unknown"
                local S = I.Level or (873274983) % 3987557
                local E = I.BaseWeight or 0
                local D = E * 1.1
                local B = t(I)
                local J = string.upper(string.sub(B, 1, 2))
                local W = I.IsFavorite and "\226\157\164\239\184\143" or ""
                local M = (S >= 100) and "\226\173\144" or ""
                local x = string.sub(L, 1, 6)
                local p = string.format("[Agebreak] %s%s%d.%.2fkg [%s]%s {%s}", W, M, S, D, J, Y, x)
                table.insert(j, {label = p;
                uuid = L, isFavorite = I.IsFavorite or false, level = S;
                isAgebreak = true})
                T[L] = true
            end
            end
        local D = {}
        for K, Y in ipairs(R.TargetPetUUIDs)
        do
            D[Y] = true
        end
        for K, Y in ipairs(R.DupePetUUIDs)
        do
            D[Y] = true
        end
        for I, L in pairs(D)
        do
            if not Y[I] and not T[I] then
                local Y = K[I]
                if Y then
                    local K = (Y:gsub(" ?%[MACHINE%]", "")):gsub(" ?%[Agebreak%] ?", "")
                    table.insert(w, K)
                    table.insert(i, {label = K, uuid = I;
                    isFavorite = false;
                    level = 0;
                    isAgebreak = false})
                end
                end
            end
        if #j > 0 then
            local K = {}
            local Y = {}
            for I, L in ipairs(j)
            do
                table.insert(K, L.label)
                table.insert(Y, {label = L.label, uuid = L.uuid;
                isFavorite = L.isFavorite;
                level = L.level, isAgebreak = true})
            end
            for Y, I in ipairs(w)
            do
                table.insert(K, I)
            end
            for K, I in ipairs(i)
            do
                table.insert(Y, I)
            end
            w = K
            i = Y
        end
        if #w == 0 then
            table.insert(w, "No Pets Found")
        end
        end
    v()
    local function c()
        local K, Y = pcall(function ()
            local K = X:GetData()
            return K and K.PetAgeBreakMachine or nil
        end)
        if K then
            return Y
        end
        return nil
    end
    local function H(K)
        local Y = j.Character
        if Y then
            for Y, I in pairs(Y:GetChildren())
            do
                if I:GetAttribute("PET_UUID") == K then
                    return I
                end
                end
            end
        for Y, I in pairs(j.Backpack:GetChildren())
        do
            if I:GetAttribute("PET_UUID") == K then
                return I
            end
            end
        return nil
    end
    local function P(K)
        local Y = H(K)
        if Y then
            local K = j.Character
            local I = K and K:FindFirstChildWhichIsA("Humanoid")
            if I then
                I:UnequipTools()
                task.wait(0.1)
                if Y.Parent ~= K then
                    I:EquipTool(Y)
                    task.wait(0.3)
                end
                end
            return Y
        end
        return nil
    end
    local function m(K)
        local Y = j.Character
        if not Y then
            return false
        end
        for Y, I in pairs(Y:GetChildren())
        do
            if I:IsA("Tool") and I:GetAttribute("PET_UUID") == K then
                return true
            end
            end
        return false
    end
    local function O(K, Y)
        local I, L = pcall(function ()
            local I = Y or X:GetData()
            if not I or not I.PetsData or not I.PetsData.PetInventory then
                return nil
            end
            return I.PetsData.PetInventory.Data[K]
        end)
        if I then
            return L
        end
        return nil
    end
    local function f(K)
        local Y = {}
        pcall(function ()
            local I = X:GetData()
            if not I or not I.PetsData or not I.PetsData.PetInventory then
                return
            end
            local L = I.PetsData.PetInventory.Data
            for I, L in pairs(L)
            do
                if L.PetType == K then
                    table.insert(Y, {UUID = I;
                    PetType = L.PetType, Level = L.PetData and L.PetData.Level or -1681612, BaseWeight = L.PetData and L.PetData.BaseWeight or 0;
                    IsFavorite = L.PetData and L.PetData.IsFavorite or false})
                end
                end
            end)
        return Y
    end
    local function h(K)
        for Y, I in ipairs(i)
        do
            if I.uuid == K then
                return I.label
            end
            end
        return nil
    end
    local function KD(K)
        for Y, I in ipairs(i)
        do
            if I.uuid == K then
                return I.targetLabel or I.label
            end
            end
        return nil
    end
    local function YD(K)
        local Y = {}
        for K, I in ipairs(K or {})
        do
            local L = h(I)
            if L then
                Y[L] = true
            end
            end
        return Y
    end
    local ID
    local LD
    local SD
    local ED
    local jD = false
    local TD = false
    local DD = false
    local BD = false
    local JD = {}
    local WD = D:CreateWindow({Title = "TOMI HUB", Footer = "Age Break | "..e;
    Size = UDim2.fromOffset(720, 600);
    ToggleKeybind = Enum.KeyCode.LeftControl, AutoShow = true, Center = true;
    ShowCustomCursor = false})
    JD.MainTab = WD:AddTab("MAIN", "house")
    JD.AgeTab = WD:AddTab("PET AGE MACHINE", "flame")
    JD.PnPTab = WD:AddTab("PICK & PLACE", "mouse-pointer-click")
    JD.GardenTab = WD:AddTab("AUTO KG BOOST", "sprout")
    JD.PlayerBox = JD.MainTab:AddLeftGroupbox("Player Movement")
    W.StyleGroupboxPanel(JD.PlayerBox)
    do
        local K = 6
        local Y = 550883 + (-550875)
        local I = 2
        local L = (getmetatable(JD.PlayerBox)).__index
        local function S(K, Y)
            local I = K.BuildDropdownList
            local L = K.Menu
            if not ((I and (L and L.Open))) then
                return
            end
            local S = (Y == true)
            K.BuildDropdownList = function (...)
                if L.Active then
                    S = false
                    return I(...)
                end
                S = true
            end
            local E = L.Open
            L.Open = function (K,...)
                if S then
                    S = false I()
                end
                return E(K,...)
            end
            end
        local E = L.AddDropdown
        L.AddDropdown = function (L, j, T)
            local D = nil
            if type(T) == "table" and (type(T.Values) == "table" and (#T.Values > 40 and T.Default == nil)) then
                D = T.Values
                T.Values = {}
            end
            local B = E(L, j, T)
            S(B, D ~= nil)
            if D then
                B.Values = D
                B.DefaultValues = D
            end
            local J = L.Container:GetChildren()
            local W = J[#J]
            if W and W:IsA("Frame") then
                local L = W.Size.Y.Offset > 21
                local S = L and I or 0
                W.Size = UDim2.new(1, 0, 0, (((L and 39 or 21)) + K) + S)
                local E = W:FindFirstChildWhichIsA("TextButton")
                if E then
                    E.Size = UDim2.new(1, 0, 0, 21 + K)
                    if S > 0 then
                        E.Position = E.Position + UDim2.new(0, 0, 0, S)
                    end
                    local I = E:FindFirstChildOfClass("UICorner")
                    if I then
                        I.CornerRadius = UDim.new(0, Y)
                    else
                        local K = Instance.new("UICorner")
                        K.CornerRadius = UDim.new(0, Y)
                        K.Parent = E
                    end
                    local L = E:FindFirstChildWhichIsA("TextButton")
                    if L then
                        L.Size = UDim2.new(1, 0, 0, 21 + K)
                    end
                    E.TextYAlignment = Enum.TextYAlignment.Center
                    for K, Y in ipairs(E:GetDescendants())
                    do
                        if Y:IsA("TextLabel") or Y:IsA("TextButton") then
                            Y.TextYAlignment = Enum.TextYAlignment.Center
                        end
                        end
                    end
                end
            return B
        end
        local j = L.AddInput
        L.AddInput = function (L, S, E)
            local T = j(L, S, E)
            local D = L.Container:GetChildren()
            local B = D[#D]
            if B and B:IsA("Frame") then
                local L = B.Size.Y.Offset > 21
                local S = L and I or -1955006
                B.Size = UDim2.new(1, 0, 0, (((L and 107130517 % (15304354) or 21)) + K) + S)
                local E = B:FindFirstChildWhichIsA("TextBox")
                if E then
                    E.Size = UDim2.new(1, 0, 0, 21 + K)
                    if S > 0 then
                        E.Position = E.Position + UDim2.new(0, 0, 0, S)
                    end
                    E.ClearTextOnFocus = false E.TextScaled = false E.TextSize = 13
                    E.TextYAlignment = Enum.TextYAlignment.Center
                    for K, Y in ipairs(E:GetDescendants())
                    do
                        if Y:IsA("TextLabel") or Y:IsA("TextButton") then
                            Y.TextYAlignment = Enum.TextYAlignment.Center
                        end
                        end
                    local I = E:FindFirstChildOfClass("UICorner")
                    if I then
                        I.CornerRadius = UDim.new(0, Y)
                    else
                        local K = Instance.new("UICorner")
                        K.CornerRadius = UDim.new(0, Y)
                        K.Parent = E
                    end
                    end
                end
            return T
        end
        end
    local MD = false
    local xD = nil JD.PlayerBox:AddToggle("NoclipToggle", {Text = "\240\159\145\187 Noclip";
    Default = false;
    Tooltip = "Walk through walls and objects"})
    local pD = false
    local bD = 50
    local QD = nil
    local zD = nil
    local CD = nil JD.PlayerBox:AddToggle("FlyToggle", {Text = "\240\159\149\138\239\184\143 Fly";
    Default = false, Tooltip = "Toggle flight mode"})
    JD.PlayerBox:AddInput("FlySpeedInput", {Text = "\240\159\149\138\239\184\143 Fly Speed", Default = "50";
    Numeric = true, Placeholder = "50"})
    local function XD()
        local K = j.Character
        if not K then
            return
        end
        local Y = K:FindFirstChild("HumanoidRootPart")
        local I = K:FindFirstChildWhichIsA("Humanoid")
        if not Y or not I then
            return
        end
        I.PlatformStand = true QD = Instance.new("BodyVelocity")
        QD.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        QD.Velocity = Vector3.zero
        QD.Parent = Y
        zD = Instance.new("BodyGyro")
        zD.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        zD.D = 100
        zD.P = 10000
        zD.Parent = Y
        local L = game:GetService("UserInputService")
        CD = (game:GetService("RunService")).RenderStepped:Connect(function ()
            if not pD then
                return
            end
            local K = workspace.CurrentCamera
            local Y = Vector3.zero
            if L:IsKeyDown(Enum.KeyCode.W) then
                Y = Y + K.CFrame.LookVector
            end
            if L:IsKeyDown(Enum.KeyCode.S) then
                Y = Y - K.CFrame.LookVector
            end
            if L:IsKeyDown(Enum.KeyCode.A) then
                Y = Y - K.CFrame.RightVector
            end
            if L:IsKeyDown(Enum.KeyCode.D) then
                Y = Y + K.CFrame.RightVector
            end
            if L:IsKeyDown(Enum.KeyCode.Space) then
                Y = Y + Vector3.new(0, 1, 0)
            end
            if L:IsKeyDown(Enum.KeyCode.LeftShift) then
                Y = Y - Vector3.new(0, 1, 0)
            end
            if Y.Magnitude > 0 then
                QD.Velocity = Y.Unit * bD
            else
                QD.Velocity = Vector3.zero
            end
            zD.CFrame = K.CFrame
        end)
    end
    local function lD()
        if CD then
            CD:Disconnect()
            CD = nil
        end
        if QD then
            QD:Destroy()
            QD = nil
        end
        if zD then
            zD:Destroy()
            zD = nil
        end
        local K = j.Character
        if K then
            local Y = K:FindFirstChildWhichIsA("Humanoid")
            if Y then
                Y.PlatformStand = false
            end
            end
        end
    local function rD()
        xD = (game:GetService("RunService")).Stepped:Connect(function ()
            if not MD then
                return
            end
            local K = j.Character
            if not K then
                return
            end
            for K, Y in pairs(K:GetDescendants())
            do
                if Y:IsA("BasePart") then
                    Y.CanCollide = false
                end
                end
            end)
    end
    local function gD()
        if xD then
            xD:Disconnect()
            xD = nil
        end
        local K = j.Character
        if K then
            for K, Y in pairs(K:GetDescendants())
            do
                if Y:IsA("BasePart") and Y.Name ~= "HumanoidRootPart" then
                    Y.CanCollide = true
                end
                end
            end
        end
    JD.ServerBox = JD.MainTab:AddRightGroupbox("Server Options")
    W.StyleGroupboxPanel(JD.ServerBox)
    W.MakeButtonPanel(JD.ServerBox, "ServerButtonsPanel", {{"\240\159\148\132 Rejoin Server", function ()
        local K = game:GetService("TeleportService")
        local Y = game:GetService("Players")
        local I = Y.LocalPlayer
        local L = game.PlaceId
        local S = game.JobId
        local E = Instance.new("TeleportOptions")
        if game.PrivateServerId ~= "" and game.PrivateServerOwnerId ~= 0 then
            E.ServerInstanceId = game.JobId
        else
            E.ServerInstanceId = S
        end
        D:Notify("\240\159\148\132 Rejoining server...", 3)
        local j, T = pcall(function ()
            K:TeleportAsync(L, {I}, E)
        end)
        if not j then
            warn("[TOMI HUB] Rejoin failed, attempting fallback: "..tostring(T))
            D:Notify("\226\154\160\239\184\143 Retrying with fallback...", 3)
            pcall(function ()
                K:Teleport(L, I)
            end)
        end
        end}})
    JD.UtilStatusBox = JD.MainTab:AddRightGroupbox("Status")
    W.StyleGroupboxPanel(JD.UtilStatusBox)
    JD.UtilStatusBox:AddLabel("NoclipStatus", {Text = "\240\159\145\187 Noclip: Off";
    DoesWrap = true})
    JD.UtilStatusBox:AddLabel("FlyStatus", {Text = "\240\159\149\138\239\184\143 Fly: Off", DoesWrap = true})
    JD.BackpackBox = JD.MainTab:AddLeftGroupbox("\240\159\142\146 Inventory")
    W.StyleGroupboxPanel(JD.BackpackBox)
    JD.BackpackBox:AddLabel("BalanceLabel", {Text = "\240\159\170\153 Tokens: \226\128\148", DoesWrap = true})
    JD.BackpackBox:AddDivider()
    JD.BackpackBox:AddLabel("PetCountLabel", {Text = "\240\159\144\190 Pets: \226\128\148";
    DoesWrap = true})
    JD.BackpackBox:AddLabel("PetBreakdownLabel", {Text = "";
    DoesWrap = true})
    JD.BackpackBox:AddDivider()
    JD.BackpackBox:AddLabel("FruitCountLabel", {Text = "\240\159\141\142 Fruits: \226\128\148";
    DoesWrap = true})
    local function ZD()
        pcall(function ()
            local K = X:GetData()
            local Y = (K.TradeData and K.TradeData.Tokens) or 0
            D.Labels.BalanceLabel:SetText("\240\159\170\153 Tokens: "..V(Y))
            local I = K.PetsData and (K.PetsData.PetInventory and K.PetsData.PetInventory.Data) or {}
            local L = -638056 - (-638056)
            local S = {}
            for K, Y in pairs(I)
            do
                L = L + 1
                local I = tostring(Y.PetType or "Unknown")
                S[I] = ((S[I] or 0)) + (1)
            end
            local E = K.PetsData and (K.PetsData.MutableStats and K.PetsData.MutableStats.MaxPetsInInventory) or "?"
            D.Labels.PetCountLabel:SetText(string.format("\240\159\144\190 Pets: %d / %s", L, tostring(E)))
            local j = {}
            for K, Y in pairs(S)
            do
                table.insert(j, string.format("  %s  %dx", K, Y))
            end
            table.sort(j)
            D.Labels.PetBreakdownLabel:SetText(table.concat(j, "\n"))
            local T = 0
            local B = 0
            local J = K and K.InventoryData
            if type(J) == "table" then
                local K = {}
                for Y, I in pairs(J)
                do
                    if type(I) == "table" and I.ItemType == "Holdable" then
                        T = T + 2563628803 % (10295698)
                        local Y = I.ItemData or {}
                        local L = Y.ItemName or Y.Name or I.ItemName or I.Name
                        if L and not K[L] then
                            K[L] = true B = B + (1)
                        end
                        end
                    end
                end
            D.Labels.FruitCountLabel:SetText(string.format("\240\159\141\142 Fruits: %d (%d types)", T, B))
        end)
    end
    task.spawn(function ()
        task.wait(3)
        ZD()
        while true
        do
            task.wait(5)
            ZD()
        end
        end)
    JD.MainGroup = JD.AgeTab:AddLeftGroupbox("Age Break Machine")
    W.StyleGroupboxPanel(JD.MainGroup)
    local function yD(K)
        local Y = K:gsub("(%d+).([%d%.]+kg)", function (K, Y)
            return "<font color=\"#ffff00\">"..(K..("</font>.<font color=\"#20a7db\">"..(Y.."</font>")))
        end)
        Y = Y:gsub("%[Agebreak%]", "<font color=\"#20a7db\">[Agebreak]</font>")
        return Y
    end
    JD.MainGroup:AddDropdown("TargetPetsDropdown", {Text = "\226\153\187\239\184\143 Pet Targets";
    Values = w, Multi = true;
    AllowNull = true, Searchable = true;
    FormatListValue = function (K)
        return yD(K)
    end})
    JD.MainGroup:AddDivider()
    JD.MainGroup:AddDropdown("DupePetsDropdown", {Text = "\240\159\146\128Duplicates", Values = w, Multi = true, AllowNull = true;
    Searchable = true, FormatListValue = function (K)
        return yD(K)
    end})
    JD.MainGroup:AddDivider()
    JD.MainGroup:AddToggle("BaseWeightLimit", {Text = "\226\154\150\239\184\143 BaseWeight Limit", Default = R.BaseWeightLimit;
    Tooltip = "Ignore dupes with base weight > 3.5"})
    JD.MainGroup:AddToggle("LevelLimit", {Text = "\240\159\143\134 Level Limit", Default = R.LevelLimit, Tooltip = "Ignore dupes with level >= 99"})
    JD.MainGroup:AddDivider()
    JD.MainGroup:AddToggle("SkipToken", {Text = "\240\159\142\171 Skip Token";
    Default = R.SkipToken;
    Tooltip = "Use tokens to skip the age break timer"})
    JD.MainGroup:AddInput("TargetLevelInput", {Text = "\240\159\142\175 Target Lv.", Default = tostring(R.TargetLevel), Numeric = true;
    Finished = true;
    Placeholder = "125";
    Tooltip = "Stop leveling this pet at this level"})
    JD.MainGroup:AddInput("LimitWeightInput", {Text = "\226\154\150\239\184\143 Limit Weight (KG)", Default = tostring(R.LimitWeight), Numeric = true;
    Finished = true;
    Placeholder = "0 = disabled";
    Tooltip = "Move to next pet when true weight reaches this (0 = disabled)"})
    JD.MainGroup:AddDivider()
    JD.MainGroup:AddToggle("EnableAgeBreak", {Text = "\240\159\148\165 Enable Age Break", Default = R.EnableAgeBreak, Tooltip = "Automatically submit, dupe, skip & claim pets"})
    JD.MainGroup:AddToggle("FastAgeBreakToggle", {Text = "\226\154\161 Fast AgeBreak", Default = R.FastAgeBreak or false;
    Tooltip = "After submitting a pet, instantly travels to Trade World and server hops until the machine timer hits 0, then returns to claim automatically."})
    W.MakeButtonPanel(JD.MainGroup, "MainGroupButtonsPanel", {{"\240\159\148\132 Reload", function ()
        ED()
    end}})
    JD.StatusGroup = JD.AgeTab:AddRightGroupbox("Machine Status")
    W.StyleGroupboxPanel(JD.StatusGroup)
    JD.StatusLabel = JD.StatusGroup:AddLabel("StatusLabel", {Text = "\226\143\179 Status: Idle";
    DoesWrap = true})
    JD.PetNameLabel = JD.StatusGroup:AddLabel("PetNameLabel", {Text = "\240\159\144\190 Pet: ---", DoesWrap = true})
    JD.AgeLabel = JD.StatusGroup:AddLabel("AgeLabel", {Text = "\226\173\144 Age: ---", DoesWrap = true})
    JD.WeightLabel = JD.StatusGroup:AddLabel("WeightLabel", {Text = "\226\154\150\239\184\143 Weight: ---", DoesWrap = true})
    JD.TimerLabel = JD.StatusGroup:AddLabel("TimerLabel", {Text = "\226\143\177\239\184\143 Timer: ---", DoesWrap = true})
    JD.StatusGroup:AddDivider()
    JD.MutationLabel = JD.StatusGroup:AddLabel("MutationLabel", {Text = "\240\159\167\172 Mutation: ---", DoesWrap = true})
    JD.BaseWeightLabel = JD.StatusGroup:AddLabel("BaseWeightLabel", {Text = "\240\159\147\139 Base Weight: ---", DoesWrap = true})
    local function qD()
        local K = c()
        if not K then
            D.Labels.StatusLabel:SetText("\226\154\160\239\184\143 Status: Cannot read machine")
            D.Labels.PetNameLabel:SetText("\240\159\144\190 Pet: ---")
            D.Labels.AgeLabel:SetText("\226\173\144 Age: ---")
            D.Labels.WeightLabel:SetText("\226\154\150\239\184\143 Weight: ---")
            D.Labels.TimerLabel:SetText("\226\143\177\239\184\143 Timer: ---")
            D.Labels.MutationLabel:SetText("\240\159\167\172 Mutation: ---")
            D.Labels.BaseWeightLabel:SetText("\240\159\147\139 Base Weight: ---")
            return
        end
        if K.PetReady then
            local Y = K.SubmittedPet
            if Y then
                local K = Y.PetData or {}
                local I = K.Level or (-815962) - (-815962)
                local L = K.BaseWeight or -443334 - (-443334)
                local S = s(L, I)
                local E = t(K)
                D.Labels.StatusLabel:SetText("\226\156\133 Status: READY TO CLAIM")
                D.Labels.PetNameLabel:SetText("\240\159\144\190 Pet: "..((Y.PetType or "Unknown")))
                D.Labels.AgeLabel:SetText("\226\173\144 Age: "..I)
                D.Labels.WeightLabel:SetText("\226\154\150\239\184\143 True Weight: "..string.format("%.2f kg", S))
                D.Labels.TimerLabel:SetText("\226\143\177\239\184\143 Timer: Complete!")
                D.Labels.MutationLabel:SetText("\240\159\167\172 Mutation: "..E)
                D.Labels.BaseWeightLabel:SetText("\240\159\147\139 Base Weight: "..string.format("%.2f kg", L))
            else
                D.Labels.StatusLabel:SetText("\226\156\133 Status: READY TO CLAIM")
            end
            elseif K.IsRunning and (K.TimeLeft and K.TimeLeft > 0) then
            local Y = K.SubmittedPet
            if Y then
                local I = Y.PetData or {}
                local L = I.Level or (-213236) + 213236
                local S = I.BaseWeight or 0
                local E = s(S, L)
                local j = t(I)
                local T = math.floor(K.TimeLeft / 60)
                local B = K.TimeLeft % (60)
                D.Labels.StatusLabel:SetText("\226\143\179 Status: RUNNING")
                D.Labels.PetNameLabel:SetText("\240\159\144\190 Pet: "..((Y.PetType or "Unknown")))
                D.Labels.AgeLabel:SetText("\226\173\144 Age: "..L)
                D.Labels.WeightLabel:SetText("\226\154\150\239\184\143 True Weight: "..string.format("%.2f kg", E))
                D.Labels.TimerLabel:SetText("\226\143\177\239\184\143 Timer: "..string.format("%dm %ds", T, B))
                D.Labels.MutationLabel:SetText("\240\159\167\172 Mutation: "..j)
                D.Labels.BaseWeightLabel:SetText("\240\159\147\139 Base Weight: "..string.format("%.2f kg", S))
            end
            elseif K.SubmittedPet and not K.IsRunning then
            local Y = K.SubmittedPet
            local I = Y.PetData or {}
            local L = I.Level or (-1020829) + 1020829
            local S = I.BaseWeight or -1290000
            local E = s(S, L)
            local j = t(I)
            D.Labels.StatusLabel:SetText("\240\159\148\132 Status: WAITING FOR DUPE")
            D.Labels.PetNameLabel:SetText("\240\159\144\190 Pet: "..((Y.PetType or "Unknown")))
            D.Labels.AgeLabel:SetText("\226\173\144 Age: "..L)
            D.Labels.WeightLabel:SetText("\226\154\150\239\184\143 True Weight: "..string.format("%.2f kg", E))
            D.Labels.TimerLabel:SetText("\226\143\177\239\184\143 Timer: ---")
            D.Labels.MutationLabel:SetText("\240\159\167\172 Mutation: "..j)
            D.Labels.BaseWeightLabel:SetText("\240\159\147\139 Base Weight: "..string.format("%.2f kg", S))
        else
            D.Labels.StatusLabel:SetText("\226\143\184\239\184\143 Status: Idle")
            D.Labels.PetNameLabel:SetText("\240\159\144\190 Pet: ---")
            D.Labels.AgeLabel:SetText("\226\173\144 Age: ---")
            D.Labels.WeightLabel:SetText("\226\154\150\239\184\143 Weight: ---")
            D.Labels.TimerLabel:SetText("\226\143\177\239\184\143 Timer: ---")
            D.Labels.MutationLabel:SetText("\240\159\167\172 Mutation: ---")
            D.Labels.BaseWeightLabel:SetText("\240\159\147\139 Base Weight: ---")
        end
        end
    task.spawn(function ()
        task.wait(1)
        qD()
    end)
    task.spawn(function ()
        while task.wait(2)
        do
            qD()
        end
        end)
    M.EquippedEntries = {}
    M.SeenUUID = {}
    function M.BuildLabel(K, Y)
        Y = Y or O(K)
        local I = (Y and Y.PetData) or {}
        local L = (Y and Y.PetType) or "Unknown"
        local S = I.Level or 933602645 % (5590435)
        local E = s(I.BaseWeight or -439400, S)
        local j = t(I)
        local T = string.upper(string.sub(j, 1, 2))
        local D = I.IsFavorite and "\226\157\164\239\184\143" or ""
        local B = (S >= 100) and "\226\173\144" or ""
        return string.format("%s%s%d.%.2fkg [%s]%s {%s}", D, B, S, E, T, L, string.sub(tostring(K), 1, 6))
    end
    function M.EnsureEntry(K)
        if not M.SeenUUID[K] then
            M.EquippedEntries[#M.EquippedEntries + 1] = {label = M.BuildLabel(K);
            uuid = K}
            M.SeenUUID[K] = #M.EquippedEntries
        end
        return M.EquippedEntries[M.SeenUUID[K]].label
    end
    function M.LabelForUUID(K)
        local Y = M.SeenUUID[K]
        return Y and M.EquippedEntries[Y].label or nil
    end
    function M.GetEquippedUUIDs()
        local K, Y = {}, {}
        local I = pcall(function ()
            local I = X:GetData()
            local L = I and I.PetsData
            if L and L.EquippedPets then
                for I, L in ipairs(L.EquippedPets)
                do
                    local S = tostring(L)
                    if not Y[S] then
                        Y[S] = true K[#K + 1] = S
                    end
                    end
                end
            end)
        if not I or #K == 0 then
            local I = j.Character
            if I then
                for I, L in ipairs(I:GetChildren())
                do
                    if L:IsA("Tool") then
                        local I = L:GetAttribute("PET_UUID")
                        if I and not Y[I] then
                            Y[I] = true K[#K + 1] = I
                        end
                        end
                    end
                end
            end
        return K
    end
    function M.MergeEquipped()
        for K, Y in ipairs(M.GetEquippedUUIDs())
        do
            M.EnsureEntry(Y)
        end
        local K = {}
        for Y, I in ipairs(M.EquippedEntries)
        do
            K[#K + 1] = I.label
        end
        return K
    end
    function M.Scan()
        local K = M.MergeEquipped()
        pcall(function ()
            local Y = D.Options.PnPPetMultiSelect
            local I = Y and Y.Value
            Y:SetValues(K)
            if type(I) == "table" then
                Y:SetValue(I)
            end
            end)
        if M.RefreshStatus then
            M.RefreshStatus()
        end
        D:Notify("\240\159\148\141 Scanned "..(#K.." equipped pet(s)"), 3)
    end
    JD.PnPBox = JD.PnPTab:AddLeftGroupbox("Pick & Place")
    W.StyleGroupboxPanel(JD.PnPBox)
    JD.PnPBox:AddLabel("PnPRunningLabel", {Text = "\240\159\148\180 Pick & Place: Inactive", DoesWrap = true})
    JD.PnPBox:AddDivider()
    local FD = {}
    if type(R.PnPPets) == "table" then
        for K, Y in ipairs(R.PnPPets)
        do
            local I = M.EnsureEntry(tostring(Y))
            if I then
                table.insert(FD, I)
            end
            end
        end
    local ND = M.MergeEquipped()
    JD.PnPBox:AddDropdown("PnPPetMultiSelect", {Text = "\240\159\144\190 Select Pets";
    Values = ND, Default = FD;
    Multi = true;
    AllowNull = true, Searchable = true, Tooltip = "Currently equipped pets. Click Scan Equipped Pets to refresh; unequipped pets stay listed so you don\'t have to re-pick them."})
    JD.PnPBox:AddDivider()
    JD.PnPBox:AddInput("PnPPetTimerInput", {Text = "\226\143\177\239\184\143 Pet Timer (seconds)", Default = tostring(R.PnPPetTimer or 746), Numeric = true;
    Finished = true;
    Placeholder = "0.1";
    Tooltip = "When the pet\'s live cooldown matches this value, the cycle fires."})
    JD.PnPBox:AddInput("PnPDelayUnequipInput", {Text = "\226\172\134\239\184\143 Delay Before Unequip (s)", Default = tostring(R.PnPDelayUnequip or 0.5);
    Numeric = true;
    Finished = true;
    Placeholder = "0.5", Tooltip = "Wait this many seconds before firing UnequipPet."})
    JD.PnPBox:AddInput("PnPDelayEquipInput", {Text = "\226\172\135\239\184\143 Delay Before Equip (s)";
    Default = tostring(R.PnPDelayEquip or 0.5);
    Numeric = true;
    Finished = true, Placeholder = "0.5", Tooltip = "Wait this many seconds before firing EquipPet."})
    JD.PnPBox:AddDivider()
    JD.PnPBox:AddToggle("PnPUseThreadingToggle", {Text = "\226\156\168 Multi Pets Listener", Default = R.PnPUseThreading ~= false, Tooltip = "ON: each pet runs its own independent thread -- all pets cycle at the same time with no blocking. OFF: pets are processed one by one sequentially -- if one takes too long, others may miss their window."})
    JD.PnPBox:AddToggle("EnablePetPnPToggle", {Text = "\226\154\161 Enable Pick & Place", Default = R.EnablePetPnP or false, Tooltip = "Automatically unequips and re-equips selected pets on their cooldown timer."})
    W.MakeButtonPanel(JD.PnPBox, "PnPButtonsPanel", {{"\240\159\148\141 Scan Equipped Pets";
    function ()
        M.Scan()
    end}, {"\240\159\148\132 Reload", function ()
        ED()
    end}})
    local GD = false
    local aD = {}
    local VD = {}
    local sD = {}
    local kD = nil
    local eD = {}
    local uD = {}
    local RD = {}
    local dD = {}
    local function AD()
        aD = {}
        local K = D.Options.PnPPetMultiSelect and D.Options.PnPPetMultiSelect.Value or {}
        if type(K) == "table" then
            for K, Y in pairs(K)
            do
                if Y then
                    local Y
                    for I, L in ipairs(M.EquippedEntries)
                    do
                        if L.label == K then
                            Y = L.uuid
                            break
                        end
                        end
                    if not Y then
                        for I, L in ipairs(i)
                        do
                            if L.label == K then
                                Y = L.uuid
                                break
                            end
                            end
                        end
                    if Y then
                        aD[Y] = true
                    end
                    end
                end
            end
        end
    local function nD(K)
        pcall(function ()
            local K
            if not GD then
                K = "\240\159\148\180 Pick & Place: Inactive"
            else
                local Y = 0
                for K in pairs(sD)
                do
                    Y = Y + 1
                end
                if Y > 0 then
                    K = string.format("\240\159\159\162 Pick & Place: Active -- %d pet thread(s) running", Y)
                else
                    K = "\240\159\159\162 Pick & Place: Active"
                end
                end
            D.Labels.PnPRunningLabel:SetText(K)
        end)
    end
    JD.PnPStatusBox = JD.PnPTab:AddRightGroupbox("Equipped Pets Status")
    W.StyleGroupboxPanel(JD.PnPStatusBox)
    do
        local K = Instance.new("Frame")
        K.BackgroundTransparency = 1
        K.BorderSizePixel = 0
        K.Size = UDim2.new(1, 0, 0, 0)
        local Y = Instance.new("UIListLayout")
        Y.FillDirection = Enum.FillDirection.Vertical
        Y.HorizontalAlignment = Enum.HorizontalAlignment.Center
        Y.SortOrder = Enum.SortOrder.LayoutOrder
        Y.Padding = UDim.new(0, 6)
        Y.Parent = K
        JD.PnPStatusBox:AddUIPassthrough("PnPStatusCards", {Instance = K, Height = 1})
        local I = Color3.fromRGB(32, 32, 32)
        local L = D.Scheme.OutlineColor
        local S = Color3.fromRGB(165, 165, 165)
        local E = Color3.fromRGB(165, 165, 165)
        local function j()
            task.defer(function ()
                pcall(function ()
                    local I = Y.AbsoluteContentSize.Y
                    K.Size = UDim2.new(1, 0, 0, I)
                    if K.Parent and K.Parent:IsA("Frame") then
                        K.Parent.Size = UDim2.new(1, 0, 0, I)
                    end
                    if JD.PnPStatusBox.Resize then
                        JD.PnPStatusBox:Resize()
                    end
                    end)
            end)
        end
        local function T(K, Y, I, L, S)
            local E = Instance.new("TextLabel")
            E.BackgroundTransparency = 1
            E.Size = UDim2.new(1, 0, 0, I + 2)
            E.Position = UDim2.fromOffset(0, Y)
            E.FontFace = D.Scheme.Font
            E.TextSize = I
            E.TextColor3 = L
            E.TextXAlignment = Enum.TextXAlignment.Left
            E.TextTruncate = Enum.TextTruncate.AtEnd
            E.Text = S
            E.Parent = K
            return E
        end
        local B = {}
        local J = {}
        local W = 0
        local x = nil
        local function p(Y, j)
            local D = B[Y]
            if D then
                D.Frame.LayoutOrder = j
                return D
            end
            local J = Instance.new("TextButton")
            J.Name = "EquippedPetCard_"..tostring(Y)
            J.LayoutOrder = j
            J.BorderSizePixel = -855245 - (-855245)
            J.BackgroundColor3 = I
            J.Size = UDim2.new(1, 0, 0, 0)
            J.AutomaticSize = Enum.AutomaticSize.Y
            J.AutoButtonColor = false J.Text = ""
            J.Parent = K
            local W = Instance.new("UICorner")
            W.CornerRadius = UDim.new(0, 6)
            W.Parent = J
            local M = Instance.new("UIStroke")
            M.Color = L
            M.Thickness = 1
            M.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            M.Parent = J
            local x = Instance.new("UIPadding")
            x.PaddingTop = UDim.new(0, 8)
            x.PaddingBottom = UDim.new(0, 8)
            x.PaddingLeft = UDim.new(0, 8)
            x.PaddingRight = UDim.new(0, 8)
            x.Parent = J
            J.MouseEnter:Connect(function ()
                J.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
            end)
            J.MouseLeave:Connect(function ()
                J.BackgroundColor3 = I
            end)
            local p = Instance.new("Frame")
            p.BackgroundTransparency = -417441 - (-417442)
            p.BorderSizePixel = -146997 - (-146997)
            p.Size = UDim2.new(1, 0, 0, 58)
            p.Parent = J
            local b = T(p, 0, 12, S, "")
            local Q = T(p, 16, 12, E, "")
            local z = T(p, 30, 12, E, "")
            local C = T(p, 44, 12, E, "")
            D = {Frame = J, NameLine = b, StatsLine = Q;
            MutationLine = z, StatusLine = C}
            B[Y] = D
            return D
        end
        local function b(K, Y)
            local I = O(Y)
            local L = (I and I.PetData) or {}
            local S = (I and I.PetType) or "Unknown"
            local E = L.Level or 153645837 % (2695541)
            local j = s(L.BaseWeight or -961628, E)
            local T = t(L)
            local D = GD and uD[Y] or nil
            local B, J
            if D == "idle" then
                B = "\226\143\184\239\184\143 Idle"
                J = Color3.fromRGB(165, 165, 165)
            elseif D == "waiting" then
                B = "\226\143\179 Waiting for cooldown"
                J = Color3.fromRGB(240, 200, 80)
            elseif D == "unequipping" then
                B = "\226\172\134\239\184\143 Unequipping..."
                J = Color3.fromRGB(240, 170, 90)
            elseif D == "equipping" then
                B = "\226\172\135\239\184\143 Equipping..."
                J = Color3.fromRGB(100, 180, 240)
            else
                B = GD and "\240\159\159\162 Selected" or "\226\143\184\239\184\143 Idle"
                J = GD and Color3.fromRGB(120, 200, 130) or Color3.fromRGB(165, 165, 165)
            end
            local W = p(Y, K)
            W.NameLine.Text = string.format("%d. %s", K, S)
            W.StatsLine.Text = string.format("Level: %d \194\183 %.2fkg", E, j)
            W.MutationLine.Text = "Mutation: "..T
            W.StatusLine.TextColor3 = J
            W.StatusLine.Text = "Status: "..B
            W.Frame.Visible = true
        end
        function M.RefreshStatus()
            pcall(function ()
                local Y = M.GetEquippedUUIDs()
                local I = {}
                for K, Y in ipairs(Y)
                do
                    I[Y] = true
                    if not J[Y] then
                        W = W + (1)
                        J[Y] = W
                    end
                    end
                if #Y == 0 then
                    for K, Y in pairs(B)
                    do
                        Y.Frame.Visible = false
                    end
                    if not x then
                        x = T(K, 0, 13, E, "No equipped pets -- click Scan.")
                        x.Size = UDim2.new(1, 0, 0, 22)
                    end
                    x.Visible = true
                else
                    if x then
                        x.Visible = false
                    end
                    for K in pairs(I)
                    do
                        b(J[K], K)
                    end
                    for K, Y in pairs(B)
                    do
                        if not I[K] then
                            Y.Frame.Visible = false
                        end
                        end
                    end
                j()
            end)
        end
        task.spawn(function ()
            while true
            do
                M.RefreshStatus()
                task.wait(0.2)
            end
            end)
    end
    local function wD(...)
        for K in next, eD
        do
            eD[K] = nil
        end
        local K = select("#",...)
        if K >= 2 then
            local K = select(2,...)
            if type(K) == "table" then
                local Y = tostring(select(1,...))
                local I = math.huge
                for K, Y in ipairs(K)
                do
                    local L = tonumber(Y.Time or Y.Cooldown or Y.TimeLeft)
                    if L and L < I then
                        I = L
                    end
                    end
                if I ~= math.huge then
                    eD[Y] = I
                end
                return eD
            end
            end
        if K == 1 then
            local K = select(1,...)
            if type(K) == "table" then
                local Y = next(K)
                if type(Y) == "number" then
                    for K, Y in ipairs(K)
                    do
                        if type(Y) == "table" then
                            local K = tostring(Y.UUID or Y.PetUUID or Y.Id or "")
                            local I = tonumber(Y.Time or Y.Cooldown or Y.TimeLeft)
                            if K ~= "" and I then
                                eD[K] = I
                            end
                            end
                        end
                    else
                    for K, Y in pairs(K)
                    do
                        local I = type(Y) == "table" and tonumber(Y.Time or Y.Cooldown or Y.TimeLeft) or (type(Y) == "number" and Y or nil)
                        if I then
                            eD[tostring(K)] = I
                        end
                        end
                    end
                end
            end
        return eD
    end
    local iD = {}
    local oD = nil
    local function tD()
        while GD
        do
            local K = table.remove(iD, 1)
            if K then
                local Y = tonumber(R.PnPDelayUnequip) or 0.5
                local I = tonumber(R.PnPDelayEquip) or 0.5
                pcall(function ()
                    uD[K] = "waiting"
                    if M.RefreshStatus then
                        M.RefreshStatus()
                    end
                    nD("\226\172\134\239\184\143 PnP: Unequip "..(string.sub(K, 1, 6).."..."))
                    if Y > (-442704) - (-442704) then
                        task.wait(Y)
                    end
                    uD[K] = "unequipping"
                    if M.RefreshStatus then
                        M.RefreshStatus()
                    end
                    F:FireServer("UnequipPet", K)
                    uD[K] = "equipping"
                    if M.RefreshStatus then
                        M.RefreshStatus()
                    end
                    nD("\226\172\135\239\184\143 PnP: Equip "..(string.sub(K, 1, 6).."..."))
                    if I > 0 then
                        task.wait(I)
                    end
                    local L = j.Character
                    local S = L and L:FindFirstChild("HumanoidRootPart")
                    F:FireServer("EquipPet", K, S and S.CFrame or CFrame.new(0, 0, 0))
                    uD[K] = nil
                    if M.RefreshStatus then
                        M.RefreshStatus()
                    end
                    nD("\226\154\161 PnP: Active -- waiting for cooldown")
                end)
                task.wait(0.05)
            else
                task.wait(0.05)
            end
            end
        end
    local function UD(K, Y)
        local I = task.spawn(function ()
            while GD and R.EnablePetPnP
            do
                local I = Y.Event:Wait()
                if not ((GD and R.EnablePetPnP)) then
                    break
                end
                uD[K] = "idle"
                if M.RefreshStatus then
                    M.RefreshStatus()
                end
                table.insert(iD, K)
            end
            end)
        return I
    end
    local function vD(...)
        if not ((GD and R.EnablePetPnP)) then
            return
        end
        local K = wD(...)
        local Y = tonumber(R.PnPPetTimer) or 746
        for I, L in next, VD
        do
            local S = K[I]
            if S then
                local K = RD[I]
                if S > Y then
                    dD[I] = nil
                end
                if K and (K > Y and S <= Y) then
                    if not dD[I] then
                        dD[I] = true L:Fire(S)
                    end
                    end
                RD[I] = S
            end
            end
        end
    local function cD()
        GD = false
        if kD then
            pcall(function ()
                kD:Disconnect()
            end)
            kD = nil
        end
        for K, Y in next, sD
        do
            pcall(task.cancel, Y)
            sD[K] = nil
        end
        for K, Y in next, VD
        do
            pcall(function ()
                Y:Destroy()
            end)
            VD[K] = nil
        end
        AD()
        if next(aD) == nil then
            nD("\226\154\160\239\184\143 PnP: No pets selected")
            return
        end
        GD = true
        for K in next, RD
        do
            RD[K] = nil
        end
        for K in next, dD
        do
            dD[K] = nil
        end
        for K in next, uD
        do
            uD[K] = nil
        end
        while #iD > 0
        do
            table.remove(iD)
        end
        local K = 0
        for Y in next, aD
        do
            local I = Instance.new("BindableEvent")
            VD[Y] = I
            sD[Y] = UD(Y, I)
            K = K + (1)
        end
        oD = task.spawn(tD)
        kD = N.OnClientEvent:Connect(vD)
        nD("\226\154\161 PnP: Active -- "..(K.." pet thread(s) running"))
    end
    local function HD()
        GD = false
        if kD then
            pcall(function ()
                kD:Disconnect()
            end)
            kD = nil
        end
        if oD then
            pcall(task.cancel, oD)
            oD = nil
        end
        while #iD > 0
        do
            table.remove(iD)
        end
        for K, Y in next, sD
        do
            pcall(task.cancel, Y)
            sD[K] = nil
        end
        for K, Y in next, VD
        do
            pcall(function ()
                Y:Fire(0)
            end)
            task.defer(function ()
                pcall(function ()
                    Y:Destroy()
                end)
            end)
            VD[K] = nil
        end
        nD("\226\143\184\239\184\143 PnP: Off")
        for K in next, uD
        do
            uD[K] = nil
        end
        end
    local PD = nil
    local function mD()
        GD = true PD = task.spawn(function ()
            nD("\226\154\161 PnP (Seq): Active -- watching cooldowns")
            local K = {}
            local Y = N.OnClientEvent:Connect(function (...)
                local Y = wD(...)
                for Y, I in next, Y
                do
                    K[Y] = I
                end
                end)
            local I = tonumber(R.PnPPetTimer) or 746
            local L = {}
            local S = {}
            while GD and R.EnablePetPnP
            do
                I = tonumber(R.PnPPetTimer) or -239769 - (-240515)
                for Y in next, aD
                do
                    if not ((GD and R.EnablePetPnP)) then
                        break
                    end
                    local E = K[Y]
                    if E then
                        local K = S[Y]
                        if E > I then
                            L[Y] = nil
                        end
                        if K and (K > I and E <= I) then
                            if not L[Y] then
                                L[Y] = true
                                local K = tonumber(R.PnPDelayUnequip) or 279783655 % (5709870.5)
                                local I = tonumber(R.PnPDelayEquip) or 0.5
                                local S, E = pcall(function ()
                                    nD("\226\172\134\239\184\143 PnP (Seq): Unequip "..(string.sub(Y, 1, 6).."..."))
                                    if K > 0 then
                                        task.wait(K)
                                    end
                                    F:FireServer("UnequipPet", Y)
                                    nD("\226\172\135\239\184\143 PnP (Seq): Equip "..(string.sub(Y, 1, 6).."..."))
                                    if I > 0 then
                                        task.wait(I)
                                    end
                                    local L = j.Character
                                    local S = L and L:FindFirstChild("HumanoidRootPart")
                                    F:FireServer("EquipPet", Y, S and S.CFrame or CFrame.new(0, 0, 0))
                                end)
                                L[Y] = nil
                                if not S then
                                    warn("[PnP Seq] Cycle error uuid="..(string.sub(Y, 1, 8)..(": "..tostring(E))))
                                end
                                nD("\226\154\161 PnP (Seq): Active -- watching cooldowns")
                            end
                            end
                        S[Y] = E
                    end
                    end
                task.wait(0.5)
            end
            pcall(function ()
                Y:Disconnect()
            end)
            nD("\226\143\184\239\184\143 PnP: Off")
        end)
    end
    local function OD()
        GD = false
        if PD then
            pcall(task.cancel, PD)
            PD = nil
        end
        nD("\226\143\184\239\184\143 PnP: Off")
    end
    JD.TradeTab = WD:AddTab("TRADE WORLD", "globe")
    JD.TradeGroup = JD.TradeTab:AddLeftGroupbox("Trade World Travel")
    W.StyleGroupboxPanel(JD.TradeGroup)
    local fD = false
    local hD = false JD.TradeGroup:AddLabel("TradeWorldInfo", {Text = "\240\159\140\141 Auto-travel to the Trade World. When enabled, you will be teleported after a short delay.", DoesWrap = true})
    JD.TradeGroup:AddDivider()
    JD.TradeGroup:AddToggle("AutoTradeWorld", {Text = "\240\159\148\132 Auto Travel to Trade World";
    Default = R.AutoTradeWorld;
    Tooltip = "Automatically teleport to Trade World after a 15 second delay"})
    JD.TradeGroup:AddDivider()
    W.MakeButtonPanel(JD.TradeGroup, "TradeGroupButtonsPanel", {{"\226\154\161 Force Travel Now", function ()
        if not G then
            D:Notify("\226\157\140 Trade World remote not found!", 3)
            return
        end
        if workspace:FindFirstChild("TradeWorld") then
            D:Notify("\226\156\133 Already in Trade World!", 3)
            return
        end
        D:Notify("\240\159\140\141 Teleporting to Trade World...", 3)
        local K, Y = pcall(function ()
            G:FireServer()
        end)
        if K then
            local K = workspace:WaitForChild("TradeWorld", 30)
            if K then
                D:Notify("\226\156\133 Arrived in Trade World!", 3)
            else
                D:Notify("\226\154\160\239\184\143 Travel timed out. Try again.", 5)
                warn("[TOMI HUB] Trade World did not appear after 30s")
            end
            else
            D:Notify("\226\157\140 Travel failed: "..tostring(Y), 5)
            warn("[TOMI HUB] Trade World travel error: "..tostring(Y))
        end
        end}})
    JD.TradeStatusGroup = JD.TradeTab:AddRightGroupbox("Status")
    W.StyleGroupboxPanel(JD.TradeStatusGroup)
    JD.TradeStatusGroup:AddLabel("TradeWorldStatus", {Text = workspace:FindFirstChild("TradeWorld") and "\240\159\159\162 Currently in Trade World" or "\240\159\148\180 Not in Trade World";
    DoesWrap = true})
    JD.TradeStatusGroup:AddDivider()
    JD.TradeStatusGroup:AddLabel("TradeAutoStatus", {Text = "\226\143\184\239\184\143 Auto-Travel: Off", DoesWrap = true})
    local Kw = l:WaitForChild("TradeEvents")
    local Yw = Kw:WaitForChild("SendRequest")
    local Iw = Kw:WaitForChild("RespondRequest")
    local Lw = Kw:WaitForChild("AddItem")
    local Sw = Kw:WaitForChild("Accept")
    local Ew = Kw:WaitForChild("Confirm")
    local jw = require(L.Data.TradeData)
    local function Tw()
        local K = E.LocalPlayer:FindFirstChild("PlayerGui")
        if not K then
            return true
        end
        local Y = K:FindFirstChild("TradeItemHover")
        if not Y then
            return true
        end
        local I = Y:FindFirstChild("CanvasGroup", true)
        if not I then
            return true
        end
        local L = I:FindFirstChild("Main", true)
        if not L then
            return true
        end
        local S = L:FindFirstChild("Item", true)
        if not S then
            return true
        end
        local j = S:FindFirstChild("Container", true)
        if not j then
            return true
        end
        local T = #j:GetChildren()
        return T < jw.ItemLimit
    end
    local function Dw()
        local K = j.Character
        if K then
            for K, Y in ipairs(K:GetChildren())
            do
                if Y:IsA("Tool") and ((string.find(string.lower(Y.Name), "ticket") or string.find(Y.Name, "Trading Ticket"))) then
                    return true
                end
                end
            end
        local Y = j:FindFirstChild("Backpack")
        if not Y then
            warn("[Trading] No Backpack found - cannot equip ticket")
            return false
        end
        for Y, I in ipairs(Y:GetChildren())
        do
            if I:IsA("Tool") then
                if string.find(string.lower(I.Name), "ticket") or string.find(I.Name, "Trading Ticket") then
                    local Y = pcall(function ()
                        I:Equip()
                    end)
                    if not Y then
                        if K then
                            I.Parent = K
                        end
                        end
                    return true
                end
                end
            end
        warn("[Trading] No Trading Ticket found in Backpack or Character")
        return false
    end
    local Bw = Kw:WaitForChild("UpdateTradeState")
    local Jw = l:WaitForChild("DataStream2")
    local Ww = nil pcall(function ()
        Ww = require(L:WaitForChild("Calculate_Weight", 5))
    end)
    if not Ww then
        pcall(function ()
            for K, Y in ipairs(L:GetDescendants())
            do
                if Y.Name == "Calculate_Weight" and Y:IsA("ModuleScript") then
                    Ww = require(Y)
                    break
                end
                end
            end)
    end
    local function Mw(K, Y, I)
        I = I or 5
        local L = tick()
        local S = K:FindFirstChild(Y)
        while not S and tick() - L < I
        do
            task.wait(0.25)
            S = K:FindFirstChild(Y)
        end
        return S
    end
    local xw = {}
    pcall(function ()
        local K = Mw(L, "Data", 5)
        if not K then
            return
        end
        local Y = Mw(K, "PetRegistry", 5)
        if not Y then
            return
        end
        local I = Mw(Y, "PetList", 5)
        if not I then
            return
        end
        if I:IsA("ModuleScript") then
            local K, Y = pcall(require, I)
            if K and type(Y) == "table" then
                for K, Y in pairs(Y)
                do
                    if type(K) == "string" then
                        table.insert(xw, K)
                    end
                    end
                end
            elseif I:IsA("Folder") then
            for K, Y in pairs(I:GetChildren())
            do
                table.insert(xw, Y.Name)
            end
            end
        end)
    table.sort(xw)
    local pw = {}
    local bw = {}
    local Qw = {}
    local zw = {}
    local Cw
    local function Xw(K, Y)
        local I = Cw(Y, K)
        return #I
    end
    local function lw()
        pw = {}
        bw = {}
        Qw = {}
        zw = {}
        pcall(function ()
            local K = X:GetData()
            if not K or not K.PetsData or not K.PetsData.PetInventory then
                return
            end
            local Y = K.PetsData.PetInventory.Data
            local I = (K.TradeData and (K.TradeData.TradeLocks and K.TradeData.TradeLocks.Pet)) or {}
            if xw and #xw > 0 then
                for K, Y in ipairs(xw)
                do
                    table.insert(Qw, Y)
                end
                end
            local L = {}
            for K, Y in pairs(Y)
            do
                local S = tostring(Y.PetType or "Unknown")
                local E = Y.PetData or {}
                local j = E.Level or E.Age or E.PetAge or E.AgeLevel or -310327 - (-310327)
                local T = E.BaseWeight or -1040406 - (-1040406)
                local D = T + ((T * 0.1) * math.max(1, j))
                D = math.floor(D * 100.5) / (100)
                if not L[S] then
                    L[S] = true
                    if not xw or #xw == -581450 - (-581450) then
                        table.insert(Qw, S)
                    end
                    end
                if not pw[S] then
                    pw[S] = {}
                end
                table.insert(pw[S], {uuid = tostring(K);
                weight = D;
                age = tonumber(j) or (-10113) - -10113, isFav = E.IsFavorite == true or Y.IsFavorite == true, isLocked = E.IsLocked == true or I[K] ~= nil})
            end
            if not xw or #xw == 0 then
                table.sort(Qw)
            end
            end)
        pcall(function ()
            local K = X:GetData()
            local Y = K and K.InventoryData
            if type(Y) ~= "table" then
                warn("[Trading] InventoryData not found -- holdable list will be empty")
                return
            end
            local I = (K.TradeData and (K.TradeData.TradeLocks and K.TradeData.TradeLocks.Holdable)) or {}
            local L = {}
            local S, E = 0, 0
            for K, Y in pairs(Y)
            do
                if type(Y) == "table" and Y.ItemType == "Holdable" then
                    local j = Y.ItemData or {}
                    local T = j.ItemName or j.Name or Y.ItemName or Y.Name
                    if T then
                        local D = nil pcall(function ()
                            if Ww and j.Seed then
                                local K = Ww.Calculate_Weight(j.Seed, T)
                                D = ((tonumber(K) or 0)) * ((tonumber(j.WeightMultiplier) or 1))
                            end
                            end)
                        if not D then
                            D = tonumber(j.TrueWeight or j.Weight or j.ItemWeight)
                        end
                        if D then
                            S = S + (1)
                        else
                            E = E + 2087408674 % (14200059)
                            D = -1
                        end
                        if not L[T] then
                            L[T] = true table.insert(zw, T)
                            bw[T] = {}
                        end
                        table.insert(bw[T], {uuid = tostring(K), weight = D;
                        isFav = j.IsFavorite == true or Y.IsFavorite == true, isLocked = j.IsLocked == true or I[K] ~= nil})
                    end
                    end
                end
            table.sort(zw)
        end)
        if #Qw == 0 then
            table.insert(Qw, "No Pets Found")
        end
        if #zw == 0 then
            table.insert(zw, "No Holdables Found")
        end
        end
    local rw = {}
    local function gw()
        table.clear(rw)
        for K, Y in ipairs(E:GetPlayers())
        do
            if Y ~= j then
                table.insert(rw, Y.Name)
            end
            end
        if #rw == -985558 - (-985558) then
            table.insert(rw, "No Players Found")
        end
        end
    SD = function ()
        n = false v()
        task.wait()
        local K = {}
        for Y, I in ipairs(i)
        do
            K[I.uuid] = true
        end
        local Y = {}
        for I, L in ipairs(R.TargetPetUUIDs)
        do
            if K[L] then
                table.insert(Y, L)
            end
            end
        R.TargetPetUUIDs = Y
        local I = {}
        for Y, L in ipairs(R.DupePetUUIDs)
        do
            if K[L] then
                table.insert(I, L)
            end
            end
        R.DupePetUUIDs = I
        local L = {}
        for Y, I in ipairs(R.GardenTargetPetUUIDs)
        do
            if K[I] then
                table.insert(L, I)
            end
            end
        R.GardenTargetPetUUIDs = L
        local S = {}
        for Y, I in ipairs(R.GardenAgeTeamUUIDs)
        do
            if K[I] then
                table.insert(S, I)
            end
            end
        R.GardenAgeTeamUUIDs = S
        local E = {}
        for Y, I in ipairs(R.GardenElephantUUIDs)
        do
            if K[I] then
                table.insert(E, I)
            end
            end
        R.GardenElephantUUIDs = E
        local j = {}
        for Y, I in ipairs(R.GardenMaxTeamUUIDs)
        do
            if K[I] then
                table.insert(j, I)
            end
            end
        R.GardenMaxTeamUUIDs = j
        d()
        TD = true ID()
        TD = false n = true pcall(function ()
            local K = D.Options.PnPPetMultiSelect
            if type(R.PnPPets) == "table" then
                for K, Y in ipairs(R.PnPPets)
                do
                    M.EnsureEntry(tostring(Y))
                end
                end
            K:SetValues(M.MergeEquipped())
            if type(R.PnPPets) == "table" and #R.PnPPets > 0 then
                local Y = {}
                for K, I in ipairs(R.PnPPets)
                do
                    local L = M.LabelForUUID(tostring(I))
                    if L then
                        Y[L] = true
                    end
                    end
                if next(Y) then
                    K:SetValue(Y)
                end
                end
            if M.RefreshStatus then
                M.RefreshStatus()
            end
            end)
        lw()
        task.wait()
        local T = {}
        for K, Y in ipairs(Qw)
        do
            T[Y] = true
        end
        local B = {}
        for K, Y in ipairs(R.SelectedItemNames)
        do
            if T[Y] then
                table.insert(B, Y)
            end
            end
        R.SelectedItemNames = B
        if R.SelectedItemType == "Pet" then
            if not T[R.SelectedItemName] then
                R.SelectedItemName = ""
            end
            else
            local K = {}
            for Y, I in ipairs(zw)
            do
                K[I] = true
            end
            if not K[R.SelectedItemName] then
                R.SelectedItemName = ""
            end
            end
        d()
        local J = D.Options
        DD = true pcall(function ()
            J.TradingPetDropdown:SetValue(nil)
            J.TradingPetDropdown:SetValues(Qw)
            if #B > 0 then
                local K = {}
                for Y, I in ipairs(B)
                do
                    K[I] = true
                end
                J.TradingPetDropdown:SetValue(K)
            end
            end)
        pcall(function ()
            J.TradingHoldableDropdown:SetValue(nil)
            J.TradingHoldableDropdown:SetValues(zw)
            if R.SelectedItemType == "Holdable" and R.SelectedItemName ~= "" then
                J.TradingHoldableDropdown:SetValue(R.SelectedItemName)
            end
            end)
        pcall(function ()
            local K = J.SellPetTypeDropdown
            if not K then
                return
            end
            K:SetValues(Qw)
            if type(R.SellPetTypes) == "table" and #R.SellPetTypes > -964923 - (-964923) then
                local Y = {}
                for K, I in ipairs(R.SellPetTypes)
                do
                    Y[I] = true
                end
                K:SetValue(Y)
            end
            end)
        DD = false gw()
        pcall(function ()
            local K = D.Options.TradingTargetPlayer
            if not K then
                return
            end
            K:SetValues({})
            K:SetValue(nil)
            K:SetValues(rw)
            if rw[1] and rw[1] ~= "No Players Found" then
                K:SetValue(rw[1])
                R.TargetPlayerName = rw[1]
            else
                R.TargetPlayerName = ""
            end
            d()
        end)
        pcall(function ()
            local K = {}
            for Y, I in ipairs(i)
            do
                table.insert(K, I.targetLabel or I.label)
            end
            J.GardenTargetDropdown:SetValues(K)
            J.GardenAgeTeamDropdown:SetValues(w)
            J.GardenElephantDropdown:SetValues(w)
            J.GardenMaxTeamDropdown:SetValues(w)
            LD()
        end)
        D:Notify("\240\159\148\132 Refreshed.", 3)
    end
    ED = function ()
        if jD then
            D:Notify("\226\143\179 Already refreshing...", 2)
            return
        end
        jD = true task.spawn(function ()
            local K, Y = pcall(SD)
            if not K then
                warn("[TOMI HUB] RefreshAll error: "..tostring(Y))
            end
            jD = false
        end)
    end
    local Zw = false
    local yw = false
    local qw = false
    local Fw = false
    local Nw = false
    local Gw = -1045721 - (-1045722)
    local aw = false
    local Vw = nil
    local sw = nil
    local kw = nil
    local ew = nil
    local uw = nil
    local Rw = nil
    local function dw(K, Y, I, L)
        L = L or "ROOT/states/1"
        if K ~= "UpdateData" then
            return nil, nil
        end
        if type(I) ~= "table" then
            return nil, nil
        end
        for K, I in ipairs(I)
        do
            if type(I) == "table" and I[1] == L then
                return tostring(Y), tostring(I[2])
            end
            end
        return nil, nil
    end
    Cw = function (K, Y)
        local I = {}
        local L = (K == "Pet") and pw[Y] or bw[Y]
        for Y, L in ipairs(L or {})
        do
            if not L.isFav and not L.isLocked then
                if K == "Pet" then
                    if L.weight >= R.PetMinWeight and (L.weight <= R.PetMaxWeight and (L.age >= R.PetMinAge and L.age <= R.PetMaxAge)) then
                        table.insert(I, L)
                    end
                    else
                    if L.weight > (-867126) - (-867126) and (L.weight >= R.HoldableMinWeight and L.weight <= R.HoldableMaxWeight) then
                        table.insert(I, L)
                    end
                    end
                end
            end
        return I
    end
    local function Aw()
        local K = sw and sw.CurrentTradeReplicator
        if not K then
            return -621942, 0
        end
        local Y = K:GetData()
        if not Y then
            return -151720, 0
        end
        local I = table.find(Y.players, E.LocalPlayer)
        if not I then
            return -162802, 0
        end
        local L = (I == 1) and 28465 - (28463) or -799607
        local S = Y.offers[I].items
        local j = Y.offers[L].items
        return (S and #S or (-942919) - -942919), (j and #j or -373164)
    end
    local function nw(K, Y, I)
        lw()
        if type(Y) == "string" then
            Y = {Y}
        end
        local L = {}
        for Y, I in ipairs(Y)
        do
            local S = Cw(K, I)
            for K, Y in ipairs(S)
            do
                Y._sourceName = I
                table.insert(L, Y)
            end
            end
        local S = table.concat(Y, ", ")
        local E = (309272) - (309272)
        for Y = 1, jw.ItemLimit, 1
        do
            if not qw then
                break
            end
            if I and I() then
                break
            end
            local S, j = Aw()
            if S >= jw.ItemLimit then
                break
            end
            local T = L[E + 1]
            if not T then
                break
            end
            local D = S + 60661201 % (606612)
            task.defer(function ()
                pcall(function ()
                    Lw:FireServer(K, T.uuid)
                end)
            end)
            local B = tick()
            while (tick() - B < 1) and qw
            do
                local K, Y = Aw()
                if K >= D then
                    break
                end
                task.wait()
            end
            E = E + (2207208145) % (10078576)
        end
        D:Notify(string.format("\240\159\142\129 Added %d item(s) from [%s]", E, S), 2)
        return E
    end
    local function ww()
        if kw then
            kw:Disconnect()
        end
        if not uw then
            uw = Jw.OnClientEvent:Connect(function (K, Y, I)
                local L, S = dw(K, Y, I, "ROOT/states/1")
                if L and S then
                    end
                local E, j = dw(K, Y, I, "ROOT/states/2")
                if E and j then
                    end
                end)
        end
        kw = Yw.OnClientEvent:Connect(function (K, Y, I)
            if not R.AutoAcceptTrade then
                return
            end
            if not K then
                return
            end
            if qw then
                return
            end
            local L = tostring(Y and Y.Name or "?")
            local S = I and (I - workspace:GetServerTimeNow()) or (-402052) - (-402052)
            print(string.format("[Trading] AutoAccept: incoming request from %s (%.1fs left)", L, S))
            local E, j = pcall(function ()
                Iw:FireServer(K, true)
            end)
            if not E then
                warn("[Trading] AutoAccept: RespondRequest error -- "..tostring(j))
                return
            end
            D:Notify(string.format("\226\156\133 Accepted trade request from %s", L), 4)
            print(string.format("[Trading] AutoAccept: accepted | trade: %s", tostring(K)))
        end)
    end
    local function iw()
        if kw then
            kw:Disconnect()
            kw = nil
        end
        if not R.AutoConfirmAccept and uw then
            uw:Disconnect()
            uw = nil
        end
        end
    local function ow()
        if ew then
            ew:Disconnect()
        end
        if not uw then
            uw = Jw.OnClientEvent:Connect(function (K, Y, I)
                local L, S = dw(K, Y, I, "ROOT/states/1")
                if L and S then
                    end
                end)
        end
        ew = Jw.OnClientEvent:Connect(function (K, Y, I)
            if not R.AutoConfirmAccept then
                return
            end
            if not qw then
                return
            end
            local L, S = dw(K, Y, I, "ROOT/states/1")
            if not S then
                return
            end
            if S == "Accepted" then
                task.wait(0.5)
                pcall(function ()
                    Sw:FireServer()
                end)
                D:Notify("\240\159\164\157 Mirrored Accept!", 2)
            elseif S == "Confirmed" then
                task.wait(0.5)
                for K = 1, 3, 1
                do
                    if not qw then
                        break
                    end
                    pcall(function ()
                        Ew:FireServer()
                    end)
                    task.wait(0.2)
                end
                D:Notify("\240\159\142\129 Trade confirmed and complete!", 4)
            end
            end)
    end
    local function tw()
        if ew then
            ew:Disconnect()
            ew = nil
        end
        if not R.AutoAcceptTrade and uw then
            uw:Disconnect()
            uw = nil
        end
        end
    Vw = function (K)
        if not R.EnableTradeTicket then
            return
        end
        if Zw then
            return
        end
        if not qw then
            return
        end
        if Nw then
            return
        end
        local Y = R.SelectedItemType
        local I = R.SelectedItemName
        local L
        if Y == "Pet" then
            L = (#R.SelectedItemNames > 0) and R.SelectedItemNames or ((I ~= "") and {I} or {})
        else
            L = (I ~= "") and {I} or {}
        end
        if #L == -250402 - (-250402) then
            return
        end
        Nw = true task.spawn(function ()
            local I = tick()
            local S = false
            while (tick() - I < 5) and qw
            do
                local K = sw and sw.CurrentTradeReplicator
                if K then
                    local Y = K:GetData()
                    if Y and (Y.players and table.find(Y.players, E.LocalPlayer)) then
                        S = true
                        break
                    end
                    end
                task.wait(0.1)
            end
            if not S then
                warn("[Trading] Trade data failed to load in time. Aborting fill.")
                Nw = false
                return
            end
            if K == "native trade created" then
                task.wait(0.5)
            end
            if not qw then
                Nw = false
                return
            end
            D:Notify("\240\159\142\171 Trade window ready -- adding items...", 3)
            local T, B = pcall(function ()
                nw(Y, L, function ()
                    return not R.EnableTradeTicket or not qw
                end)
            end)
            if not T then
                warn("[Trading] EnableTicket fill error: "..tostring(B))
            end
            if qw then
                local K = false
                local Y = tick()
                while (tick() - Y < 10) and qw
                do
                    local Y = j.PlayerGui:FindFirstChild("TradingUI")
                    local I = Y and (Y:FindFirstChild("LiveTrade") and (Y.LiveTrade:FindFirstChild("Options") and Y.LiveTrade.Options:FindFirstChild("Accept")))
                    if I and I.Active == true then
                        K = true
                        break
                    end
                    local L = sw and sw.CurrentTradeReplicator
                    if L then
                        local Y = L:GetData()
                        if Y and (Y.lastChange and (workspace:GetServerTimeNow() - Y.lastChange >= 5.1)) then
                            K = true
                            break
                        end
                        end
                    task.wait(0.1)
                end
                if K and qw then
                    pcall(function ()
                        Sw:FireServer()
                    end)
                    D:Notify("\240\159\164\157 Initial Accept Fired! Please review and Confirm.", 4)
                else
                    warn("[Trading] Accept cooldown timed out or trade closed.")
                end
                end
            Nw = false
        end)
    end
    local function Uw()
        end
    local function vw()
        end
    pcall(function ()
        sw = require(L.Modules.TradeControllers.TradingController)
    end)
    local cw = Instance.new("BindableEvent")
    cw.Event:Connect(function (K)
        if K == "Created" then
            qw = true print("\240\159\159\162 [TOMI HUB] Trade Started! (Secure Executor Thread)")
            if Vw then
                Vw("native trade created")
            end
            elseif K == "Destroyed" then
            qw = false Fw = false Nw = false print("\240\159\148\180 [TOMI HUB] Trade Ended! Ready for next cycle.")
        end
        end)
    if sw then
        sw.OnTradeCreated:Connect(function ()
            cw:Fire("Created")
        end)
        sw.OnTradeDestroyed:Connect(function ()
            cw:Fire("Destroyed")
        end)
    else
        warn("\226\154\160\239\184\143 [TOMI HUB] Could not load TradingController. Auto-Trader might get stuck.")
    end
    local function Hw()
        local K = 0
        local Y = 100
        pcall(function ()
            local I = X:GetData()
            if I and I.PetsData then
                local L = I.PetsData.PetInventory
                if L and L.Data then
                    for Y in pairs(L.Data)
                    do
                        K = K + 1
                    end
                    end
                local S = I.PetsData.MutableStats
                if S and S.MaxPetsInInventory then
                    Y = tonumber(S.MaxPetsInInventory) or Y
                elseif L and L.MaxSlots then
                    Y = L.MaxSlots
                elseif I.PetsData.MaxPets then
                    Y = I.PetsData.MaxPets
                end
                end
            end)
        local I = (Y > 0) and ((K / Y) * 100) or (-53180) + 53180
        return I >= R.NearFullThreshold, K, Y, I
    end
    local function Pw()
        if Zw then
            return
        end
        Zw = true print("===== [Trading] Auto Trade Loop STARTED =====")
        task.spawn(function ()
            while R.AutoGiftMode
            do
                local K, Y = pcall(function ()
                    if R.HoldUntilNearFull and not aw then
                        local K, Y, I, L = Hw()
                        if not K then
                            D.Labels.TradingCapacityStatus:SetText(string.format("\226\143\179 Waiting: %d/%d (%.0f%% < %d%%)", Y, I, L, R.NearFullThreshold))
                            task.wait(3)
                            return
                        end
                        aw = true D:Notify(string.format("\240\159\147\166 Near-Full reached (%.0f%%) -- starting Auto Trade!", L), 4)
                    end
                    local K = R.SelectedItemType
                    local Y = R.TargetPlayerName
                    if Y == "" then
                        task.wait(3)
                        return
                    end
                    local I = (K == "Pet") and R.SelectedItemNames or {R.SelectedItemName}
                    if #I == 0 or (I[1] == nil or I[1] == "") then
                        task.wait(3)
                        return
                    end
                    lw()
                    while Gw <= #I
                    do
                        local Y = I[Gw]
                        local L = Cw(K, Y)
                        if #L > 0 then
                            break
                        else
                            D:Notify(string.format("\240\159\148\132 %s fully depleted -- skipping...", Y), 3)
                            print(string.format("[Auto Trade] \'%s\' fully depleted. Queue %d -> %d", Y, Gw, Gw + 1))
                            Gw = Gw + 1
                        end
                        end
                    if Gw > #I then
                        if R.HoldUntilNearFull then
                            aw = false Gw = 1
                            D:Notify("\240\159\147\166 Queue drained -- waiting for inventory to refill to near-full...", 4)
                            pcall(function ()
                                D.Labels.TradingCapacityStatus:SetText("\226\143\179 Drained -- waiting to refill...")
                            end)
                            task.wait(3)
                            return
                        end
                        D:Notify("\240\159\155\145 All queued pets depleted -- stopping Auto Trade!", 5)
                        R.AutoGiftMode = false aw = false pcall(function ()
                            Toggles.TradingAutoGift:SetValue(false)
                        end)
                        return
                    end
                    local L = {}
                    for K = Gw, #I, 165106 + (-165105)
                    do
                        table.insert(L, I[K])
                    end
                    local S = (K == "Pet") and L or I[1]
                    local j = Cw(K, (type(S) == "table") and S[1] or S)
                    if yw then
                        task.wait(1)
                        return
                    end
                    yw = true
                    local T = E:FindFirstChild(Y)
                    if not T then
                        yw = false task.wait(3)
                        return
                    end
                    if not Fw then
                        Dw()
                        task.wait(0.2)
                        Yw:FireServer(T)
                        Fw = true
                    end
                    local B = false
                    local J = Bw.OnClientEvent:Connect(function ()
                        B = true
                    end)
                    local W = tick()
                    while not B and ((tick() - W < 15) and R.AutoGiftMode)
                    do
                        task.wait(0.1)
                    end
                    if J then
                        J:Disconnect()
                    end
                    if not B or not R.AutoGiftMode then
                        Fw = false yw = false
                        return
                    end
                    nw(K, (K == "Pet") and L or I[1], function ()
                        return not R.AutoGiftMode
                    end)
                    task.wait(5.5)
                    if qw then
                        pcall(function ()
                            Sw:FireServer()
                        end)
                    end
                    local M = false
                    local x = Jw.OnClientEvent:Connect(function (K, Y, I)
                        local L, S = dw(K, Y, I, "ROOT/states/2")
                        if S == "Accepted" then
                            local K = 0
                            for Y, I in ipairs(I)
                            do
                                if I[1] == "ROOT/lastChange" then
                                    K = tonumber(I[2]) or 0
                                    break
                                end
                                end
                            task.spawn(function ()
                                local Y = workspace:GetServerTimeNow() - K
                                local I = math.max(0, 5.2 - Y)
                                if I > 405872770 % (5137630) then
                                    task.wait(I)
                                end
                                while qw and not M
                                do
                                    pcall(function ()
                                        Ew:FireServer()
                                    end)
                                    task.wait(0.2)
                                end
                                M = true
                            end)
                        end
                        end)
                    local p = tick()
                    while not M and ((tick() - p < 20) and qw)
                    do
                        task.wait(0.1)
                    end
                    if x then
                        x:Disconnect()
                    end
                    Fw = false yw = false task.wait(3)
                end)
                if not K then
                    warn("[Auto Trade] Loop Error: "..tostring(Y))
                    yw = false Fw = false task.wait(2)
                end
                end
            Zw = false
        end)
    end
    local function mw()
        task.spawn(function ()
            print("===== [Auto Send Ticket] Standalone loop STARTED =====")
            while R.AutoSendTicket and not R.AutoGiftMode
            do
                if qw or yw then
                    task.wait(1)
                elseif R.HoldUntilNearFull and not Hw() then
                    local K, Y, I, L = Hw()
                    pcall(function ()
                        D.Labels.TradingCapacityStatus:SetText(string.format("\226\143\179 Waiting: %d/%d (%.0f%% < %d%%)", Y, I, L, R.NearFullThreshold))
                    end)
                    task.wait(3)
                else
                    local K, Y = pcall(function ()
                        local K = R.TargetPlayerName
                        local Y = E:FindFirstChild(K)
                        if not Y then
                            task.wait(3)
                            return
                        end
                        if not Fw then
                            Dw()
                            task.wait(0.2)
                            Yw:FireServer(Y)
                            Fw = true D:Notify("\240\159\146\172 Ticket sent -> "..K, 3)
                        end
                        local I = tick()
                        while not qw and ((tick() - I < 15) and R.AutoSendTicket)
                        do
                            task.wait(0.1)
                        end
                        Fw = false
                        if qw then
                            while qw
                            do
                                task.wait(0.5)
                            end
                            task.wait(R.SendDelay + 2)
                        end
                        end)
                    task.wait(1)
                end
                end
            print("===== [Auto Send Ticket] Standalone loop STOPPED =====")
        end)
    end
    gw()
    lw()
    JD.TradingTab = WD:AddTab("TRADING", "repeat-2")
    JD.TradingToggleGroup = JD.TradingTab:AddLeftGroupbox("Automation Toggles")
    W.StyleGroupboxPanel(JD.TradingToggleGroup)
    JD.TradingToggleGroup:AddToggle("TradingAutoAccept", {Text = "\226\156\133 Auto Accept Trade";
    Default = R.AutoAcceptTrade;
    Tooltip = "Automatically accepts any incoming trade invitation."})
    JD.TradingSelectGroup = JD.TradingTab:AddLeftGroupbox("Item Selection")
    W.StyleGroupboxPanel(JD.TradingSelectGroup)
    JD.TradingSelectGroup:AddDropdown("TradingPetDropdown", {Text = "\240\159\144\190 Select Pets to Trade (Queue)", Values = Qw;
    Default = nil;
    Multi = true, AllowNull = true, Searchable = true, Tooltip = "Pick one or more pets. Slots fill in order -- when one runs out the next fills remaining slots automatically.";
    Callback = function (K)
        if DD then
            return
        end
        DD = true R.SelectedItemType = "Pet"
        R.SelectedItemNames = {}
        if type(K) == "table" then
            for K, Y in pairs(K)
            do
                if Y then
                    table.insert(R.SelectedItemNames, K)
                end
                end
            table.sort(R.SelectedItemNames)
        end
        Gw = 1
        d()
        pcall(function ()
            Options.TradingHoldableDropdown:SetValue(nil)
        end)
        DD = false
        local Y = 0
        for K, I in ipairs(R.SelectedItemNames)
        do
            Y = Y + Xw(I, "Pet")
        end
        D:Notify(string.format("\240\159\144\190 %d pet type(s) queued -- %d total in inventory", #R.SelectedItemNames, Y), 3)
    end})
    JD.TradingSelectGroup:AddDivider()
    JD.TradingSelectGroup:AddInput("TradingPetMinWeight", {Text = "Pet Min Weight (kg)", Default = tostring(R.PetMinWeight), Numeric = true;
    Finished = true;
    Placeholder = "0", Tooltip = "Only trade pets at or above this weight.", Callback = function (K)
        R.PetMinWeight = tonumber(K) or 0
        d()
    end})
    JD.TradingSelectGroup:AddInput("TradingPetMaxWeight", {Text = "Pet Max Weight (kg)";
    Default = tostring(R.PetMaxWeight);
    Numeric = true, Finished = true;
    Placeholder = "9999", Tooltip = "Only trade pets at or below this weight.", Callback = function (K)
        R.PetMaxWeight = tonumber(K) or 9999
        d()
    end})
    JD.TradingSelectGroup:AddInput("TradingPetMinAge", {Text = "Pet Min Age", Default = tostring(R.PetMinAge), Numeric = true;
    Finished = true;
    Placeholder = "0";
    Tooltip = "Only trade pets at or above this age/level.", Callback = function (K)
        R.PetMinAge = tonumber(K) or -611026 - (-611026)
        d()
    end})
    JD.TradingSelectGroup:AddInput("TradingPetMaxAge", {Text = "Pet Max Age", Default = tostring(R.PetMaxAge), Numeric = true;
    Finished = true, Placeholder = "9999", Tooltip = "Only trade pets at or below this age/level.", Callback = function (K)
        R.PetMaxAge = tonumber(K) or -379497
        d()
    end})
    JD.TradingSelectGroup:AddDivider()
    JD.TradingSelectGroup:AddDropdown("TradingHoldableDropdown", {Text = "\240\159\141\142 Select Holdable to Trade";
    Values = zw, Default = nil, Searchable = true, Tooltip = "Pick a holdable/fruit type. All matching items will be traded (filtered by weight).", Callback = function (K)
        if DD then
            return
        end
        DD = true R.SelectedItemType = "Holdable"
        R.SelectedItemName = K or ""
        d()
        pcall(function ()
            Options.TradingPetDropdown:SetValue(nil)
        end)
        DD = false
        local Y = Xw(K, "Holdable")
        D:Notify(string.format("\240\159\141\142 Holdable selected: %s -- %d in inventory", K, Y), 3)
    end})
    JD.TradingSelectGroup:AddDivider()
    JD.TradingSelectGroup:AddInput("TradingHoldableMinWeight", {Text = "Holdable Min Weight (kg)";
    Default = tostring(R.HoldableMinWeight);
    Numeric = true;
    Finished = true;
    Placeholder = "0", Tooltip = "Only trade holdables at or above this weight.";
    Callback = function (K)
        R.HoldableMinWeight = tonumber(K) or 0
        d()
    end})
    JD.TradingSelectGroup:AddInput("TradingHoldableMaxWeight", {Text = "Holdable Max Weight (kg)";
    Default = tostring(R.HoldableMaxWeight), Numeric = true;
    Finished = true, Placeholder = "9999";
    Tooltip = "Only trade holdables at or below this weight.", Callback = function (K)
        R.HoldableMaxWeight = tonumber(K) or 9999
        d()
    end})
    JD.TradingSelectGroup:AddDivider()
    JD.TradingTargetDropdown = JD.TradingSelectGroup:AddDropdown("TradingTargetPlayer", {Text = "\240\159\145\164 Target Player", Values = rw;
    Default = rw[1] or "No Players Found";
    Tooltip = "The player to send trades to. Press Refresh to update the list.";
    Callback = function (K)
        R.TargetPlayerName = K or ""
        d()
    end})
    JD.TradingSelectGroup:AddDivider({Thin = true})
    JD.TradingSelectGroup:AddToggle("TradingAutoAcceptToggle", {Text = "\226\156\133 Auto Confirm / Accept";
    Default = R.AutoConfirmAccept;
    Tooltip = "Automatically mirrors Accept and Confirm when the other side acts."})
    JD.TradingSelectGroup:AddToggle("TradingAutoGift", {Text = "\240\159\148\129 Auto Trade";
    Default = R.AutoGiftMode;
    Tooltip = "Master toggle -- runs the full cycle: Send Ticket -> Add Item -> Accept -> Confirm."})
    JD.TradingSelectGroup:AddToggle("TradingEnableTicket", {Text = "\240\159\142\171 Enable Trade Ticket";
    Default = R.EnableTradeTicket, Tooltip = "Equips and uses a Trade Ticket before sending a trade request."})
    JD.TradingSelectGroup:AddToggle("TradingAutoSend", {Text = "\240\159\146\172 Auto Send Ticket", Default = R.AutoSendTicket, Tooltip = "Periodically sends a trade request to the selected target player."})
    JD.TradingSelectGroup:AddToggle("TradingHoldUntilNearFull", {Text = "\240\159\147\166 Hold Until Near-Full";
    Default = R.HoldUntilNearFull, Tooltip = "Pauses Auto Trade / Auto Send Ticket until your inventory reaches the threshold below."})
    JD.TradingSelectGroup:AddDivider()
    W.MakeButtonPanel(JD.TradingSelectGroup, "TradingSelectButtonsPanel", {{"\240\159\148\132 Reload";
    function ()
        ED()
    end}})
    JD.TradingStatusGroup = JD.TradingTab:AddRightGroupbox("Live Status")
    W.StyleGroupboxPanel(JD.TradingStatusGroup)
    JD.TradingStatusGroup:AddLabel("TradingStatus", {Text = "\226\143\184\239\184\143 Status: Idle";
    DoesWrap = true})
    JD.TradingStatusGroup:AddLabel("TradingItemStatus", {Text = "\240\159\142\129 Item: ---";
    DoesWrap = true})
    JD.TradingStatusGroup:AddLabel("TradingTargetStatus", {Text = "\240\159\145\164 Target: ---", DoesWrap = true})
    JD.TradingStatusGroup:AddLabel("TradingInvCount", {Text = "\240\159\147\166 Inventory Count: ---";
    DoesWrap = true})
    JD.TradingStatusGroup:AddLabel("TradingCapacityStatus", {Text = "\240\159\148\139 Capacity: ---";
    DoesWrap = true})
    local function Ow()
        local K = R.SelectedItemType
        local Y = R.SelectedItemName
        local I = R.TargetPlayerName
        local L
        if R.AutoGiftMode and Zw then
            L = "\240\159\148\129 Status: Auto Trade Running"
        elseif R.AutoGiftMode then
            L = "\240\159\148\129 Status: Auto Trade Starting..."
        elseif R.AutoSendTicket then
            L = "\240\159\146\172 Status: Auto Send Ticket ON"
        elseif R.EnableTradeTicket then
            L = "\240\159\142\171 Status: Waiting for Trade Window"
        elseif R.AutoAcceptTrade then
            L = "\240\159\145\129\239\184\143 Status: Listening for Requests"
        elseif R.AutoConfirmAccept then
            L = "\226\156\133 Status: Waiting to Mirror Confirm"
        else
            L = "\226\143\184\239\184\143 Status: Idle"
        end
        D.Labels.TradingStatus:SetText(L)
        D.Labels.TradingItemStatus:SetText("\240\159\142\129 Item: "..((Y ~= "" and (Y..(" ["..(K.."]"))) or "---")))
        D.Labels.TradingTargetStatus:SetText("\240\159\145\164 Target: "..((I ~= "" and I or "---")))
        if Y ~= "" then
            local I = Xw(Y, K)
            D.Labels.TradingInvCount:SetText("\240\159\147\166 Inventory Count: "..(I.." (matching filters)"))
            if I == 0 and ((R.AutoGiftMode or R.AutoSendTicket or R.EnableTradeTicket)) then
                R.AutoGiftMode = false R.AutoSendTicket = false R.EnableTradeTicket = false Zw = false Fw = false yw = false pcall(function ()
                    Toggles.TradingAutoGift:SetValue(false)
                end)
                pcall(function ()
                    Toggles.TradingAutoSend:SetValue(false)
                end)
                pcall(function ()
                    Toggles.TradingEnableTicket:SetValue(false)
                end)
                d()
                D:Notify("\240\159\155\145 [Trading] Item depleted -- all sender automation stopped!", 6)
            end
            else
            D.Labels.TradingInvCount:SetText("\240\159\147\166 Inventory Count: ---")
        end
        pcall(function ()
            if R.HoldUntilNearFull then
                local K, Y, I, L = Hw()
                if K then
                    D.Labels.TradingCapacityStatus:SetText(string.format("\226\156\133 Ready: %d/%d (%.0f%% >= %d%%)", Y, I, L, R.NearFullThreshold))
                else
                    D.Labels.TradingCapacityStatus:SetText(string.format("\226\143\179 Waiting: %d/%d (%.0f%% < %d%%)", Y, I, L, R.NearFullThreshold))
                end
                else
                local K, Y, I, L = Hw()
                D.Labels.TradingCapacityStatus:SetText(string.format("\240\159\148\139 Capacity: %d/%d (%.0f%%)", Y, I, L))
            end
            end)
    end
    task.spawn(function ()
        task.wait(1)
        Ow()
    end)
    task.spawn(function ()
        while task.wait(2)
        do
            Ow()
        end
        end)
    task.defer(function ()
        if R.TargetPlayerName ~= "" and table.find(rw, R.TargetPlayerName) then
            JD.TradingTargetDropdown:SetValue(R.TargetPlayerName)
        elseif rw[1] and rw[1] ~= "No Players Found" then
            R.TargetPlayerName = rw[1]
            JD.TradingTargetDropdown:SetValue(rw[1])
            d()
        end
        if R.SelectedItemType == "Pet" then
            if R.SelectedItemNames and #R.SelectedItemNames > 0 then
                local K = {}
                for Y, I in ipairs(R.SelectedItemNames)
                do
                    K[I] = true
                end
                pcall(function ()
                    Options.TradingPetDropdown:SetValue(K)
                end)
            elseif R.SelectedItemName ~= "" then
                pcall(function ()
                    Options.TradingPetDropdown:SetValue(R.SelectedItemName)
                end)
            end
            elseif R.SelectedItemType == "Holdable" and R.SelectedItemName ~= "" then
            pcall(function ()
                Options.TradingHoldableDropdown:SetValue(R.SelectedItemName)
            end)
        end
        if type(R.SellPetTypes) == "table" and #R.SellPetTypes > 0 then
            local K = {}
            for Y, I in ipairs(R.SellPetTypes)
            do
                K[I] = true
            end
            pcall(function ()
                Options.SellPetTypeDropdown:SetValue(K)
            end)
        end
        end)
    do
        local K = WD:AddTab("SELLING", "tag")
        local Y = K:AddLeftGroupbox("Sell Pets")
        W.StyleGroupboxPanel(Y)
        Y:AddLabel("SellWarnLabel", {Text = "\226\154\160\239\184\143 Pets matching the filters below will be sold automatically. Double-check your filters before enabling.";
        DoesWrap = true})
        Y:AddDivider()
        Y:AddDropdown("SellPetTypeDropdown", {Text = "\240\159\144\190 Pet Types";
        Values = Qw, Default = nil, Multi = true, AllowNull = true;
        Searchable = true, Tooltip = "Select one or more pet types to sell. Every selected type that matches the filters below is sold.";
        Callback = function (K)
            R.SellPetTypes = {}
            if type(K) == "table" then
                for K, Y in pairs(K)
                do
                    if Y then
                        table.insert(R.SellPetTypes, K)
                    end
                    end
                table.sort(R.SellPetTypes)
            end
            d()
        end})
        Y:AddInput("SellPetMinWeight", {Text = "\226\154\150\239\184\143 Min KG", Default = tostring(R.SellPetMinWeight);
        Numeric = true, Placeholder = "0";
        Callback = function (K)
            R.SellPetMinWeight = tonumber(K) or -1412088
            d()
        end})
        Y:AddInput("SellPetMaxWeight", {Text = "\226\154\150\239\184\143 Max KG", Default = tostring(R.SellPetMaxWeight), Numeric = true, Placeholder = "9999", Callback = function (K)
            R.SellPetMaxWeight = tonumber(K) or -183325
            d()
        end})
        Y:AddInput("SellPetMinLevel", {Text = "\240\159\148\162 Min Level", Default = tostring(R.SellPetMinLevel), Numeric = true, Placeholder = "0", Callback = function (K)
            R.SellPetMinLevel = tonumber(K) or 0
            d()
        end})
        Y:AddInput("SellPetMaxLevel", {Text = "\240\159\148\162 Max Level";
        Default = tostring(R.SellPetMaxLevel);
        Numeric = true, Placeholder = "9999", Callback = function (K)
            R.SellPetMaxLevel = tonumber(K) or -814363 - (-824362)
            d()
        end})
        Y:AddDivider()
        local I = Y:AddLabel("SellPetStatusLabel", {Text = "\240\159\147\166 Matched: --";
        DoesWrap = true})
        Y:AddDivider()
        local L = Y:AddToggle("EnableAutoSell", {Text = "\240\159\146\176 Enable Auto Sell", Default = false;
        Tooltip = "Continuously sells pets matching your filters. Turn off to stop."})
        L:OnChanged(function (K)
            R.EnableAutoSell = K
            d()
            if not K then
                D:Notify("\240\159\155\145 Auto Sell stopped.", 3)
                return
            end
            local Y = l:FindFirstChild("SellPet_RE")
            if not Y then
                D:Notify("\226\157\140 SellPet_RE remote not found.", 4)
                L:SetValue(false)
                return
            end
            D:Notify("\240\159\146\176 Auto Sell started.", 3)
            task.spawn(function ()
                while R.EnableAutoSell
                do
                    local K = R.SellPetTypes or {}
                    if #K == 0 then
                        I:SetText("\240\159\147\166 Matched: -- (no pet type selected)")
                        task.wait(1)
                    else
                        lw()
                        local L = {}
                        for K, Y in ipairs(K)
                        do
                            local I = pw[Y] or {}
                            for K, Y in ipairs(I)
                            do
                                if not Y.isFav and (Y.weight >= R.SellPetMinWeight and (Y.weight <= R.SellPetMaxWeight and (Y.age >= R.SellPetMinLevel and Y.age <= R.SellPetMaxLevel))) then
                                    table.insert(L, Y)
                                end
                                end
                            end
                        if #L == 0 then
                            I:SetText(string.format("\240\159\147\166 Matched: 0 (%d type(s) selected)", #K))
                            task.wait(2)
                        else
                            I:SetText(string.format("\240\159\147\166 Selling: %d pet(s) across %d type(s)...", #L, #K))
                            local S = (-125007) - (-125007)
                            for K, I in ipairs(L)
                            do
                                if not R.EnableAutoSell then
                                    break
                                end
                                local L = nil pcall(function ()
                                    L = H(I.uuid)
                                    if L then
                                        local K = j.Character
                                        local Y = K and K:FindFirstChildWhichIsA("Humanoid")
                                        if Y then
                                            Y:UnequipTools()
                                            if L.Parent ~= K then
                                                Y:EquipTool(L)
                                            end
                                            end
                                        end
                                    end)
                                if L then
                                    pcall(function ()
                                        Y:FireServer(L, true)
                                    end)
                                    S = S + 1
                                end
                                task.wait(0.26)
                            end
                            if S > -442918 - (-442918) then
                                D:Notify(string.format("\226\156\133 Sold %d pet(s).", S), 4)
                            end
                            I:SetText(string.format("\240\159\147\166 Sold %d -- waiting...", S))
                            task.wait(2)
                        end
                        end
                    end
                I:SetText("\240\159\147\166 Matched: -- (stopped)")
            end)
        end)
        task.spawn(J, Y, false)
    end
    JD.GardenConfigGroup = JD.GardenTab:AddLeftGroupbox("Auto KG Boost")
    W.StyleGroupboxPanel(JD.GardenConfigGroup)
    JD.GardenConfigGroup:AddDropdown("GardenTargetDropdown", {Text = "\240\159\142\175 Target Queue";
    Values = ((function ()
        local K = {}
        for Y, I in ipairs(i)
        do
            table.insert(K, I.targetLabel or I.label)
        end
        return #K > -1014895 - (-1014895) and K or w
    end))(), Multi = true, AllowNull = true, Searchable = true;
    Tooltip = "Select target pets to process. These will be queued and leveled up one by one."})
    JD.GardenConfigGroup:AddDivider()
    JD.GardenConfigGroup:AddDropdown("GardenAgeTeamDropdown", {Text = "\240\159\140\177 Age Team (Max 7)", Values = w;
    Multi = true;
    AllowNull = true, Searchable = true;
    Tooltip = "Select up to 7 pets to equip during the Age Boost Phase."})
    JD.GardenConfigGroup:AddDropdown("GardenElephantDropdown", {Text = "\240\159\144\152 Elephant Team (Max 7)", Values = w;
    Multi = true, AllowNull = true;
    Searchable = true;
    Tooltip = "Select up to 7 elephants to equip during the Elephant Boost Phase."})
    JD.GardenConfigGroup:AddDropdown("GardenMaxTeamDropdown", {Text = "\226\173\144 Max Age Team (Max 7)";
    Values = w;
    Multi = true;
    AllowNull = true, Searchable = true;
    Tooltip = "Select up to 7 pets that age faster at high levels. Used after the pet reaches Max Level Swap Age during the Max Level phase."})
    JD.GardenConfigGroup:AddDivider()
    JD.GardenConfigGroup:AddInput("GardenSwapLimitAge", {Text = "\240\159\143\134 Swap Age Limit", Default = tostring(R.GardenSwapLimitAge);
    Numeric = true;
    Finished = true;
    Placeholder = "100", Tooltip = "Target pet Age threshold to swap from Age to Elephant Team."})
    JD.GardenConfigGroup:AddInput("GardenTargetWeight", {Text = "\240\159\142\175 Target KG", Default = tostring(R.GardenTargetWeight);
    Numeric = true;
    Finished = true, Placeholder = "100";
    Tooltip = "Target base KG to complete the pet. Uses BaseWeight x 1.1 format."})
    JD.GardenConfigGroup:AddInput("GardenMaxLevelSwapAge", {Text = "\226\173\144 Max Level Swap Age", Default = tostring(R.GardenMaxLevelSwapAge), Numeric = true, Finished = true;
    Placeholder = "80";
    Tooltip = "During Max Level phase: switch from Age Team to Max Age Team at this age. Then boost to Max Age."})
    JD.GardenConfigGroup:AddInput("GardenMaxAgeInput", {Text = "\240\159\143\133 Max Age";
    Default = tostring(R.GardenMaxAge), Numeric = true;
    Finished = true, Placeholder = "500", Tooltip = "Age at which a pet is considered fully maxed and the loop moves on to the next target."})
    JD.GardenConfigGroup:AddDivider()
    JD.GardenConfigGroup:AddToggle("EnableGardenAuto", {Text = "\226\154\161 Start Automation", Default = R.EnableGardenAuto, Tooltip = "Start the Auto KG Boost loop."})
    JD.GardenConfigGroup:AddToggle("GardenSmartSwap", {Text = "\240\159\148\128 Smart Swap";
    Default = R.GardenSmartSwap, Tooltip = "Only swap the difference between teams. Shared pets stay equipped."})
    JD.GardenConfigGroup:AddToggle("GardenEnableMaxLevel", {Text = "\226\173\144 Enable Max Level Phase";
    Default = R.GardenEnableMaxLevel;
    Tooltip = "After KG target is hit, age the pet to Max Age using Age Team -> Max Age Team."})
    JD.GardenConfigGroup:AddToggle("GardenBatchMaxLevel", {Text = "\240\159\147\166 Batch Max Level";
    Default = R.GardenBatchMaxLevel, Tooltip = "KG-boost ALL target pets first, then run the Max Level phase on all of them. Off = max-level each pet immediately after its KG is done."})
    JD.GardenConfigGroup:AddToggle("GardenAgeBoostOnly", {Text = "\226\154\161 Age Boost Only (Skip KG)", Default = R.GardenAgeBoostOnly, Tooltip = "Skip the Elephant (KG) phase entirely. Goes straight into aging using the Age Team. The KG target is ignored -- pets are aged to Max Age directly."})
    JD.GardenConfigGroup:AddDivider()
    W.MakeButtonPanel(JD.GardenConfigGroup, "GardenConfigButtonsPanel", {{"\240\159\148\132 Reload";
    function ()
        ED()
    end}})
    JD.GardenStatusGroup = JD.GardenTab:AddRightGroupbox("Pet Status")
    W.StyleGroupboxPanel(JD.GardenStatusGroup)
    JD.GardenPhaseLabel = JD.GardenStatusGroup:AddLabel("GardenPhaseLabel", {Text = "Phase: Idle", DoesWrap = true})
    JD.GardenActivePetLabel = JD.GardenStatusGroup:AddLabel("GardenActivePetLabel", {Text = "Pet: ---", DoesWrap = true})
    JD.GardenWeightLabel = JD.GardenStatusGroup:AddLabel("GardenWeightLabel", {Text = "KG: ---", DoesWrap = true})
    JD.GardenAgeLabel = JD.GardenStatusGroup:AddLabel("GardenAgeLabel", {Text = "Age: ---", DoesWrap = true})
    JD.GardenSlotsLabel = JD.GardenStatusGroup:AddLabel("GardenSlotsLabel", {Text = "Slots: ---";
    DoesWrap = true})
    local function fw()
        pcall(function ()
            local K = _G.GardenActiveTargetUUID
            if not K then
                D.Labels.GardenPhaseLabel:SetText("\240\159\148\132 Phase: "..((R.EnableGardenAuto and "Searching..." or "Idle")))
                D.Labels.GardenActivePetLabel:SetText("\240\159\144\190 Pet: ---")
                D.Labels.GardenWeightLabel:SetText("\226\154\150\239\184\143 KG: ---")
                D.Labels.GardenAgeLabel:SetText("\240\159\147\133 Age: ---")
                D.Labels.GardenSlotsLabel:SetText("\240\159\148\139 Slots: ---")
                return
            end
            local Y = O(K)
            if not Y then
                D.Labels.GardenPhaseLabel:SetText("\240\159\148\132 Phase: Error")
                D.Labels.GardenActivePetLabel:SetText("\240\159\144\190 Pet: Not Found")
                D.Labels.GardenWeightLabel:SetText("\226\154\150\239\184\143 KG: ---")
                D.Labels.GardenAgeLabel:SetText("\240\159\147\133 Age: ---")
                D.Labels.GardenSlotsLabel:SetText("\240\159\148\139 Slots: ---")
                return
            end
            local I = Y.PetData or {}
            local L = I.Level or 0
            local S = tonumber(I.BaseWeight) or 105876 - (105876)
            local E = S * 1.1
            local T = Y.PetType or "Unknown"
            D.Labels.GardenPhaseLabel:SetText("\240\159\148\132 Phase: "..((_G.GardenActivePhase or "Idle")))
            D.Labels.GardenActivePetLabel:SetText(string.format("\240\159\144\190 Pet: %s", T))
            D.Labels.GardenWeightLabel:SetText(string.format("\226\154\150\239\184\143 KG: %.2f / %.2f", E, R.GardenTargetWeight))
            D.Labels.GardenAgeLabel:SetText(string.format("\240\159\147\133 Age: %d / %d", L, R.GardenSwapLimitAge))
            local B = 0
            pcall(function ()
                local K = X:GetData()
                local Y = K and (K.PetsData and ((K.PetsData.EquippedPets or K.PetsData.Equipped or K.PetsData.EquippedPetsList)))
                if type(Y) == "table" then
                    for K in pairs(Y)
                    do
                        B = B + (352320095) % (7190206)
                    end
                    else
                    local K = j.Character
                    if K then
                        for K, Y in ipairs(K:GetChildren())
                        do
                            if Y:IsA("Tool") and Y:GetAttribute("PET_UUID") then
                                B = B + 1
                            end
                            end
                        end
                    end
                end)
            D.Labels.GardenSlotsLabel:SetText(string.format("\240\159\148\139 Slots: %d / 8", B))
        end)
    end
    task.spawn(function ()
        task.wait(1)
        fw()
    end)
    task.spawn(function ()
        while task.wait(2)
        do
            fw()
        end
        end)
    local hw = false
    local function K8()
        if hw then
            return
        end
        hw = true print("===== [Garden Auto] Loop STARTED =====")
        task.spawn(function ()
            local K = nil
            local Y = "Idle"
            local I = nil
            local L = {}
            local S = {}
            local E = false
            local function T(K, Y)
                if R.GardenAgeBoostOnly then
                    return true
                end
                local I = O(K, Y)
                if not I then
                    return false
                end
                local L = I.PetData or {}
                local S = tonumber(L.BaseWeight) or (-76160) - (-76160)
                return (S * 1.1) >= R.GardenTargetWeight
            end
            local function B(K, Y)
                local I = O(K, Y)
                if not I then
                    return false
                end
                local L = I.PetData or {}
                local S = tonumber(L.Level or L.Age or L.PetAge or L.AgeLevel) or -1014823 + (1014823)
                return S >= ((tonumber(R.GardenMaxAge) or 500))
            end
            local function J(K)
                pcall(function ()
                    F:FireServer("UnequipPet", K)
                end)
            end
            local function W(K)
                pcall(function ()
                    local Y = j.Character
                    local I = Y and Y:FindFirstChild("HumanoidRootPart")
                    F:FireServer("EquipPet", K, I and I.CFrame or CFrame.new(0, 0, 0))
                end)
            end
            local function M(K, Y)
                if Y then
                    return Y[K] == true
                end
                local I, L = pcall(function ()
                    local Y = X:GetData()
                    local I = Y and Y.PetsData
                    if I and I.EquippedPets then
                        for Y, I in ipairs(I.EquippedPets)
                        do
                            if I == K then
                                return true
                            end
                            end
                        return false
                    end
                    return nil
                end)
                if I and L ~= nil then
                    return L
                end
                local S = j.Character
                if S then
                    for Y, I in ipairs(S:GetChildren())
                    do
                        if I:IsA("Tool") and I:GetAttribute("PET_UUID") == K then
                            return true
                        end
                        end
                    end
                return false
            end
            local function x(K)
                local Y = {}
                local I = pcall(function ()
                    local I = K or X:GetData()
                    local L = I and I.PetsData
                    if L and L.EquippedPets then
                        for K, I in ipairs(L.EquippedPets)
                        do
                            Y[I] = true
                        end
                        end
                    end)
                if not I or not next(Y) then
                    local K = j.Character
                    if K then
                        for K, I in ipairs(K:GetChildren())
                        do
                            if I:IsA("Tool") then
                                local K = I:GetAttribute("PET_UUID")
                                if K then
                                    Y[K] = true
                                end
                                end
                            end
                        end
                    end
                return Y
            end
            local function p(K)
                local Y = 8
                local I = K and #K or 369570946 % (4452662)
                return math.max(Y - I, 0)
            end
            local function b(K, Y)
                local I = {}
                pcall(function ()
                    local L = Y or X:GetData()
                    local S = L and L.PetsData
                    if S and (S.PetInventory and (S.PetInventory.Data and S.EquippedPets)) then
                        local Y = {}
                        for K, I in ipairs(S.EquippedPets)
                        do
                            Y[I] = true
                        end
                        for Y in pairs(Y)
                        do
                            if not K[Y] and not I[Y] then
                                J(Y)
                                I[Y] = true task.wait(0.08)
                            end
                            end
                        end
                    end)
                pcall(function ()
                    local Y = j.Character
                    if Y then
                        for Y, L in ipairs(Y:GetChildren())
                        do
                            if L:IsA("Tool") then
                                local Y = L:GetAttribute("PET_UUID")
                                if Y and (not K[Y] and not I[Y]) then
                                    J(Y)
                                    I[Y] = true task.wait(0.08)
                                end
                                end
                            end
                        end
                    end)
            end
            print("[Garden Auto] Startup -- clearing all equipped pets...")
            b({})
            task.wait(0.5)
            while R.EnableGardenAuto and hw
            do
                local Q, z = pcall(function ()
                    local Q = nil pcall(function ()
                        Q = X:GetData()
                    end)
                    local z = x(Q)
                    local function C()
                        z = {}
                        local K = j.Character
                        if K then
                            for K, Y in ipairs(K:GetChildren())
                            do
                                if Y:IsA("Tool") then
                                    local K = Y:GetAttribute("PET_UUID")
                                    if K then
                                        z[K] = true
                                    end
                                    end
                                end
                            end
                        end
                    local function l(Y)
                        local I = {}
                        if K then
                            I[K] = true
                        end
                        for K, Y in ipairs(Y or {})
                        do
                            I[Y] = true
                        end
                        b(I, Q)
                        C()
                    end
                    local function r(I, L)
                        local S = {}
                        for K, Y in ipairs(L)
                        do
                            S[Y] = true
                        end
                        if R.GardenSmartSwap then
                            for K, Y in ipairs(I)
                            do
                                if not S[Y] then
                                    J(Y)
                                    task.wait(0.1)
                                end
                                end
                            task.wait(0.2)
                        else
                            for K, Y in ipairs(I)
                            do
                                J(Y)
                                task.wait(0.1)
                            end
                            task.wait(0.3)
                        end
                        C()
                        if K and not M(K, z) then
                            if p(L) > 0 then
                                print(string.format("[Garden Auto] [%s] swapTeam -> equipping TARGET %s", Y, K))
                                W(K)
                                task.wait(0.2)
                            else
                                warn(string.format("[Garden Auto] swapTeam: no free slot for target %s (toTeam size=%d)", string.sub(K, 1, 6), #L))
                            end
                            end
                        for K, I in ipairs(L)
                        do
                            if not M(I, z) then
                                print(string.format("[Garden Auto] [%s] swapTeam -> equipping TEAM pet %s", Y, I))
                                W(I)
                                task.wait(0.1)
                            end
                            end
                        C()
                        local E = {}
                        local j = {}
                        for K, Y in ipairs(L)
                        do
                            if not j[Y] then
                                table.insert(E, Y)
                                j[Y] = true
                            end
                            end
                        for K, Y in ipairs(I)
                        do
                            if not j[Y] then
                                table.insert(E, Y)
                                j[Y] = true
                            end
                            end
                        l(E)
                    end
                    local function g(Y)
                        for K, Y in ipairs(Y or {})
                        do
                            J(Y)
                            task.wait(0.1)
                        end
                        if K then
                            J(K)
                            task.wait(0.3)
                        end
                        C()
                    end
                    local function Z(I)
                        if K and not M(K, z) then
                            if p(I) > 382512342 % (3608607) then
                                print(string.format("[Garden Auto] [%s] steadyState -> equipping TARGET %s", Y, K))
                                W(K)
                                task.wait(0.1)
                            else
                                warn(string.format("[Garden Auto] No free slot for target %s (team size=%d)", string.sub(K, 1, 6), #I))
                            end
                            end
                        for K, I in ipairs(I)
                        do
                            if not M(I, z) then
                                print(string.format("[Garden Auto] [%s] steadyState -> equipping TEAM pet %s", Y, I))
                                W(I)
                                task.wait(0.1)
                            end
                            end
                        end
                    local function y(K)
                        if R.GardenAgeBoostOnly then
                            return "AgeBoost"
                        end
                        local Y = tonumber(R.GardenSwapLimitAge) or 100
                        return (K >= Y) and "ElephantBoost" or "AgeBoost"
                    end
                    if R.GardenBatchMaxLevel and R.GardenEnableMaxLevel then
                        if not E then
                            local K = true
                            for Y, I in ipairs(R.GardenTargetPetUUIDs)
                            do
                                if not L[I] and not T(I, Q) then
                                    K = false
                                    break
                                end
                                end
                            if K and #R.GardenTargetPetUUIDs > 0 then
                                S = {}
                                for K, Y in ipairs(R.GardenTargetPetUUIDs)
                                do
                                    if not B(Y, Q) then
                                        local K = O(Y, Q)
                                        local I = 0
                                        if K then
                                            local Y = K.PetData or {}
                                            I = tonumber(Y.Level or Y.Age or Y.PetAge or Y.AgeLevel) or 0
                                        end
                                        table.insert(S, {uuid = Y, lvl = I})
                                    end
                                    end
                                table.sort(S, function (K, Y)
                                    return K.lvl > Y.lvl
                                end)
                                E = true D:Notify(string.format("\240\159\147\166 Batch KG done! Starting Max Level phase on %d pets.", #S), 5)
                                print(string.format("[Garden Auto] Batch Max Level: %d pets queued", #S))
                            end
                            end
                        if E then
                            while #S > 0 and B(S[1].uuid, Q)
                            do
                                local L = table.remove(S, 1)
                                D:Notify(string.format("\226\173\144 %s reached age %d! Moving on.", string.sub(L.uuid, 1, 6), tonumber(R.GardenMaxAge) or 500), 4)
                                print(string.format("[Garden Auto] Batch Max Level: %s maxed, removed from queue.", string.sub(L.uuid, 1, 6)))
                                if K == L.uuid then
                                    local L = (Y == "MaxTeamBoost") and R.GardenMaxTeamUUIDs or R.GardenAgeTeamUUIDs
                                    g(L)
                                    K = nil Y = "Idle"
                                    I = nil
                                end
                                task.wait(0.3)
                            end
                            if #S == 0 then
                                D:Notify("\226\156\133 All pets maxed! Automation complete.", 5)
                                R.EnableGardenAuto = false d()
                                pcall(function ()
                                    Toggles.EnableGardenAuto:SetValue(false)
                                end)
                                return
                            end
                            local L = S[1]
                            if K ~= L.uuid then
                                if K then
                                    local K = (Y == "MaxTeamBoost") and R.GardenMaxTeamUUIDs or R.GardenAgeTeamUUIDs
                                    g(K)
                                    task.wait(0.3)
                                end
                                K = L.uuid
                                Y = "Idle"
                                I = nil _G.GardenActiveTargetUUID = K
                                local S = R.GardenAgeTeamUUIDs
                                if p(S) > 0 then
                                    W(K)
                                    task.wait(0.3)
                                else
                                    warn(string.format("[Garden Auto] Batch: no free slot for new target %s (team size=%d)", string.sub(K, 1, 6), #S))
                                end
                                D:Notify(string.format("\226\173\144 Max Leveling: %s", string.sub(K, 1, 6)), 3)
                            end
                            local E = O(K, Q)
                            if not E then
                                table.remove(S, 1)
                                K = nil Y = "Idle"
                                return
                            end
                            local j = E.PetData or {}
                            local T = tonumber(j.Level or j.Age or j.PetAge or j.AgeLevel) or 0
                            local J = tonumber(R.GardenMaxLevelSwapAge) or -47528 + (47608)
                            if Y == "Idle" then
                                Y = (T >= J) and "MaxTeamBoost" or "MaxAgeBoost"
                                _G.GardenActivePhase = Y
                                if Y == "MaxTeamBoost" then
                                    Z(R.GardenMaxTeamUUIDs)
                                else
                                    Z(R.GardenAgeTeamUUIDs)
                                end
                                elseif Y == "MaxAgeBoost" then
                                if T >= J then
                                    D:Notify(string.format("\226\173\144 Age %d reached swap point -> Max Age Team!", J), 3)
                                    Y = "MaxTeamBoost"
                                    _G.GardenActivePhase = "MaxTeamBoost"
                                    r(R.GardenAgeTeamUUIDs, R.GardenMaxTeamUUIDs)
                                else
                                    Z(R.GardenAgeTeamUUIDs)
                                end
                                elseif Y == "MaxTeamBoost" then
                                local L = tonumber(R.GardenMaxAge) or -1248028
                                if T >= L then
                                    D:Notify(string.format("\226\173\144 %s reached age %d! Unequipping.", string.sub(K, 1, 6), L), 4)
                                    g(R.GardenMaxTeamUUIDs)
                                    table.remove(S, 1)
                                    K = nil Y = "Idle"
                                    I = nil
                                else
                                    Z(R.GardenMaxTeamUUIDs)
                                end
                                end
                            return
                        end
                        end
                    if not K or (T(K, Q) and (Y ~= "MaxAgeBoost" and Y ~= "MaxTeamBoost")) then
                        if K and T(K, Q) then
                            L[K] = true
                            if R.GardenEnableMaxLevel and not R.GardenBatchMaxLevel then
                                local L = (Y == "ElephantBoost") and R.GardenElephantUUIDs or R.GardenAgeTeamUUIDs
                                r(L, R.GardenAgeTeamUUIDs)
                                Y = "MaxAgeBoost"
                                _G.GardenActivePhase = "Max Age Boost"
                                I = nil D:Notify(string.format("\226\156\133 %s KG done! Starting Max Level phase.", string.sub(K, 1, 6)), 4)
                                print(string.format("[Garden Auto] KG done -> MaxAgeBoost for %s", string.sub(K, 1, 6)))
                                return
                            else
                                local I = (Y == "ElephantBoost") and R.GardenElephantUUIDs or R.GardenAgeTeamUUIDs
                                g(I)
                                D:Notify(string.format("\226\156\133 %s KG done! Moving to next target.", string.sub(K, 1, 6)), 4)
                                task.wait(0.5)
                            end
                            elseif K then
                            local K = (Y == "ElephantBoost") and R.GardenElephantUUIDs or R.GardenAgeTeamUUIDs
                            g(K)
                            task.wait(0.5)
                        end
                        K = nil Y = "Idle"
                        I = nil _G.GardenActiveTargetUUID = nil _G.GardenActivePhase = "Idle"
                        for S, E in ipairs(R.GardenTargetPetUUIDs)
                        do
                            if not T(E, Q) and not L[E] then
                                K = E
                                _G.GardenActiveTargetUUID = E
                                Y = "Idle"
                                _G.GardenActivePhase = "Idle"
                                I = nil D:Notify("\240\159\140\177 New Garden Target: "..string.sub(E, 1, 6), 3)
                                print(string.format("[Garden Auto] New KG target: %s", string.sub(E, 1, 6)))
                                break
                            end
                            end
                        end
                    if K and ((Y == "MaxAgeBoost" or Y == "MaxTeamBoost")) then
                        local L = O(K, Q)
                        if not L then
                            J(K)
                            K = nil Y = "Idle"
                            return
                        end
                        local S = L.PetData or {}
                        local E = tonumber(S.Level or S.Age or S.PetAge or S.AgeLevel) or -382846 + (382846)
                        local j = tonumber(R.GardenMaxLevelSwapAge) or (1481041330) % 5924165
                        if Y == "MaxAgeBoost" then
                            if E >= j then
                                D:Notify(string.format("\226\173\144 Age %d -> swapping to Max Age Team!", j), 3)
                                print(string.format("[Garden Auto] MaxAgeBoost->MaxTeamBoost at lvl=%d", E))
                                Y = "MaxTeamBoost"
                                _G.GardenActivePhase = "Max Team Boost"
                                r(R.GardenAgeTeamUUIDs, R.GardenMaxTeamUUIDs)
                            else
                                Z(R.GardenAgeTeamUUIDs)
                            end
                            elseif Y == "MaxTeamBoost" then
                            local L = tonumber(R.GardenMaxAge) or 500
                            if E >= L then
                                D:Notify(string.format("\226\173\144 %s reached age %d! Unequipping.", string.sub(K, 1, 6), L), 4)
                                print(string.format("[Garden Auto] MaxTeamBoost complete for %s", string.sub(K, 1, 6)))
                                g(R.GardenMaxTeamUUIDs)
                                task.wait(0.4)
                                K = nil Y = "Idle"
                                I = nil _G.GardenActiveTargetUUID = nil _G.GardenActivePhase = "Idle"
                            else
                                Z(R.GardenMaxTeamUUIDs)
                            end
                            end
                        return
                    end
                    if not K then
                        local K = false
                        for Y, I in ipairs(R.GardenTargetPetUUIDs)
                        do
                            if not T(I, Q) and not L[I] then
                                K = true
                                break
                            end
                            end
                        if not K then
                            if R.GardenBatchMaxLevel and R.GardenEnableMaxLevel then
                                return
                            end
                            D:Notify("\226\156\133 All targets complete! Automation stopped.", 5)
                            R.EnableGardenAuto = false d()
                            pcall(function ()
                                Toggles.EnableGardenAuto:SetValue(false)
                            end)
                        end
                        return
                    end
                    local q = O(K, Q)
                    if not q then
                        J(K)
                        K = nil
                        return
                    end
                    local F = q.PetData or {}
                    local N = tonumber(F.Level or F.Age or F.PetAge or F.AgeLevel) or 0
                    local G = tonumber(F.BaseWeight) or 106091 - (233580843) % (4405184)
                    local a = G * 1.1
                    if a >= R.GardenTargetWeight then
                        L[K] = true
                        if R.GardenEnableMaxLevel and not R.GardenBatchMaxLevel then
                            local L = (Y == "ElephantBoost") and R.GardenElephantUUIDs or R.GardenAgeTeamUUIDs
                            r(L, R.GardenAgeTeamUUIDs)
                            Y = "MaxAgeBoost"
                            _G.GardenActivePhase = "Max Age Boost"
                            I = nil D:Notify(string.format("\226\156\133 %s hit KG target! Entering Max Level phase.", string.sub(K, 1, 6)), 4)
                        else
                            local L = (Y == "ElephantBoost") and R.GardenElephantUUIDs or R.GardenAgeTeamUUIDs
                            g(L)
                            D:Notify(string.format("\226\156\133 %s hit KG target!", string.sub(K, 1, 6)), 4)
                            K = nil Y = "Idle"
                            I = nil _G.GardenActiveTargetUUID = nil _G.GardenActivePhase = "Idle"
                        end
                        return
                    end
                    if Y == "Idle" then
                        local K = y(N)
                        Y = K
                        _G.GardenActivePhase = (K == "ElephantBoost") and "Elephant Boost" or "Age Boost"
                        if K == "ElephantBoost" then
                            I = N
                        end
                        print(string.format("[Garden Auto] Phase init -> %s (lvl=%d)", K, N))
                    end
                    if Y == "AgeBoost" then
                        local K = tonumber(R.GardenSwapLimitAge) or -215845 - (-215945)
                        if not R.GardenAgeBoostOnly and N >= K then
                            Y = "ElephantBoost"
                            _G.GardenActivePhase = "Elephant Boost"
                            I = N
                            D:Notify(string.format("\240\159\144\152 Age %d -> Elephant Team!", K), 3)
                            r(R.GardenAgeTeamUUIDs, R.GardenElephantUUIDs)
                        else
                            Z(R.GardenAgeTeamUUIDs)
                        end
                        elseif Y == "ElephantBoost" then
                        if not I then
                            I = N
                        elseif N < I then
                            D:Notify(string.format("\226\156\133 Jumbo Blessing! Age %d->%d. Back to Age Team.", I, N), 3)
                            Y = "AgeBoost"
                            _G.GardenActivePhase = "Age Boost"
                            I = nil r(R.GardenElephantUUIDs, R.GardenAgeTeamUUIDs)
                        else
                            Z(R.GardenElephantUUIDs)
                            I = N
                        end
                        end
                    end)
                if not Q then
                    warn("[Garden Auto] Loop Error: "..tostring(z))
                end
                task.wait(2)
            end
            _G.GardenActiveTargetUUID = nil _G.GardenActivePhase = "Idle"
            hw = false print("===== [Garden Auto] Loop STOPPED =====")
        end)
    end
    JD.SettingsTab = WD:AddTab("SETTINGS", "settings")
    JD.WebhookGroup = JD.SettingsTab:AddLeftGroupbox("Discord Webhook")
    W.StyleGroupboxPanel(JD.WebhookGroup)
    JD.WebhookGroup:AddInput("WebhookURLInput", {Text = "Webhook URL", Default = R.WebhookURL, Placeholder = "https://discord.com/api/webhooks/..."})
    JD.WebhookGroup:AddToggle("WebhookEnabled", {Text = "Enable Claim Notifications";
    Default = R.WebhookEnabled;
    Tooltip = "Send a Discord webhook when a pet is claimed from the age break machine"})
    JD.WebhookGroup:AddDivider()
    W.MakeButtonPanel(JD.WebhookGroup, "WebhookButtonsPanel", {{"\240\159\148\148 Test Webhook", function ()
        local K = R.WebhookURL
        if K == "" or not K:find("discord.com") then
            D:Notify("Please enter a valid Discord webhook URL.", 3)
            return
        end
        local Y = I:JSONEncode({content = "\240\159\155\160\239\184\143 **TOMI HUB AgeBreak - Connection Test**";
        embeds = {{title = "\226\156\133 Webhook Linked Successfully!", description = "AgeBreak will now send claim notifications to this channel.", color = 65280, footer = {text = "TOMI HUB AgeBreak * "..os.date("%m/%d/%Y %I:%M %p")}}}})
        local L = syn and syn.request or http_request or request or http.request
        if L then
            local I, S = pcall(function ()
                L({Url = K, Method = "POST";
                Headers = {["Content-Type"] = "application/json"}, Body = Y})
            end)
            if I then
                D:Notify("Webhook test sent! Check Discord.", 3)
            else
                D:Notify("Failed: "..tostring(S), 3)
            end
            else
            D:Notify("Executor doesn\'t support HTTP requests.", 3)
        end
        end}})
    JD.NotifBox = JD.SettingsTab:AddLeftGroupbox("Notification Options")
    W.StyleGroupboxPanel(JD.NotifBox)
    JD.NotifBox:AddToggle("CompactNotifToggle", {Text = "\240\159\151\156\239\184\143 Compact Notifications", Default = false;
    Tooltip = "Rewrites verbose game notifications into short compact text before they render on screen. The game\'s own [X2] stacking still works normally."})
    JD.DevToolsBox = JD.SettingsTab:AddRightGroupbox("Dev Tools")
    W.StyleGroupboxPanel(JD.DevToolsBox)
    W.MakeButtonPanel(JD.DevToolsBox, "DevToolsButtonsPanel", {{"\240\159\148\141 Load DEX Explorer", function ()
        D:Notify("Loading DEX Explorer...", 3)
        pcall(function ()
            (loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/download/stable-3.0/out.lua")))()
        end)
    end}, {"\240\159\149\181\239\184\143 Load Remote Spy";
    function ()
        D:Notify("Loading Remote Spy...", 3)
        pcall(function ()
            (loadstring(game:HttpGet("https://raw.githubusercontent.com/Klinac/scripts/main/utopia_spy.lua", true)))()
        end)
    end}})
    JD.StuckVFXBox = JD.SettingsTab:AddRightGroupbox("Remove Stuck Visuals")
    W.StyleGroupboxPanel(JD.StuckVFXBox)
    JD.StuckVFXBox:AddToggle("RemoveStuckVFX", {Text = "\240\159\167\185 Remove Stuck Zone VFX";
    Default = false;
    Tooltip = "Watches workspace.PetZoneAbilityVFX and removes Zone instances that have been sitting there for more than 3 seconds. PnP briefly creates zones that vanish on their own -- only the ones that outlive that window get deleted."})
    do
        local K = "PetZoneAbilityVFX"
        local Y = -168900 + (168903)
        local I = -455668 - (-455670)
        local L = {}
        task.spawn(function ()
            while true
            do
                task.wait(I)
                if not ((Toggles and (Toggles.RemoveStuckVFX and Toggles.RemoveStuckVFX.Value))) then
                    for K in next, L
                    do
                        L[K] = nil
                    end
                    else
                    pcall(function ()
                        local I = workspace:FindFirstChild(K)
                        if not I then
                            return
                        end
                        local S = tick()
                        local E = {}
                        for K, I in ipairs(I:GetChildren())
                        do
                            if I:IsA("Model") or I:IsA("BasePart") or I:IsA("Folder") or I.Name == "Zone" then
                                E[I] = true
                                if not L[I] then
                                    L[I] = S
                                elseif S - L[I] >= Y then
                                    L[I] = nil pcall(function ()
                                        I:Destroy()
                                    end)
                                end
                                end
                            end
                        for K in next, L
                        do
                            if not E[K] then
                                L[K] = nil
                            end
                            end
                        end)
                end
                end
            end)
    end
    local Y8 = D:AddDraggableButton("TOMI HUB", function ()
        D:Toggle()
    end)
    Y8.Button.Size = UDim2.fromOffset(120, 36)
    Y8.Button.TextSize = -716175 - (-716192)
    do
        local K = D:GetIcon("clover")
        if K then
            local Y = Instance.new("UIPadding")
            Y.PaddingLeft = UDim.new(0, 35)
            Y.PaddingRight = UDim.new(0, 6)
            Y.Parent = Y8.Button
            local I = Instance.new("ImageLabel")
            I.Name = "clover"
            I.AnchorPoint = Vector2.new(0, 0.5)
            I.Size = UDim2.fromOffset(22, 22)
            I.Position = UDim2.new(0, -24, 0.5, 0)
            I.BackgroundTransparency = -508954 - (-508955)
            I.Image = K.Url
            I.ImageRectOffset = K.ImageRectOffset
            I.ImageRectSize = K.ImageRectSize
            I.ImageColor3 = Color3.fromRGB(255, 255, 255)
            I.ZIndex = 10
            I.Parent = Y8.Button
            task.spawn(function ()
                task.wait(0.2)
                I.ImageColor3 = Color3.fromRGB(255, 255, 255)
            end)
        end
        end
    local I8 = D.Options
    local L8 = D.Toggles
    D.Options.PnPPetMultiSelect:OnChanged(function ()
        AD()
        local K = {}
        for Y in pairs(aD)
        do
            table.insert(K, Y)
        end
        table.sort(K)
        R.PnPPets = K
        d()
    end)
    D.Options.PnPPetTimerInput:OnChanged(function ()
        local K = tonumber(D.Options.PnPPetTimerInput.Value)
        if K and K >= 0 then
            R.PnPPetTimer = K
            d()
        end
        end)
    D.Options.PnPDelayUnequipInput:OnChanged(function ()
        local K = tonumber(D.Options.PnPDelayUnequipInput.Value)
        if K and K >= 0 then
            R.PnPDelayUnequip = K
            d()
        end
        end)
    D.Options.PnPDelayEquipInput:OnChanged(function ()
        local K = tonumber(D.Options.PnPDelayEquipInput.Value)
        if K and K >= 0 then
            R.PnPDelayEquip = K
            d()
        end
        end)
    D.Toggles.EnablePetPnPToggle:OnChanged(function (K)
        R.EnablePetPnP = K
        d()
        if K then
            AD()
            local K = -663280 - (-663280)
            for Y in next, aD
            do
                K = K + 1802457833 % (9436952)
            end
            if K == 0 then
                b("\226\154\160\239\184\143 Select at least one pet in the PnP dropdown first!", 4)
                D.Toggles.EnablePetPnPToggle:SetValue(false)
                R.EnablePetPnP = false
                return
            end
            D:Notify("\226\154\161 Pick & Place started!", 3)
            if R.PnPUseThreading then
                cD()
            else
                mD()
            end
            else
            if R.PnPUseThreading then
                HD()
            else
                OD()
            end
            end
        end)
    D.Toggles.PnPUseThreadingToggle:OnChanged(function (K)
        R.PnPUseThreading = K
        d()
        if R.EnablePetPnP then
            D:Notify("\240\159\148\132 Restarting PnP with "..(((K and "threaded" or "sequential")).." mode..."), 3)
            if K then
                OD()
                task.wait(0.2)
                cD()
            else
                HD()
                task.wait(0.2)
                mD()
            end
            end
        end)
    L8.TradingAutoAccept:OnChanged(function (K)
        R.AutoAcceptTrade = K
        d()
        iw()
        if K then
            ww()
        end
        end)
    L8.TradingAutoAcceptToggle:OnChanged(function (K)
        R.AutoConfirmAccept = K
        d()
        tw()
        if K then
            ow()
        end
        end)
    L8.TradingAutoSend:OnChanged(function (K)
        R.AutoSendTicket = K
        d()
        if K then
            Fw = false
            if not R.AutoGiftMode then
                mw()
            end
            D:Notify("\240\159\146\172 Auto Send Ticket: ON", 3)
        else
            if not R.AutoGiftMode then
                Zw = false Fw = false yw = false
            end
            D:Notify("\240\159\146\172 Auto Send Ticket: OFF", 2)
        end
        end)
    L8.TradingEnableTicket:OnChanged(function (K)
        R.EnableTradeTicket = K
        d()
        if K then
            if not Zw then
                Uw()
                Vw("toggle enabled")
            end
            D:Notify("\240\159\142\171 Enable Trade Ticket: ON -- Items will be added when trade opens.", 3)
        else
            Nw = false vw()
            D:Notify("\240\159\142\171 Enable Trade Ticket: OFF", 2)
        end
        end)
    L8.TradingAutoGift:OnChanged(function (K)
        R.AutoGiftMode = K
        d()
        if K then
            vw()
            D:Notify("\240\159\148\129 Auto Trade: ON", 3)
            if not Zw then
                Gw = 1
                Pw()
            end
            else
            Zw = false yw = false Fw = false aw = false
            if R.EnableTradeTicket then
                Uw()
            end
            D:Notify("\240\159\148\129 Auto Trade: OFF", 2)
        end
        end)
    L8.TradingHoldUntilNearFull:OnChanged(function (K)
        R.HoldUntilNearFull = K
        d()
        if K then
            D:Notify("\240\159\147\166 Near-Full Gate ON -- will wait until 92% capacity.", 4)
        else
            D:Notify("\240\159\147\166 Near-Full Gate OFF -- trading freely.", 3)
            pcall(function ()
                D.Labels.TradingCapacityStatus:SetText("\240\159\148\139 Capacity: (gate disabled)")
            end)
        end
        end)
    local function S8(K, Y)
        if K.isAgebreak then
            return 0
        end
        if Y[K.uuid] then
            local Y = K.isFavorite
            local I = ((K.level or 0)) >= -755 - (-855)
            if Y and I then
                return -920573 + (920574)
            end
            if Y then
                return (330024257) % 5156629
            end
            if I then
                return (395593) + -395592
            end
            return -169293
        end
        local I = K.isFavorite
        local L = ((K.level or 0)) >= -678341 - (-678441)
        if I and L then
            return 2
        end
        if I then
            return 548952 + (-548949)
        end
        if L then
            return -389582 - (-389586)
        end
        return 5
    end
    local function E8(K, Y)
        table.sort(K, function (K, I)
            local L = S8(K, Y)
            local S = S8(I, Y)
            if L ~= S then
                return L < S
            end
            if ((K.level or 0)) ~= ((I.level or (136117503) % 1564569)) then
                return ((K.level or 0)) > ((I.level or 0))
            end
            return K.label < I.label
        end)
    end
    local function j8(K)
        local Y = {}
        for K, I in ipairs(K or {})
        do
            local L = h(I)
            if L then
                Y[L] = true
            end
            end
        return Y
    end
    local function T8(K)
        local Y = {}
        for K, I in ipairs(K or {})
        do
            local L = KD(I)
            if L then
                Y[L] = true
            end
            end
        return Y
    end
    LD = function ()
        if BD then
            return
        end
        BD = true
        local K = {}
        for Y, I in ipairs(R.GardenTargetPetUUIDs)
        do
            K[I] = true
        end
        local Y = {}
        for K, I in ipairs(R.GardenAgeTeamUUIDs)
        do
            Y[I] = true
        end
        local I = {}
        for K, Y in ipairs(R.GardenElephantUUIDs)
        do
            I[Y] = true
        end
        local L = {}
        for K, Y in ipairs(R.GardenMaxTeamUUIDs)
        do
            L[Y] = true
        end
        local function S(K, Y)
            if #K > 3139374725 % (15541459) then
                local I = {}
                for Y = 1, 7, 1
                do
                    I[Y] = K[Y]
                end
                D:Notify("\226\154\160\239\184\143 "..(Y.." limit is 7 pets!"), 3)
                return I
            end
            return K
        end
        R.GardenAgeTeamUUIDs = S(R.GardenAgeTeamUUIDs, "Age Team")
        R.GardenElephantUUIDs = S(R.GardenElephantUUIDs, "Elephant Team")
        R.GardenMaxTeamUUIDs = S(R.GardenMaxTeamUUIDs, "Max Age Team")
        Y = {}
        for K, I in ipairs(R.GardenAgeTeamUUIDs)
        do
            Y[I] = true
        end
        I = {}
        for K, Y in ipairs(R.GardenElephantUUIDs)
        do
            I[Y] = true
        end
        L = {}
        for K, Y in ipairs(R.GardenMaxTeamUUIDs)
        do
            L[Y] = true
        end
        local E = {}
        for K, S in ipairs(i)
        do
            if not Y[S.uuid] and (not I[S.uuid] and not L[S.uuid]) then
                table.insert(E, S)
            end
            end
        E8(E, K)
        local j = {}
        for K, Y in ipairs(E)
        do
            table.insert(j, Y.targetLabel or Y.label)
        end
        if #j == 0 then
            table.insert(j, "No Pets Available")
        end
        local T = {}
        for Y, I in ipairs(i)
        do
            if not K[I.uuid] then
                table.insert(T, I)
            end
            end
        E8(T, Y)
        local B = {}
        for K, Y in ipairs(T)
        do
            table.insert(B, Y.label)
        end
        if #B == 0 then
            table.insert(B, "No Pets Available")
        end
        local J = {}
        for Y, I in ipairs(i)
        do
            if not K[I.uuid] then
                table.insert(J, I)
            end
            end
        E8(J, I)
        local W = {}
        for K, Y in ipairs(J)
        do
            table.insert(W, Y.label)
        end
        if #W == 0 then
            table.insert(W, "No Pets Available")
        end
        local M = {}
        for Y, I in ipairs(i)
        do
            if not K[I.uuid] then
                table.insert(M, I)
            end
            end
        E8(M, L)
        local x = {}
        for K, Y in ipairs(M)
        do
            table.insert(x, Y.label)
        end
        if #x == 0 then
            table.insert(x, "No Pets Available")
        end
        pcall(function ()
            I8.GardenTargetDropdown:SetValues(j)
            I8.GardenAgeTeamDropdown:SetValues(B)
            I8.GardenElephantDropdown:SetValues(W)
            I8.GardenMaxTeamDropdown:SetValues(x)
            I8.GardenTargetDropdown:SetValue(T8(R.GardenTargetPetUUIDs))
            I8.GardenAgeTeamDropdown:SetValue(j8(R.GardenAgeTeamUUIDs))
            I8.GardenElephantDropdown:SetValue(j8(R.GardenElephantUUIDs))
            I8.GardenMaxTeamDropdown:SetValue(j8(R.GardenMaxTeamUUIDs))
            local K = #R.GardenTargetPetUUIDs
            local Y = #R.GardenAgeTeamUUIDs
            local I = #R.GardenElephantUUIDs
            local L = #R.GardenMaxTeamUUIDs
            I8.GardenTargetDropdown:SetText(K > (530439195) % 2324673 + (-413751) and ("\240\159\142\175 Target Queue ("..(K.." selected)")) or "\240\159\142\175 Target Queue")
            I8.GardenAgeTeamDropdown:SetText(Y > 0 and ("\240\159\140\177 Age Team ("..(Y.."/7 selected)")) or "\240\159\140\177 Age Team")
            I8.GardenElephantDropdown:SetText(I > 1491074900 % (6086020) and ("\240\159\144\152 Elephant Team ("..(I.."/7 selected)")) or "\240\159\144\152 Elephant Team")
            I8.GardenMaxTeamDropdown:SetText(L > (-981410) + (981410) and ("\226\173\144 Max Age Team ("..(L.."/7 selected)")) or "\226\173\144 Max Age Team")
        end)
        BD = false
    end
    ID = function ()
        local K = {}
        for Y, I in ipairs(R.TargetPetUUIDs)
        do
            K[I] = true
        end
        local Y = {}
        for K, I in ipairs(R.DupePetUUIDs)
        do
            Y[I] = true
        end
        local I = {}
        for Y, L in ipairs(i)
        do
            if not K[L.uuid] then
                table.insert(I, L)
            end
            end
        E8(I, Y)
        local L = {}
        for K, Y in ipairs(I)
        do
            table.insert(L, Y.label)
        end
        if #L == 0 then
            table.insert(L, "No Pets Available")
        end
        local S = {}
        for K, I in ipairs(i)
        do
            if not Y[I.uuid] then
                table.insert(S, I)
            end
            end
        E8(S, K)
        local E = {}
        for K, Y in ipairs(S)
        do
            table.insert(E, Y.label)
        end
        if #E == 0 then
            table.insert(E, "No Pets Available")
        end
        I8.TargetPetsDropdown:SetValues(E)
        I8.DupePetsDropdown:SetValues(L)
        I8.TargetPetsDropdown:SetValue(YD(R.TargetPetUUIDs))
        I8.DupePetsDropdown:SetValue(YD(R.DupePetUUIDs))
        local j = #R.TargetPetUUIDs
        local T = #R.DupePetUUIDs
        I8.TargetPetsDropdown:SetText(j > -876413 - (-876413) and ("\226\153\187\239\184\143 Pet Targets ("..(j.." selected)")) or "\226\153\187\239\184\143 Pet Targets")
        I8.DupePetsDropdown:SetText(T > 0 and ("\240\159\146\128 Duplicates ("..(T.." selected)")) or "\240\159\146\128 Duplicates")
    end
    I8.TargetPetsDropdown:OnChanged(function ()
        if not n or TD then
            return
        end
        local K = I8.TargetPetsDropdown.Value
        local Y = {}
        if type(K) == "table" then
            for K, I in pairs(K)
            do
                if I then
                    local I = U(K)
                    if I then
                        table.insert(Y, I)
                    end
                    end
                end
            end
        R.TargetPetUUIDs = Y
        d()
        TD = true ID()
        TD = false
    end)
    I8.DupePetsDropdown:OnChanged(function ()
        if not n or TD then
            return
        end
        local K = I8.DupePetsDropdown.Value
        local Y = {}
        if type(K) == "table" then
            for K, I in pairs(K)
            do
                if I then
                    local I = U(K)
                    if I then
                        table.insert(Y, I)
                    end
                    end
                end
            end
        R.DupePetUUIDs = Y
        d()
        TD = true ID()
        TD = false
    end)
    L8.FlyToggle:OnChanged(function (K)
        pD = K
        if K then
            XD()
            D.Labels.FlyStatus:SetText("\240\159\149\138\239\184\143 Fly: Active (Speed: "..(bD..")"))
            D:Notify("Fly enabled!", 2)
        else
            lD()
            D.Labels.FlyStatus:SetText("\240\159\149\138\239\184\143 Fly: Off")
            D:Notify("Fly disabled.", 2)
        end
        end)
    I8.FlySpeedInput:OnChanged(function ()
        local K = tonumber(I8.FlySpeedInput.Value)
        if K and K > 0 then
            bD = K
            if pD then
                D.Labels.FlyStatus:SetText("\240\159\149\138\239\184\143 Fly: Active (Speed: "..(bD..")"))
            end
            end
        end)
    L8.NoclipToggle:OnChanged(function (K)
        MD = K
        if K then
            rD()
            D.Labels.NoclipStatus:SetText("\240\159\145\187 Noclip: Active")
            D:Notify("Noclip enabled!", 2)
        else
            gD()
            D.Labels.NoclipStatus:SetText("\240\159\145\187 Noclip: Off")
            D:Notify("Noclip disabled.", 2)
        end
        end)
    j.CharacterAdded:Connect(function ()
        if pD then
            lD()
            task.wait(1)
            XD()
        end
        if MD then
            gD()
            task.wait(0.5)
            rD()
        end
        end)
    L8.BaseWeightLimit:OnChanged(function (K)
        R.BaseWeightLimit = K
        d()
    end)
    L8.LevelLimit:OnChanged(function (K)
        R.LevelLimit = K
        d()
    end)
    L8.SkipToken:OnChanged(function (K)
        R.SkipToken = K
        d()
    end)
    I8.TargetLevelInput:OnChanged(function ()
        R.TargetLevel = tonumber(I8.TargetLevelInput.Value) or 125
        d()
    end)
    I8.LimitWeightInput:OnChanged(function ()
        R.LimitWeight = tonumber(I8.LimitWeightInput.Value) or 0
        d()
    end)
    I8.WebhookURLInput:OnChanged(function ()
        R.WebhookURL = I8.WebhookURLInput.Value
        d()
    end)
    L8.AutoTradeWorld:OnChanged(function (K)
        R.AutoTradeWorld = K
        d()
        if K then
            D.Labels.TradeAutoStatus:SetText("\240\159\159\162 Auto-Travel: Waiting 15s...")
            D:Notify("Auto Trade World enabled! Traveling in 15 seconds...", 3)
            hD = false
            if not fD then
                fD = true task.spawn(function ()
                    for K = 15, 1, -359045 - (-359044)
                    do
                        if not R.AutoTradeWorld or hD then
                            D.Labels.TradeAutoStatus:SetText("\226\143\184\239\184\143 Auto-Travel: Off")
                            fD = false
                            return
                        end
                        D.Labels.TradeAutoStatus:SetText("\226\154\160\239\184\143 Traveling in "..(K.."s..."))
                        task.wait(1)
                    end
                    if not R.AutoTradeWorld or hD then
                        D.Labels.TradeAutoStatus:SetText("\226\143\184\239\184\143 Auto-Travel: Off")
                        fD = false
                        return
                    end
                    if workspace:FindFirstChild("TradeWorld") then
                        D.Labels.TradeAutoStatus:SetText("\226\156\133 Already in Trade World")
                        D.Labels.TradeWorldStatus:SetText("\240\159\159\162 Currently in Trade World")
                        D:Notify("\226\156\133 Already in Trade World!", 3)
                        fD = false
                        return
                    end
                    if G then
                        D.Labels.TradeAutoStatus:SetText("\240\159\140\141 Teleporting...")
                        D:Notify("\240\159\140\141 Teleporting to Trade World...", 3)
                        local K, Y = pcall(function ()
                            G:FireServer()
                        end)
                        if K then
                            local K = workspace:WaitForChild("TradeWorld", 30)
                            if K then
                                D.Labels.TradeAutoStatus:SetText("\226\156\133 Arrived in Trade World")
                                D.Labels.TradeWorldStatus:SetText("\240\159\159\162 Currently in Trade World")
                                D:Notify("\226\156\133 Arrived in Trade World!", 3)
                            else
                                D.Labels.TradeAutoStatus:SetText("\226\157\140 Travel timed out")
                                D:Notify("\226\154\160\239\184\143 Travel timed out. Try again.", 5)
                                warn("[TOMI HUB] Trade World did not appear after 30s")
                            end
                            else
                            D.Labels.TradeAutoStatus:SetText("\226\157\140 Travel failed")
                            D:Notify("\226\157\140 Travel failed: "..tostring(Y), 5)
                        end
                        else
                        D.Labels.TradeAutoStatus:SetText("\226\157\140 Remote not found")
                        D:Notify("\226\157\140 Trade World remote not available!", 5)
                    end
                    fD = false
                end)
            end
            else
            hD = true D.Labels.TradeAutoStatus:SetText("\226\143\184\239\184\143 Auto-Travel: Off")
            D:Notify("Auto Trade World disabled.", 3)
        end
        end)
    L8.WebhookEnabled:OnChanged(function (K)
        R.WebhookEnabled = K
        d()
    end)
    L8.CompactNotifToggle:OnChanged(function (K)
        Q = K
        D:Notify("\240\159\148\148 Compact Notifications: "..((K and "ON" or "OFF")), 3)
    end)
    L8.EnableGardenAuto:OnChanged(function (K)
        R.EnableGardenAuto = K
        d()
        if K then
            if #R.GardenTargetPetUUIDs == 0 then
                b("\226\154\160\239\184\143 Select at least one target pet in the Garden Target Queue dropdown first!", 4)
                L8.EnableGardenAuto:SetValue(false)
                R.EnableGardenAuto = false
                return
            end
            D:Notify("\240\159\140\177 Garden Automation STARTED!", 3)
            K8()
        else
            D:Notify("\240\159\140\177 Garden Automation STOPPED.", 3)
        end
        end)
    L8.GardenSmartSwap:OnChanged(function (K)
        R.GardenSmartSwap = K
        d()
    end)
    I8.GardenTargetDropdown:OnChanged(function ()
        if not n or BD then
            return
        end
        local K = I8.GardenTargetDropdown.Value
        local Y = {}
        if type(K) == "table" then
            for K, I in pairs(K)
            do
                if I then
                    local I = U(K)
                    if I then
                        table.insert(Y, I)
                    end
                    end
                end
            end
        R.GardenTargetPetUUIDs = Y
        d()
        LD()
    end)
    I8.GardenAgeTeamDropdown:OnChanged(function ()
        if not n or BD then
            return
        end
        local K = I8.GardenAgeTeamDropdown.Value
        local Y = {}
        if type(K) == "table" then
            for K, I in pairs(K)
            do
                if I then
                    local I = U(K)
                    if I then
                        table.insert(Y, I)
                    end
                    end
                end
            end
        R.GardenAgeTeamUUIDs = Y
        d()
        LD()
    end)
    I8.GardenElephantDropdown:OnChanged(function ()
        if not n or BD then
            return
        end
        local K = I8.GardenElephantDropdown.Value
        local Y = {}
        if type(K) == "table" then
            for K, I in pairs(K)
            do
                if I then
                    local I = U(K)
                    if I then
                        table.insert(Y, I)
                    end
                    end
                end
            end
        R.GardenElephantUUIDs = Y
        d()
        LD()
    end)
    I8.GardenMaxTeamDropdown:OnChanged(function ()
        if not n or BD then
            return
        end
        local K = I8.GardenMaxTeamDropdown.Value
        local Y = {}
        if type(K) == "table" then
            for K, I in pairs(K)
            do
                if I then
                    local I = U(K)
                    if I then
                        table.insert(Y, I)
                    end
                    end
                end
            end
        if #Y > 7 then
            Y = {table.unpack(Y, 1, 7)}
            D:Notify("\226\154\160\239\184\143 Max Age Team limit is 7 pets!", 3)
        end
        R.GardenMaxTeamUUIDs = Y
        d()
        LD()
    end)
    I8.GardenSwapLimitAge:OnChanged(function ()
        local K = tonumber(I8.GardenSwapLimitAge.Value)
        if K and K > (-760459) - (-760459) then
            R.GardenSwapLimitAge = K
            d()
        end
        end)
    I8.GardenTargetWeight:OnChanged(function ()
        local K = tonumber(I8.GardenTargetWeight.Value)
        if K and K > 0 then
            R.GardenTargetWeight = K
            d()
        end
        end)
    I8.GardenMaxLevelSwapAge:OnChanged(function ()
        local K = tonumber(I8.GardenMaxLevelSwapAge.Value)
        if K and K > 0 then
            R.GardenMaxLevelSwapAge = K
            d()
        end
        end)
    L8.GardenEnableMaxLevel:OnChanged(function (K)
        R.GardenEnableMaxLevel = K
        d()
    end)
    L8.GardenBatchMaxLevel:OnChanged(function (K)
        R.GardenBatchMaxLevel = K
        d()
    end)
    L8.GardenAgeBoostOnly:OnChanged(function (K)
        R.GardenAgeBoostOnly = K
        d()
    end)
    I8.GardenMaxAgeInput:OnChanged(function ()
        local K = tonumber(I8.GardenMaxAgeInput.Value)
        R.GardenMaxAge = K and math.max(K, 1) or 500
        d()
    end)
    n = true task.defer(function ()
        TD = true ID()
        local K = YD(R.TargetPetUUIDs)
        local Y = YD(R.DupePetUUIDs)
        I8.TargetPetsDropdown:SetValue(K)
        I8.DupePetsDropdown:SetValue(Y)
        TD = false BD = true LD()
        I8.GardenTargetDropdown:SetValue(T8(R.GardenTargetPetUUIDs))
        I8.GardenAgeTeamDropdown:SetValue(j8(R.GardenAgeTeamUUIDs))
        I8.GardenElephantDropdown:SetValue(j8(R.GardenElephantUUIDs))
        I8.GardenMaxTeamDropdown:SetValue(j8(R.GardenMaxTeamUUIDs))
        BD = false
        if #FD > 0 then
            local K = {}
            for Y, I in ipairs(FD)
            do
                K[I] = true
            end
            pcall(function ()
                I8.PnPPetMultiSelect:SetValue(K)
            end)
        end
        end)
    local D8 = false
    local B8 = {}
    local function J8(K)
        local Y = O(K)
        if not Y then
            return false
        end
        local I = Y.PetData or {}
        if I.IsFavorite then
            return false
        end
        local L = I.Level or 0
        local S = I.BaseWeight or -112840 - (-112840)
        if R.BaseWeightLimit and S > 3.5 then
            return false
        end
        if R.LevelLimit and L >= 99 then
            return false
        end
        return true
    end
    local function W8(K)
        for Y, I in ipairs(R.DupePetUUIDs)
        do
            local L = O(I)
            if L and (L.PetType == K and J8(I)) then
                local K = L.PetData or {}
                return {UUID = I, PetType = L.PetType, Level = K.Level or 0, BaseWeight = K.BaseWeight or -1571026}
            end
            end
        return nil
    end
    local function M8()
        local K = 0
        local Y = 100
        pcall(function ()
            local I = X:GetData()
            if I and (I.PetsData and I.PetsData.PetInventory) then
                for Y in pairs(I.PetsData.PetInventory.Data)
                do
                    K = K + (1)
                end
                if I.PetsData.PetInventory.MaxSlots then
                    Y = I.PetsData.PetInventory.MaxSlots
                elseif I.PetsData.MaxPets then
                    Y = I.PetsData.MaxPets
                end
                end
            end)
        return K, Y
    end
    local function x8()
        local K, Y = M8()
        return K >= Y, K, Y
    end
    local function p8(K, Y)
        local I = (K >= R.TargetLevel)
        local L = (R.LimitWeight > 0 and Y >= R.LimitWeight)
        local S = true
        local E = (R.LimitWeight > 0)
        if S and E then
            return I and L
        elseif E then
            return L
        else
            return I
        end
        end
    local function b8(K, Y, L, S, E, j, T, D)
        if not R.WebhookEnabled or R.WebhookURL == "" then
            return
        end
        task.spawn(function ()
            pcall(function ()
                local B = I:JSONEncode({embeds = {{title = "\226\156\133 "..(K..(((D ~= "" and (" ("..(D..")")) or ""))..(" ["..(string.format("%.2f KG", E).."]"))));
                description = "Age Break claimed by **||"..(e.."||**"), color = 16776960, fields = {{name = "\240\159\147\138 Pet Info", value = "```ansi\n"..("\240\159\144\190 Species: "..(K..("\n"..("\226\173\144 Age/Level: "..(L..("\n"..("\226\154\150\239\184\143 Base Weight: "..(string.format("%.2f", S)..(" kg\n"..("\240\159\147\138 True Weight: "..(string.format("%.2f", E)..(" kg\n"..("\240\159\167\172 Mutation: "..(j..("\n"..(T..(((Y.IsFavorite and "Favorite" or "")).."```")))))))))))))))));
                inline = false}, {name = "\226\154\153\239\184\143 Settings", value = "```ansi\n"..("\240\159\142\175 Target Level: "..(R.TargetLevel..("\n"..("\226\154\150\239\184\143 Limit Weight: "..(((R.LimitWeight > 0 and (R.LimitWeight.." kg") or "Disabled"))..("\n"..("\226\143\173\239\184\143 Skip Token: "..(((R.SkipToken and "Enabled" or "Disabled")).."```")))))))), inline = false}};
                footer = {text = "TOMI HUB AgeBreak * "..os.date("%m/%d/%Y %I:%M %p")}}}})
                local J = syn and syn.request or http_request or request or http.request
                if J then
                    J({Url = R.WebhookURL;
                    Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = B})
                end
                end)
        end)
    end
    local function Q8()
        if not R.WebhookEnabled or R.WebhookURL == "" then
            return
        end
        task.spawn(function ()
            pcall(function ()
                local K = I:JSONEncode({embeds = {{title = "\226\156\133 Complete AgeBreak";
                description = "All target pets have reached their limits!\nAutomation has been stopped.", color = 65280;
                fields = {{name = "\226\154\153\239\184\143 Limits Used", value = "```\n"..("\240\159\142\175 Target Level: "..(R.TargetLevel..("\n"..("\226\154\150\239\184\143 Limit Weight: "..(((R.LimitWeight > 0 and (R.LimitWeight.." kg") or "Disabled"))..("\n"..("\240\159\147\139 Total Targets: "..(#R.TargetPetUUIDs.."```"))))))));
                inline = false}};
                footer = {text = "TOMI HUB AgeBreak * "..os.date("%m/%d/%Y %I:%M %p")}}}})
                local Y = syn and syn.request or http_request or request or http.request
                if Y then
                    Y({Url = R.WebhookURL;
                    Method = "POST";
                    Headers = {["Content-Type"] = "application/json"}, Body = K})
                end
                end)
        end)
    end
    local function z8()
        if D8 then
            return
        end
        D8 = true task.spawn(function ()
            print("===== Age Break Automation Started =====")
            while R.EnableAgeBreak and D8
            do
                local K, Y = pcall(function ()
                    local K = c()
                    if not K then
                        warn("Cannot read machine data. Retrying...")
                        task.wait(2)
                        return
                    end
                    if K.PetReady then
                        local Y = K.SubmittedPet
                        local I = Y and Y.UUID
                        local L = Y and Y.PetType or "Unknown"
                        local S = Y and Y.PetData or {}
                        local E = S.Level or 0
                        local j = S.BaseWeight or (3436143804) % 16090928
                        local T = s(j, E)
                        local B = t(S)
                        local J = S.IsFavorite and "\226\157\164\239\184\143 " or ""
                        local W = S.Name or ""
                        pcall(function ()
                            y:FireServer()
                        end)
                        D:Notify("Pet claimed!", 3)
                        b8(L, S, E, j, T, B, J, W)
                        if I then
                            local K = false
                            for Y = 1, 10, 1
                            do
                                task.wait(0.5)
                                if O(I) then
                                    K = true
                                    break
                                end
                                end
                            if not K then
                                warn("[AgeBreak] Claimed pet failed to replicate in 5 seconds.")
                            end
                            else
                            task.wait(1)
                        end
                        return
                    end
                    if K.IsRunning and (K.TimeLeft and K.TimeLeft > 0) then
                        if R.FastAgeBreak then
                            if not _G.TOMIHUB_FastAgeBreak.Active then
                                print("[FastAgeBreak] Machine running -- signaling TradingWorld and traveling...")
                                _G.TOMIHUB_FastAgeBreak.Active = true _G.TOMIHUB_FastAgeBreak.PetReady = false D:Notify("\226\154\161 Fast AgeBreak: Traveling in 15s...", 4)
                                local K = false
                                for Y = 15, 1, -1
                                do
                                    if not R.FastAgeBreak or not R.EnableAgeBreak then
                                        K = true
                                        break
                                    end
                                    task.wait(1)
                                end
                                if K then
                                    _G.TOMIHUB_FastAgeBreak.Active = false
                                    return
                                end
                                if G then
                                    pcall(function ()
                                        G:FireServer()
                                    end)
                                else
                                    warn("[FastAgeBreak] Travel remote not found -- cannot fast agebreak.")
                                    _G.TOMIHUB_FastAgeBreak.Active = false
                                end
                                end
                            while R.EnableAgeBreak and (R.FastAgeBreak and (_G.TOMIHUB_FastAgeBreak.Active and not _G.TOMIHUB_FastAgeBreak.PetReady))
                            do
                                task.wait(0.3)
                            end
                            if _G.TOMIHUB_FastAgeBreak.PetReady then
                                print("[FastAgeBreak] PetReady signal received -- returning to claim!")
                                _G.TOMIHUB_FastAgeBreak.Active = false _G.TOMIHUB_FastAgeBreak.PetReady = false D:Notify("\226\154\161 Fast AgeBreak: Pet ready -- claiming!", 3)
                            end
                            return
                        end
                        if R.SkipToken then
                            if K.TimeLeft <= 3 then
                                print("[AgeBreak] \226\143\179 Timer almost done (<3s), saving token...")
                                task.wait(K.TimeLeft + 0.5)
                                return
                            end
                            print("\240\159\146\142 [AgeBreak] Attempting to skip timer with Trade Token...")
                            local Y, I = pcall(function ()
                                local K = (game:GetService("ReplicatedStorage")).GameEvents.TradeEvents.TradeTokens.Purchase
                                return K:InvokeServer(3453278902)
                            end)
                            if Y then
                                print("\226\156\133 [AgeBreak] Skip Purchase Invoked! Waiting for machine to update...")
                                task.wait(2.5)
                            else
                                warn("\226\157\140 [AgeBreak] Skip Purchase Failed: "..tostring(I))
                                task.wait(5)
                            end
                            else
                            task.wait(math.min(K.TimeLeft + 1, 10))
                        end
                        return
                    end
                    if K.SubmittedPet and (not K.IsRunning and not K.PetReady) then
                        if ((K.TimeLeft or 0)) <= 1 then
                            for K = 1, 5, -825332 - (-825333)
                            do
                                task.wait(1)
                                local Y = c()
                                if Y and Y.PetReady then
                                    print("[Machine] PetReady confirmed after "..(K.."s -- claiming!"))
                                    local I = Y.SubmittedPet
                                    local L = I and I.UUID
                                    local S = I and I.PetType or "Unknown"
                                    local E = I and I.PetData or {}
                                    pcall(function ()
                                        y:FireServer()
                                    end)
                                    D:Notify("Pet claimed!", 3)
                                    b8(S, E, E.Level or 0, E.BaseWeight or 0, s(E.BaseWeight or 0, E.Level or 0), t(E), E.IsFavorite and "\226\157\164\239\184\143 " or "", E.Name or "")
                                    if L then
                                        local K = false
                                        for Y = 1, 10, 1
                                        do
                                            task.wait(0.5)
                                            if O(L) then
                                                K = true
                                                break
                                            end
                                            end
                                        if not K then
                                            warn("[AgeBreak] Claimed pet failed to replicate in 5 seconds.")
                                        end
                                        else
                                        task.wait(1)
                                    end
                                    return
                                end
                                if Y and not Y.SubmittedPet then
                                    return
                                end
                                end
                            end
                        local Y = K.SubmittedPet.PetType
                        local I = K.SubmittedPet.PetData and K.SubmittedPet.PetData.Level or -1548004
                        local L = K.SubmittedPet.PetData and K.SubmittedPet.PetData.BaseWeight or 0
                        local S = s(L, I)
                        if p8(I, S) then
                            pcall(function ()
                                q:FireServer()
                            end)
                            task.wait(1)
                            return
                        end
                        local E = W8(Y)
                        if E then
                            pcall(function ()
                                g:FireServer({E.UUID})
                            end)
                            D:Notify(string.format("Dupe: %s (Lv.%d)", E.PetType, E.Level), 2)
                            task.wait(1.5)
                        else
                            D:Notify("No valid dupes for "..Y, 3)
                            pcall(function ()
                                q:FireServer()
                            end)
                            task.wait(1)
                        end
                        return
                    end
                    if not K.SubmittedPet and not K.IsRunning then
                        local K = false
                        for Y, I in ipairs(R.TargetPetUUIDs)
                        do
                            if not R.EnableAgeBreak then
                                break
                            end
                            if ((B8[I] or 0)) < 3 then
                                local Y = O(I)
                                if Y then
                                    local L = Y.PetData or {}
                                    local S = Y.PetType or "Unknown"
                                    local E = L.Level or 0
                                    local T = L.BaseWeight or 0
                                    if not L.IsFavorite then
                                        local Y = s(T, E)
                                        if not p8(E, Y) then
                                            local Y = W8(S)
                                            if Y then
                                                local Y = P(I)
                                                if Y then
                                                    task.wait(0.5)
                                                    if not Y:GetAttribute("ITEM_UUID") then
                                                        Y:SetAttribute("ITEM_UUID", I)
                                                        task.wait(0.1)
                                                    end
                                                    if not m(I) then
                                                        warn("[AgeBreak] SAFETY: Held pet doesn\'t match target! Aborting submit.")
                                                        D:Notify("\226\154\160\239\184\143 Wrong pet held! Submission aborted.", 5)
                                                    else
                                                        local Y = c()
                                                        if Y and Y.SubmittedPet then
                                                            elseif Y then
                                                            pcall(function ()
                                                                r:FireServer()
                                                            end)
                                                            task.wait(0.5)
                                                            local Y = c()
                                                            if Y and Y.SubmittedPet then
                                                                B8[I] = -46335 - (-46335)
                                                                D:Notify(string.format("Submitted: %s (Lv.%d)", S, E), 3)
                                                                K = true
                                                                local Y = j.Character and j.Character:FindFirstChildWhichIsA("Humanoid")
                                                                if Y then
                                                                    Y:UnequipTools()
                                                                end
                                                                local L = false
                                                                for K = 1, 6, 1
                                                                do
                                                                    task.wait(0.5)
                                                                    local Y = c()
                                                                    if Y and (Y.SubmittedPet and (not Y.IsRunning and not Y.PetReady)) then
                                                                        local Y = W8(S)
                                                                        if Y then
                                                                            print(string.format("[AgeBreak] Fast-dupe: %s (Lv.%d) [attempt %d]", Y.PetType, Y.Level, K))
                                                                            pcall(function ()
                                                                                g:FireServer({Y.UUID})
                                                                            end)
                                                                            D:Notify(string.format("Dupe: %s (Lv.%d)", Y.PetType, Y.Level), 2)
                                                                            L = true
                                                                        end
                                                                        break
                                                                    end
                                                                    end
                                                                if not L then
                                                                    warn("[AgeBreak] No dupe submitted after success.")
                                                                end
                                                                task.wait(1)
                                                                break
                                                            else
                                                                B8[I] = ((B8[I] or 0)) + (1)
                                                                local K = B8[I]
                                                                warn(string.format("[AgeBreak] Submit FAILED for %s (%d consecutive failures)", S, K))
                                                                if K >= 3 then
                                                                    D:Notify(string.format("\226\154\160\239\184\143 %s failed %dx -- skipping to next pet", S, K), 5)
                                                                end
                                                                end
                                                            end
                                                        end
                                                    if not K then
                                                        local K = j.Character and j.Character:FindFirstChildWhichIsA("Humanoid")
                                                        if K then
                                                            K:UnequipTools()
                                                        end
                                                        end
                                                    task.wait(0.5)
                                                    break
                                                end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        if not K then
                            local K = true
                            for Y, I in ipairs(R.TargetPetUUIDs)
                            do
                                local L = O(I)
                                if L then
                                    local Y = L.PetData or {}
                                    local S = Y.Level or 0
                                    local E = Y.BaseWeight or 501198 + (-501198)
                                    local j = s(E, S)
                                    if not p8(S, j) and (not Y.IsFavorite and ((B8[I] or 0)) < 3) then
                                        K = false
                                        break
                                    end
                                    end
                                end
                            if K and #R.TargetPetUUIDs > 0 then
                                print("[AgeBreak] All target pets have reached their limits -- stopping automation!")
                                R.EnableAgeBreak = false d()
                                L8.EnableAgeBreak:SetValue(false)
                                D:Notify("\226\156\133 All targets complete! AgeBreak stopped.", 8)
                                Q8()
                                return
                            end
                            local Y = true
                            local I = 0
                            for K, Y in ipairs(R.DupePetUUIDs)
                            do
                                if J8(Y) then
                                    I = I + 1303090110 % (8299937)
                                end
                                end
                            if I == 0 and #R.DupePetUUIDs > 0 then
                                print("[AgeBreak] No valid dupes remaining -- stopping automation!")
                                R.EnableAgeBreak = false d()
                                L8.EnableAgeBreak:SetValue(false)
                                D:Notify("\226\154\160\239\184\143 No dupes remaining! AgeBreak stopped.", 8)
                                Q8()
                                return
                            elseif #R.DupePetUUIDs == 0 then
                                print("[AgeBreak] No dupes selected -- stopping automation!")
                                R.EnableAgeBreak = false d()
                                L8.EnableAgeBreak:SetValue(false)
                                D:Notify("\226\154\160\239\184\143 No dupes selected! AgeBreak stopped.", 8)
                                return
                            end
                            D:Notify("No valid targets available.", 5)
                            task.wait(5)
                        end
                        return
                    end
                    end)
                if not K then
                    warn("[AgeBreak] Loop error (auto-recovering): "..tostring(Y))
                end
                task.wait(R.FastAgeBreak and .3 or (353274662) % 5887911)
            end
            D8 = false print("===== Age Break Automation Stopped =====")
        end)
    end
    L8.EnableAgeBreak:OnChanged(function (K)
        R.EnableAgeBreak = K
        d()
        if K then
            D:Notify("Age Break STARTED!", 3)
            z8()
        else
            D8 = false _G.TOMIHUB_FastAgeBreak.Active = false _G.TOMIHUB_FastAgeBreak.PetReady = false D:Notify("Age Break STOPPED.", 3)
        end
        end)
    L8.FastAgeBreakToggle:OnChanged(function (K)
        R.FastAgeBreak = K
        d()
        if not K then
            _G.TOMIHUB_FastAgeBreak.Active = false _G.TOMIHUB_FastAgeBreak.PetReady = false print("[FastAgeBreak] Disabled -- hop cycle cleared.")
        end
        end)
    j.Idled:Connect(function ()
        pcall(function ()
            local K = game:GetService("VirtualUser")
            K:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            task.wait(0.5)
            K:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
    end)
    task.spawn(function ()
        local K = game:GetService("VirtualUser")
        while task.wait(300)
        do
            pcall(function ()
                K:CaptureController()
                K:ClickButton2(Vector2.new())
            end)
        end
        end)
    if R.EnablePetPnP then
        task.defer(function ()
            task.wait(4)
            pcall(function ()
                D.Toggles.EnablePetPnPToggle:SetValue(true)
            end)
        end)
    end
    print("[TOMI HUB] AgeBreak loaded for "..(e..(" (ID:"..(k..")"))))
    D:Notify("TOMI HUB loaded! Config: "..(e.." | Press LeftCtrl to toggle."), 5)
    if R.EnableAgeBreak then
        z8()
    end
    if R.EnableGardenAuto then
        K8()
    end
    if R.AutoTradeWorld then
        task.defer(function ()
            task.wait(1)
            L8.AutoTradeWorld:SetValue(true)
        end)
    end
    task.defer(function ()
        task.wait(2)
        if R.AutoAcceptTrade then
            pcall(function ()
                L8.TradingAutoAccept:SetValue(true)
            end)
        end
        if R.AutoConfirmAccept then
            pcall(function ()
                L8.TradingAutoAcceptToggle:SetValue(true)
            end)
        end
        if R.EnableTradeTicket then
            pcall(function ()
                L8.TradingEnableTicket:SetValue(true)
            end)
        end
        if R.AutoSendTicket then
            pcall(function ()
                L8.TradingAutoSend:SetValue(true)
            end)
        end
        if R.AutoGiftMode then
            pcall(function ()
                L8.TradingAutoGift:SetValue(true)
            end)
        end
        end)
    task.defer(function ()
        task.wait(1)
        local K = D.ScreenGui or D.Root or D.Main
        if not K then
            pcall(function ()
                for Y, I in pairs(j.PlayerGui:GetChildren())
                do
                    if I:IsA("ScreenGui") and ((I.Name:find("Obsidian") or I.Name:find("TOMI HUB"))) then
                        K = I
                        break
                    end
                    end
                end)
        end
        if K then
            for K, Y in pairs(K:GetDescendants())
            do
                if Y:IsA("TextBox") then
                    Y.TextScaled = false Y.TextSize = 14
                    Y.TextTruncate = Enum.TextTruncate.AtEnd
                    if Y.Parent then
                        Y.Parent.ClipsDescendants = true
                    end
                    end
                end
            K.DescendantAdded:Connect(function (K)
                if K:IsA("TextBox") then
                    task.defer(function ()
                        K.TextScaled = false K.TextSize = (-914780) - (-914794)
                        K.TextTruncate = Enum.TextTruncate.AtEnd
                        if K.Parent then
                            K.Parent.ClipsDescendants = true
                        end
                        end)
                end
                end)
        end
        end)
    do
        local K = {"TargetPetsDropdown", "DupePetsDropdown";
        "PnPPetMultiSelect";
        "TradingPetDropdown", "TradingHoldableDropdown";
        "TradingTargetPlayer", "SellPetTypeDropdown", "GardenTargetDropdown";
        "GardenAgeTeamDropdown", "GardenElephantDropdown", "GardenMaxTeamDropdown"}
        for K, Y in ipairs(K)
        do
            local I = D.Options[Y]
            if I then
                pcall(W.AttachOverlayToDropdown, I)
            end
            end
        end
    do
        local function K(K, Y)
            task.spawn(J, K, Y)
        end
        K(JD.PlayerBox, false)
        K(JD.ServerBox, false)
        K(JD.UtilStatusBox, false)
        K(JD.BackpackBox, false)
        K(JD.MainGroup, false)
        K(JD.StatusGroup, false)
        K(JD.PnPBox, false)
        K(JD.PnPStatusBox, false)
        K(JD.TradeGroup, false)
        K(JD.TradeStatusGroup, false)
        K(JD.TradingToggleGroup, false)
        K(JD.TradingSelectGroup, false)
        K(JD.TradingStatusGroup, false)
        K(JD.GardenConfigGroup, false)
        K(JD.GardenStatusGroup, false)
        K(JD.WebhookGroup, false)
        K(JD.NotifBox, false)
        K(JD.DevToolsBox, false)
        K(JD.StuckVFXBox, false)
    end
    end)(...)