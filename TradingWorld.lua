return (function (...)
    if not ((function ()
        local e = game.GameId == 495644189743 % (7509902640)
        local J = e and 108890465381070 or 129954712878720
        local T = e and 140398800602850 or 126884695634066
        if game.PlaceId == T then
            return false
        end
        if game.PlaceId ~= J then
            if not workspace:WaitForChild("TradeWorld", 10) then
                print("[TOMIHUB-TW] Not the Trade World (PlaceId "..(tostring(game.PlaceId).."). Aborting."))
                return false
            end
            end
        return true
    end))() then
        return
    end
    if (getgenv()).__TomiHubUIActive then
        print("[TOMIHUB-TW] Another TOMI HUB script is already active ("..(tostring((getgenv()).__TomiHubUIActive).."). Aborting."))
        return
    end;
    (getgenv()).__TomiHubUIActive = "TradingWorld"
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    task.wait(0.5)
    local e = game:GetService("HttpService")
    local J = game:GetService("ReplicatedStorage")
    local T = game:GetService("TeleportService")
    local a = game:GetService("TweenService")
    local X = game:GetService("Players")
    local k = game:GetService("GuiService")
    local h = X.LocalPlayer or (X:GetPropertyChangedSignal("LocalPlayer")):Wait() or X.LocalPlayer
    local b = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
    local r
    do
        local e, J = pcall(function ()
            local e = game:HttpGet(b.."Library.lua")
            local J, T = loadstring(e)
            if not J then
                error("compile failed: "..tostring(T))
            end
            r = J()
        end)
        if not e or not r then
            warn("[TOMIHUB-TW] \226\157\140 FAILED to load Obsidian UI library: "..tostring(J))
            warn("[TOMIHUB-TW] Check: executor HTTP permissions / internet / GitHub availability.")
            return
        end
        end
    local I
    do
        local e, J = pcall(function ()
            I = (loadstring(game:HttpGet("https://upio-github-mirror.pages.dev/source.lua")))()
        end)
        if not e or not I then
            warn("[TOMIHUB-TW] \226\154\160\239\184\143 Icons failed to load ("..(tostring(J)..") \226\128\148 continuing without icons."))
        end
        end
    if I then
        r:SetIconModule(I)
    end
    local function f(e, J)
        if not e.ToggleCollapsed then
            return
        end
        local T = Instance.new("TextButton")
        T.Name = "CollapseButton"
        T.BackgroundTransparency = 1
        T.Size = UDim2.new(1, -34, 0, 34)
        T.Position = UDim2.new(0, 0, 0, 0)
        T.Text = ""
        T.ZIndex = e.Holder.ZIndex + 2
        T.Parent = e.Holder
        T.MouseButton1Click:Connect(function ()
            e:ToggleCollapsed()
        end)
        if J then
            e:SetCollapsed(true)
        end
        end
    local function p(e)
        local J = r.Scheme.MainColor
        local T = r.Scheme.OutlineColor
        local a = 6
        local X = 889199 - (889164)
        local k = e.Holder
        local h = e.Container
        local b = h:FindFirstChildOfClass("UIListLayout")
        h.Position = UDim2.new(0, a, 0, X + a)
        h.Size = UDim2.new(1, -a * 2, 1, -((X + a * 2)))
        h.BackgroundColor3 = J
        h.BackgroundTransparency = -659670 - (-659670)
        h.BorderSizePixel = 0
        local I = Instance.new("UICorner")
        I.CornerRadius = UDim.new(0, 8)
        I.Parent = h
        local f
        for e, J in ipairs(k:GetChildren())
        do
            if J:IsA("Frame") and (J.Position.Y.Offset == -571315 - (-571349) and J.Size.Y.Offset <= 2) then
                f = J
                break
            end
            end
        e.Resize = function (e,...)
            if f then
                f.Visible = not e.Collapsed
            end
            if e.Collapsed then
                k.Size = UDim2.new(1, 0, 0, 34)
                return
            end
            k.Size = UDim2.new(1, 0, 0, ((b.AbsoluteContentSize.Y / r.DPIScale) + 49) + a * 2)
        end
        e:Resize()
    end
    local function n(e, J, T)
        pcall(function ()
            if e then
                e.Size = UDim2.new(1, 0, 0, J)
                if e.Parent and e.Parent:IsA("Frame") then
                    e.Parent.Size = UDim2.new(1, 0, 0, J)
                end
                end
            if T and T.Resize then
                T:Resize()
            end
            end)
    end
    local function t(e)
        local J = e.Title or "Targets"
        local T = e.Items or {}
        local a = e.Store or {}
        local X = e.DisplayMap
        local k = e.OnDone
        local b = e.OnToggle
        local I = e.Single
        local f
        local p = r.Scheme.BackgroundColor
        local n = r.Scheme.MainColor
        local t = r.Scheme.OutlineColor
        local Q = r.Scheme.FontColor
        local w = r.Scheme.AccentColor
        local F = r:GetBetterColor(Q, -90)
        local A = n
        local s = r:GetBetterColor(n, 18)
        local j = r.ScreenGui
        if not j then
            local e, J = pcall(function ()
                return gethui and gethui()
            end)
            if e and J then
                j = J
            end
            end
        if not j then
            pcall(function ()
                j = game:GetService("CoreGui")
            end)
        end
        if not j then
            j = h:WaitForChild("PlayerGui")
        end
        local o = Instance.new("Frame")
        o.Name = "TOMIHUBTargetOverlay"
        o.Size = UDim2.fromScale(1, 1)
        o.BackgroundColor3 = Color3.new(0, 0, 0)
        o.BackgroundTransparency = 0.45
        o.BorderSizePixel = 0
        o.ZIndex = 9000
        o.Visible = false o.Parent = j
        local R = Instance.new("TextButton")
        R.BackgroundTransparency = 1
        R.Size = UDim2.fromScale(1, 1)
        R.Text = ""
        R.ZIndex = 9000
        R.Parent = o
        local L = Instance.new("Frame")
        L.AnchorPoint = Vector2.new(0.5, 0.5)
        L.Position = UDim2.fromScale(0.5, 0.5)
        L.Size = UDim2.fromOffset(560, 460)
        L.BackgroundColor3 = p
        L.BorderSizePixel = 0
        L.ZIndex = 9001
        L.Active = true L.Parent = o
        local u = Instance.new("UICorner")
        u.CornerRadius = UDim.new(0, 12)
        u.Parent = L
        local H = Instance.new("UIStroke")
        H.Color = t
        H.Thickness = -42920 + (42921)
        H.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        H.Parent = L
        local O = Instance.new("Frame")
        O.Size = UDim2.new(1, 0, 0, 56)
        O.BackgroundTransparency = 2075288681 % (10922572)
        O.ZIndex = 852975 + (-843973)
        O.Active = true O.Parent = L
        local y = Instance.new("TextLabel")
        y.BackgroundTransparency = 1
        y.Position = UDim2.fromOffset(20, 14)
        y.Size = UDim2.new(1, -160, 0, 30)
        y.FontFace = r.Scheme.Font
        y.Text = "\240\159\142\175 "..J
        y.TextSize = 920672 + (-920650)
        y.TextColor3 = Q
        y.TextXAlignment = Enum.TextXAlignment.Left
        y.ZIndex = 9003
        y.Parent = O
        local V = Instance.new("TextButton")
        V.AnchorPoint = Vector2.new(1, 0)
        V.Position = UDim2.new(1, -16, 0, 12)
        V.Size = UDim2.fromOffset(110, 34)
        V.BackgroundColor3 = w
        V.Text = "Done"
        V.FontFace = r.Scheme.Font
        V.TextSize = 15
        V.TextColor3 = Q
        V.AutoButtonColor = true V.ZIndex = -893335 + (902338)
        V.Parent = O
        local M = Instance.new("UICorner")
        M.CornerRadius = UDim.new(0, 8)
        M.Parent = V
        pcall(function ()
            r:MakeDraggable(L, O, true, false)
        end)
        local G = Instance.new("Frame")
        G.Position = UDim2.fromOffset(16, 60)
        G.Size = UDim2.new(1, -32, 1, -76)
        G.BackgroundColor3 = n
        G.BorderSizePixel = 0
        G.ZIndex = 9001
        G.Parent = L
        local z = Instance.new("UICorner")
        z.CornerRadius = UDim.new(0, 10)
        z.Parent = G
        local N = Instance.new("UIStroke")
        N.Color = t
        N.Thickness = 1
        N.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        N.Parent = G
        local g = Instance.new("TextBox")
        g.Position = UDim2.fromOffset(14, 14)
        g.Size = UDim2.new(1, -28, 0, 40)
        g.BackgroundColor3 = p
        g.Text = ""
        g.PlaceholderText = "Search items..."
        g.PlaceholderColor3 = F
        g.FontFace = r.Scheme.Font
        g.TextSize = -753534 - (-753550)
        g.TextColor3 = Q
        g.TextXAlignment = Enum.TextXAlignment.Left
        g.ClearTextOnFocus = false g.ZIndex = 9002
        g.Parent = G
        local D = Instance.new("UICorner")
        D.CornerRadius = UDim.new(0, 8)
        D.Parent = g
        local C = Instance.new("UIPadding")
        C.PaddingLeft = UDim.new(0, 14)
        C.Parent = g
        local d = Instance.new("UIStroke")
        d.Color = t
        d.Thickness = 1
        d.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        d.Parent = g
        local function U(e, J)
            local T = Instance.new("TextButton")
            T.AnchorPoint = Vector2.new(1, 0)
            T.Position = UDim2.new(1, J, 0, 62)
            T.Size = UDim2.fromOffset(54, 24)
            T.BackgroundColor3 = p
            T.Text = e
            T.FontFace = r.Scheme.Font
            T.TextSize = 13
            T.TextColor3 = Q
            T.ZIndex = 9003
            T.Parent = G
            local a = Instance.new("UICorner")
            a.CornerRadius = UDim.new(0, 6)
            a.Parent = T
            local X = Instance.new("UIStroke")
            X.Color = t
            X.Thickness = 1
            X.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            X.Parent = T
            return T
        end
        local Z = Instance.new("ScrollingFrame")
        Z.Position = UDim2.fromOffset(14, 94)
        Z.Size = UDim2.new(1, -28, 1, -108)
        Z.BackgroundColor3 = p
        Z.BorderSizePixel = 643302 + (-643302)
        Z.ScrollBarThickness = 5
        Z.ScrollBarImageColor3 = t
        Z.CanvasSize = UDim2.new()
        Z.ZIndex = 9002
        Z.Parent = G
        local P = Instance.new("UICorner")
        P.CornerRadius = UDim.new(0, 8)
        P.Parent = Z
        local W = Instance.new("UIListLayout")
        W.Padding = UDim.new(0, 4)
        W.SortOrder = Enum.SortOrder.LayoutOrder
        W.Parent = Z
        local q = Instance.new("UIPadding")
        q.PaddingLeft = UDim.new(0, 8)
        q.PaddingRight = UDim.new(0, 8)
        q.PaddingTop = UDim.new(0, 8)
        q.PaddingBottom = UDim.new(0, 8)
        q.Parent = Z;
        (W:GetPropertyChangedSignal("AbsoluteContentSize")):Connect(function ()
            Z.CanvasSize = UDim2.new(0, 0, 0, W.AbsoluteContentSize.Y + 16)
        end)
        local S = {}
        local x = {}
        local function m(e)
            local J = Instance.new("TextButton")
            J.Size = UDim2.new(1, 0, 0, 40)
            J.BackgroundColor3 = a[e] and s or A
            J.AutoButtonColor = false J.Text = ""
            J.ZIndex = 9003
            J.Parent = Z
            local T = Instance.new("UICorner")
            T.CornerRadius = UDim.new(0, 6)
            T.Parent = J
            local k = Instance.new("TextLabel")
            k.BackgroundTransparency = -311148 - (-311149)
            k.Position = UDim2.fromOffset(14, 0)
            k.Size = UDim2.new(1, -22, 1, 0)
            k.RichText = true k.Text = (X and X[e]) or e
            k.FontFace = r.Scheme.Font
            k.TextSize = -554519 - (-554534)
            k.TextColor3 = Q
            k.TextXAlignment = Enum.TextXAlignment.Left
            k.ZIndex = 9004
            k.Parent = J
            local function h()
                J.BackgroundColor3 = a[e] and s or A
            end
            J.MouseButton1Click:Connect(function ()
                if I then
                    for e in pairs(a)
                    do
                        a[e] = nil
                    end
                    a[e] = true
                    for e, J in pairs(S)
                    do
                        J()
                    end
                    if b then
                        pcall(b, e, true)
                    end
                    else
                    a[e] = not a[e]
                    h()
                    if b then
                        pcall(b, e, a[e])
                    end
                    end
                end)
            S[e] = h
            x[e] = J
        end
        local function Y(e)
            for e, J in pairs(x)
            do
                J:Destroy()
            end
            S = {}
            x = {}
            for e, J in ipairs(e)
            do
                m(J)
            end
            end
        Y(T)
        if not I then
            (U("None", -14)).MouseButton1Click:Connect(function ()
                for e in pairs(x)
                do
                    a[e] = false S[e]()
                end
                if b then
                    pcall(b)
                end
                end);
            (U("All", -74)).MouseButton1Click:Connect(function ()
                for e in pairs(x)
                do
                    a[e] = true S[e]()
                end
                if b then
                    pcall(b)
                end
                end)
        end;
        (g:GetPropertyChangedSignal("Text")):Connect(function ()
            local e = string.lower(g.Text)
            for J, T in pairs(x)
            do
                T.Visible = (e == "") or string.find(string.lower(J), e, 1, true) ~= nil
            end
            end)
        local function v()
            o.Visible = false
            if k then
                pcall(k)
            end
            end
        f = v
        V.MouseButton1Click:Connect(v)
        return {Open = function ()
            g.Text = ""
            for e in pairs(x)
            do
                x[e].Visible = true S[e]()
            end
            o.Visible = true
        end, SetItems = function (e, J)
            T = e
            if J ~= nil then
                X = J
            end
            Y(e)
        end;
        Repaint = function ()
            for e in pairs(x)
            do
                S[e]()
            end
            end}
    end
    local function Q(e, J, T, X, k)
        k = k or {}
        local h = k.multi
        local b = k.store
        if not h then
            b = {}
            local e = k.get and k.get()
            if e and table.find(X, e) then
                b[e] = true
            end
            end
        local function I()
            if h then
                local e = {}
                for J, T in ipairs(X)
                do
                    if b[T] then
                        e[#e + 1] = T
                    end
                    end
                if #e == 0 then
                    return "---"
                end
                if #e == #X then
                    return "All"
                end
                if #e <= 3 then
                    return table.concat(e, ", ")
                end
                return #e.." selected"
            else
                for e, J in ipairs(X)
                do
                    if b[J] then
                        return J
                    end
                    end
                return "---"
            end
            end
        local f = e:AddDropdown(J, {Text = k.text;
        Values = {"---", "All"};
        Default = "---";
        Tooltip = k.tooltip or ("Click to open the "..(T.." picker."))})
        local p
        local function n()
            local e = f.Holder
            if not e then
                return
            end
            local J = I()
            for e, T in ipairs(e:GetDescendants())
            do
                if ((T:IsA("TextLabel") or T:IsA("TextButton"))) and T.Name ~= "TOMIHUBOverlayCatcher" then
                    pcall(function ()
                        T.TextXAlignment = Enum.TextXAlignment.Left
                        T.TextYAlignment = Enum.TextYAlignment.Center
                        if not T.TextScaled and T.TextSize < (-304520) - (-304535) then
                            T.TextSize = -107567 - (-107582)
                        end
                        if T.Text == J then
                            if T.Size.Y.Scale == 0 and (T.Size.Y.Offset > (3752947164) % (15380931) and (T.Parent and (T.Parent:IsA("GuiObject") and T.Parent.AbsoluteSize.Y > T.AbsoluteSize.Y + 1))) then
                                T.Size = UDim2.new(T.Size.X.Scale, T.Size.X.Offset, 1, 0)
                            end
                            local e = T:FindFirstChildOfClass("UIPadding")
                            if not e then
                                e = Instance.new("UIPadding")
                                e.Parent = T
                            end
                            e.PaddingBottom = UDim.new(0, 3)
                        end
                        end)
                end
                end
            end
        local function Q()
            local e = I()
            pcall(function ()
                f:SetValues({e})
                f:SetValue(e)
            end)
            n()
        end
        local function w(e)
            if not p then
                return
            end
            pcall(function ()
                (a:Create(p, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Rotation = e and 533366 - (533186) or 0})):Play()
            end)
        end
        local F = t({Title = T, Items = X, Store = b;
        Single = not h, DisplayMap = k.displayMap, OnDone = function ()
            w(false)
        end;
        OnToggle = function (e)
            if not h and e then
                if k.set then
                    k.set(e)
                end
                end
            Q()
            if k.onChange then
                pcall(k.onChange)
            end
            end})
        Q()
        local A = {Dropdown = f, Overlay = F, Multi = h, GetValue = function ()
            if h then
                local e = {}
                for J in pairs(b)
                do
                    if b[J] then
                        e[J] = true
                    end
                    end
                return e
            else
                for e, J in ipairs(X)
                do
                    if b[J] then
                        return J
                    end
                    end
                return "Any"
            end
            end, SetValue = function (e, J)
            for e in pairs(b)
            do
                b[e] = nil
            end
            if h then
                if type(J) == "table" then
                    for e, J in pairs(J)
                    do
                        if J == true then
                            b[e] = true
                        elseif type(e) == "number" and type(J) == "string" then
                            b[J] = true
                        end
                        end
                    end
                else
                if type(J) == "string" and (J ~= "" and table.find(X, J)) then
                    b[J] = true
                end
                end
            Q()
            pcall(function ()
                F.Repaint()
            end)
        end}
        task.defer(function ()
            local e = f.Holder
            if not e then
                return
            end
            local J = e:FindFirstChildWhichIsA("TextButton", true)
            local T = J or e
            local a = Instance.new("TextButton")
            a.Name = "TOMIHUBOverlayCatcher"
            a.BackgroundTransparency = -640542 + 288503927 % (1345156)
            a.Text = ""
            a.Size = UDim2.fromScale(1, 1)
            a.Position = UDim2.fromScale(0, 0)
            a.ZIndex = ((T.ZIndex or (-1028081) - -1028082)) + (50)
            a.Active = true a.AutoButtonColor = false a.Parent = T
            Q()
            p = e:FindFirstChildWhichIsA("ImageLabel", true) or e:FindFirstChildWhichIsA("ImageButton", true)
            local X = a.MouseButton1Click:Connect(function ()
                pcall(function ()
                    if f.Menu and f.Menu.Close then
                        f.Menu:Close()
                    end
                    end)
                if k.onOpen then
                    pcall(k.onOpen)
                end
                w(true)
                F.Open()
            end)
            r:GiveSignal(X)
        end)
        return A
    end
    local function w(e, J, T)
        local a = Color3.fromRGB(32, 32, 32)
        local X = Color3.fromRGB(42, 42, 42)
        local k = r.Scheme.FontColor
        local h = r.Scheme.OutlineColor
        local b = 30
        local I = 4
        local f = (#T * b) + (((#T - 1)) * I)
        local p = Instance.new("Frame")
        p.BackgroundTransparency = 1
        p.BorderSizePixel = 0
        p.Size = UDim2.new(1, 0, 0, f)
        local n = Instance.new("UIListLayout")
        n.FillDirection = Enum.FillDirection.Vertical
        n.HorizontalAlignment = Enum.HorizontalAlignment.Center
        n.SortOrder = Enum.SortOrder.LayoutOrder
        n.Padding = UDim.new(0, I)
        n.Parent = p
        for e, J in ipairs(T)
        do
            local T = Instance.new("TextButton")
            T.Text = J[1]
            T.Font = Enum.Font.GothamSemibold
            T.TextSize = 13
            T.TextColor3 = k
            T.BackgroundColor3 = a
            T.BorderSizePixel = 0
            T.Size = UDim2.new(1, 0, 0, b)
            T.LayoutOrder = e
            T.AutoButtonColor = false
            local r = Instance.new("UICorner")
            r.CornerRadius = UDim.new(0, 6)
            r.Parent = T
            local I = Instance.new("UIStroke")
            I.Color = h
            I.Thickness = 1
            I.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            I.Parent = T
            T.MouseEnter:Connect(function ()
                T.BackgroundColor3 = X
            end)
            T.MouseLeave:Connect(function ()
                T.BackgroundColor3 = a
            end)
            T.MouseButton1Click:Connect(J[2])
            T.Parent = p
        end
        e:AddUIPassthrough(J, {Instance = p;
        Height = f})
        return p
    end
    local F = {}
    function F.ButtonRow(e, J, T)
        local a = Color3.fromRGB(32, 32, 32)
        local X = Color3.fromRGB(42, 42, 42)
        local k = Instance.new("Frame")
        k.BackgroundTransparency = 1
        k.BorderSizePixel = (-599033) + (599033)
        k.Size = UDim2.new(1, 0, 0, 30)
        local h = Instance.new("UIListLayout")
        h.FillDirection = Enum.FillDirection.Horizontal
        h.HorizontalAlignment = Enum.HorizontalAlignment.Center
        h.SortOrder = Enum.SortOrder.LayoutOrder
        h.Padding = UDim.new(0, 4)
        h.Parent = k
        local b = 1 / #T
        local I = {}
        for e, J in ipairs(T)
        do
            local T = Instance.new("TextButton")
            T.Text = J[1]
            T.Font = Enum.Font.GothamSemibold
            T.TextSize = 13
            T.TextColor3 = r.Scheme.FontColor
            T.BackgroundColor3 = a
            T.BorderSizePixel = 0
            T.Size = UDim2.new(b, -2, 1, 0)
            T.LayoutOrder = e
            T.AutoButtonColor = false
            local h = Instance.new("UICorner")
            h.CornerRadius = UDim.new(0, 6)
            h.Parent = T
            local f = Instance.new("UIStroke")
            f.Color = r.Scheme.OutlineColor
            f.Thickness = -537961 - (-537962)
            f.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            f.Parent = T
            T.MouseEnter:Connect(function ()
                T.BackgroundColor3 = X
            end)
            T.MouseLeave:Connect(function ()
                T.BackgroundColor3 = a
            end)
            T.MouseButton1Click:Connect(J[2])
            I[e] = T
            T.Parent = k
        end
        e:AddUIPassthrough(J, {Instance = k, Height = 30})
        return k, I
    end
    function F.List(e, J)
        local T = 6
        local a = -993749 - (-993753)
        local X = Instance.new("Frame")
        X.BackgroundTransparency = 0
        X.BackgroundColor3 = r.Scheme.MainColor
        X.BorderSizePixel = 769243992 % (5827606)
        X.Size = UDim2.new(1, 0, 0, 0)
        local k = Instance.new("UICorner")
        k.CornerRadius = UDim.new(0, 6)
        k.Parent = X
        local h = Instance.new("UIStroke")
        h.Color = r.Scheme.OutlineColor
        h.Thickness = 1
        h.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        h.Parent = X
        local b = Instance.new("UIPadding")
        b.PaddingTop = UDim.new(0, T)
        b.PaddingBottom = UDim.new(0, T)
        b.PaddingLeft = UDim.new(0, T)
        b.PaddingRight = UDim.new(0, T)
        b.Parent = X
        local I = Instance.new("UIListLayout")
        I.FillDirection = Enum.FillDirection.Vertical
        I.HorizontalAlignment = Enum.HorizontalAlignment.Center
        I.SortOrder = Enum.SortOrder.LayoutOrder
        I.Padding = UDim.new(0, a)
        I.Parent = X
        local f = Instance.new("TextButton")
        f.Name = "__vhDynGuard"
        f.AutomaticSize = Enum.AutomaticSize.Y
        f.Text = ""
        f.Parent = I
        e:AddUIPassthrough(J, {Instance = X;
        Height = 1})
        local function p()
            task.defer(function ()
                pcall(function ()
                    local J = I.AbsoluteContentSize.Y
                    if J == 0 then
                        for e, T in ipairs(X:GetChildren())
                        do
                            if T:IsA("GuiObject") then
                                J = (J + T.AbsoluteSize.Y) + a
                            end
                            end
                        end
                    J = J + T * (2)
                    X.Size = UDim2.new(1, 0, 0, J)
                    if X.Parent and X.Parent:IsA("Frame") then
                        X.Parent.Size = UDim2.new(1, 0, 0, J)
                    end
                    if e.Resize then
                        e:Resize()
                    end
                    end)
            end)
        end;
        (I:GetPropertyChangedSignal("AbsoluteContentSize")):Connect(p);
        (X:GetPropertyChangedSignal("AbsoluteSize")):Connect(p)
        task.spawn(function ()
            local e = {1, 3;
            8}
            for e, J in ipairs(e)
            do
                task.wait(J)
                p()
            end
            end)
        return {frame = X, layout = I;
        resize = p}
    end
    function F.Row(e, J, T, a)
        a = a or {}
        local X = Instance.new("TextButton")
        X.LayoutOrder = J
        X.BorderSizePixel = 0
        X.BackgroundColor3 = a.selected and Color3.fromRGB(45, 55, 45) or Color3.fromRGB(32, 32, 32)
        X.Size = UDim2.new(1, 0, 0, 0)
        X.AutomaticSize = Enum.AutomaticSize.Y
        X.Text = ""
        local k = Instance.new("UICorner")
        k.CornerRadius = UDim.new(0, 6)
        k.Parent = X
        local h = Instance.new("UIStroke")
        h.Color = a.selected and Color3.fromRGB(0, 180, 100) or r.Scheme.OutlineColor
        h.Thickness = 1
        h.Parent = X
        local b = Instance.new("UIPadding")
        b.PaddingTop = UDim.new(0, 8)
        b.PaddingBottom = UDim.new(0, 8)
        b.PaddingLeft = UDim.new(0, 8)
        b.PaddingRight = UDim.new(0, 8)
        b.Parent = X
        local I = Instance.new("TextLabel")
        I.BackgroundTransparency = (2217714004) % (15954777)
        I.Size = UDim2.new(1, 0, 0, 0)
        I.AutomaticSize = Enum.AutomaticSize.Y
        I.Font = Enum.Font.GothamSemibold
        I.TextSize = 12
        I.TextColor3 = Color3.fromRGB(165, 165, 165)
        I.TextXAlignment = Enum.TextXAlignment.Left
        I.TextYAlignment = Enum.TextYAlignment.Center
        I.TextWrapped = true I.RichText = true I.Text = T
        I.Parent = X
        X.MouseEnter:Connect(function ()
            if not a.selected then
                X.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
            end
            end)
        X.MouseLeave:Connect(function ()
            X.BackgroundColor3 = a.selected and Color3.fromRGB(45, 55, 45) or Color3.fromRGB(32, 32, 32)
        end)
        if a.onClick then
            X.MouseButton1Click:Connect(a.onClick)
        end
        X.Parent = e
        return X, I
    end
    function F.ClearRows(e)
        for e, J in ipairs(e:GetChildren())
        do
            if J:IsA("GuiObject") then
                J:Destroy()
            end
            end
        end
    F.mergeSets = {}
    function F.Merge(e, J)
        local T = e.Container
        local a = #T:GetChildren()
        J()
        local X = T:GetChildren()
        local k = {}
        for e = a + 1, #X, 146286 + (-146285)
        do
            if X[e]:IsA("GuiObject") then
                table.insert(k, X[e])
            end
            end
        if #k > (69096458) % (2228918) then
            table.insert(F.mergeSets, k)
        end
        end
    local A = {}
    local s = r.Notify
    task.spawn(function ()
        while true
        do
            if #A > 0 then
                local e = table.remove(A, 1)
                pcall(function ()
                    s(r, e.msg, e.duration)
                end)
            end
            task.wait(0.1)
        end
        end)
    local function j(e, J)
        table.insert(A, {msg = tostring(e), duration = J or (-109365) - -109370})
    end
    r.Notify = function (e, J, T)
        j(J, T)
    end
    local o = nil
    do
        local e = J:WaitForChild("Modules", 10)
        e = e and e:WaitForChild("DataService", 10)
        if e then
            local J, T = pcall(require, e)
            if J then
                o = T
            end
            end
        if not o then
            warn("[TOMIHUB-TW] \226\154\160\239\184\143 Modules.DataService unavailable \226\128\148 machine data features disabled.")
        end
        end
    local R = h.Name
    local function L()
        local e, J = pcall(function ()
            local e = o:GetData()
            return e and e.PetAgeBreakMachine or nil
        end)
        if e then
            return J
        end
        return nil
    end
    local u = "https://script.google.com/macros/s/AKfycbxShD-DPLI-Dh5SV-kQhYIvzcuHoTDG0EGhmvkup7P2zopnwbffRuxiyS9ZyILp7G3b/exec"
    task.spawn(function ()
        local J = u..("?username="..((game:GetService("HttpService")):UrlEncode(h.Name)..("&userId="..tostring(h.UserId))))
        local T, a = pcall(function ()
            local e = syn and syn.request or http_request or request or http.request
            if e then
                local T = e({Url = J;
                Method = "GET"})
                return T.Body
            end
            return game:HttpGet(J)
        end)
        if T and a then
            local J, T = pcall(function ()
                return e:JSONDecode(a)
            end)
        end
        end)
    local function H(e, J, T)
        local a = e
        local X = tostring(e)
        for e, J in ipairs(J)
        do
            if not a then
                return nil, X
            end
            X = X..("."..J)
            a = a:WaitForChild(J, T or 10)
            if not a then
                return nil, X
            end
            end
        return a, X
    end
    local function O(e, J, T)
        local a, X = H(e, J, T)
        if not a then
            warn("[TOMI HUB] \226\157\140 Missing instance: "..(X.." -- Trade World UI cannot load. The game may have updated its remotes/folders."))
            pcall(function ()
                r:Notify("\226\157\140 Missing: "..(X.." (game update?)"), 8)
            end)
        end
        return a
    end
    local y = O(J, {"GameEvents";
    "TradeEvents";
    "Booths"})
    local V = y and y:WaitForChild("ClaimBooth", 10)
    local M = y and y:WaitForChild("RemoveBooth", 10)
    local G = O(workspace, {"TradeWorld";
    "Booths"})
    local z = O(J, {"GameEvents";
    "TradeEvents", "TokenRAPs"})
    local N = z and z:WaitForChild("FindSellers", 10)
    local g = z and z:WaitForChild("TeleportToListing", 10)
    local D = y and y:WaitForChild("BuyListing", 10)
    local C = O(J, {"GameEvents";
    "PetsService"})
    local d = O(J, {"Modules";
    "ReplicationReciever"})
    local U = d and require(d)
    local Z = U and U.new("Booths")
    local P = nil
    local W = nil pcall(function ()
        W = require((J:WaitForChild("Data")):WaitForChild("TradeBoothsData"))
    end)
    local function q()
        if W and W.getPlayerId then
            local e, J = pcall(function ()
                return W.getPlayerId(h)
            end)
            if e and J then
                return tostring(J)
            end
            end
        return tostring(h.UserId)
    end
    local S = nil pcall(function ()
        S = require((J:WaitForChild("Modules")):WaitForChild("TeleportUIController"))
    end)
    local x = {}
    local m = {}
    pcall(function ()
        local e = o:GetData()
        local J = e.PetsData.PetInventory.Data
        for e, J in pairs(J)
        do
            local T = tostring(J.PetType)
            if not m[T] then
                table.insert(x, T)
                m[T] = true
            end
            end
        end)
    if #x == 0 then
        table.insert(x, "No Pets Found")
    end
    local function Y(e, J, T)
        T = T or 5
        local a = tick()
        local X = e:FindFirstChild(J)
        while not X and tick() - a < T
        do
            task.wait(0.25)
            X = e:FindFirstChild(J)
        end
        return X
    end
    local v = {}
    pcall(function ()
        local e = Y(J, "Data", 5)
        if not e then
            return
        end
        local T = Y(e, "PetRegistry", 5)
        if not T then
            return
        end
        local a = Y(T, "PetList", 5)
        if not a then
            return
        end
        if a:IsA("ModuleScript") then
            local e, J = pcall(require, a)
            if e and type(J) == "table" then
                for e, J in pairs(J)
                do
                    if type(e) == "string" then
                        table.insert(v, e)
                    end
                    end
                end
            elseif a:IsA("Folder") then
            for e, J in pairs(a:GetChildren())
            do
                table.insert(v, J.Name)
            end
            end
        end)
    if #v == 0 then
        v = x
    else
        table.sort(v)
    end
    local i = (#v > -308651 - (-308651) and v) or x
    local K = {}
    local E = {}
    local function c(e)
        local J = e and e.InventoryData
        if type(J) ~= "table" then
            return false
        end
        local T = 0
        for e, J in pairs(J)
        do
            if type(J) == "table" and J.ItemType == "Holdable" then
                T = T + 1
                local e = J.ItemData or {}
                local a = e.ItemName or e.Name
                if a and not E[a] then
                    table.insert(K, a)
                    E[a] = true
                end
                end
            end
        if T > 0 then
            return true
        end
        return false
    end
    local l = nil pcall(function ()
        l = require(J:WaitForChild("Calculate_Weight", 5))
    end)
    local function B(e)
        if type(e) ~= "table" then
            return nil
        end
        local J = e.ItemData or e.Data or e
        local T = J.ItemName or J.Name or e.ItemName or e.Name
        local a = J.Seed or e.Seed
        local X = tonumber(J.WeightMultiplier or e.WeightMultiplier)
        if l and (a and T) then
            local e, J = pcall(function ()
                return l.Calculate_Weight(a, T)
            end)
            if e and J then
                local e = X or -294431 - (-294432)
                local T = ((tonumber(J) or -1833070)) * e
                return T
            end
            end
        if X then
            warn(string.format("\226\154\160\239\184\143 [TOMI HUB] Calculate_Weight unavailable for %s \226\128\148 using WeightMultiplier fallback: %s", tostring(T), tostring(X)))
            return X
        end
        return nil
    end
    pcall(function ()
        local e = o:GetData()
        c(e)
    end)
    if #K == 0 then
        table.insert(K, "No Fruits Found")
    else
        table.sort(K)
    end
    local e8 = {WebhookURL = "", BoothNotifs = false, AutoList = false, AutoClaim = false, AutoScan = false;
    AutoHop = false;
    HopTimer = 15, SmartHop = true;
    MinutesPassed = 0;
    ListingPet = x[1];
    ListingMinWeight = 0;
    ListingMaxWeight = 140;
    ListMutations = {}, Price = 0;
    ListingFruit = K[1], FruitPrice = 0, FruitMinWeight = 0, FruitMaxWeight = 140;
    AutoFruitList = false, SmartAutoList = false;
    SmartAutoFruitList = false;
    TargetPet = i[1];
    MinWeight = 0.8;
    MaxWeight = 11.44;
    MaxPrice = 100, MaxAge = 125;
    ScanMutations = {};
    AutoBuy = false;
    MaxBuys = 1;
    AutoTPToBooth = false, ScannerWebhookURL = "", ScannerNotifs = false, AutoScanV2 = false;
    AutoScanV2Persist = false, MaxVisitedServers = 50, AutoChat = false, AutoChatList = {}, AutoChatDelay = 60, AutoReconnect = false;
    AntiCollision = false, MyAltsList = {};
    BlacklistedListings = {};
    BlacklistedServers = {}, AutoSnipe = false, AutoSnipeV2 = false;
    UseCustomSnipeRules = false;
    SnipePets = {}, SnipeMinWeight = 0.8, SnipeMaxWeight = 11.44, SnipeMaxPrice = 100;
    SnipeMaxAge = 125;
    SnipeRules = {};
    SnipeMaxBuys = 10, SnipeNotifs = false;
    SnipeSkipFavorited = true, SnipeWebhookURL = ""}
    local J8 = game.PlaceId
    local T8 = "TOMIHUB_VisitedServers_"..(tostring(h.UserId)..".json")
    local a8 = {}
    local X8 = ""
    local k8 = false
    local h8 = nil math.randomseed(((h.UserId + math.floor(os.clock() * 10000))) % 2147483647)
    local b8 = tostring(game.JobId)
    pcall(function ()
        if isfile(T8) then
            a8 = e:JSONDecode(readfile(T8)) or {}
        end
        end)
    if type(a8) ~= "table" then
        a8 = {}
    end
    if b8 ~= "" then
        local e = false
        for J, T in pairs(a8)
        do
            if tostring(T) == b8 then
                e = true
                break
            end
            end
        if not e then
            table.insert(a8, b8)
        end
        end
    local r8 = -233488 - (-233668)
    local I8 = -887923 - (-887923)
    local f8 = tick()
    local p8 = 0
    local n8 = 5
    local t8 = nil
    local function Q8()
        local e, J = pcall(function ()
            T:Teleport(game.PlaceId, X.LocalPlayer)
        end)
    end
    local function w8()
        if t8 then
            return
        end
        local e = k:GetErrorMessage()
        if e ~= "" then
            Q8()
            return
        end
        t8 = k.ErrorMessageChanged:Connect(function ()
            if not e8.AutoReconnect then
                return
            end
            local e = k:GetErrorMessage()
            task.wait(n8)
            if e8.AutoReconnect then
                Q8()
            end
            end)
    end
    local function F8()
        if t8 then
            t8:Disconnect()
            t8 = nil
        end
        end
    local A8 = "TOMI HUB"
    local s8 = A8.."/UniversalToggle.json"
    local j8 = false pcall(function ()
        if isfile and isfile(s8) then
            local J = e:JSONDecode(readfile(s8))
            if type(J) == "table" and J.UseUniversalConfig ~= nil then
                j8 = J.UseUniversalConfig
            end
            end
        end)
    local o8
    if j8 then
        o8 = A8.."/Trade_Universal.json"
    else
        o8 = A8..("/Trade_"..(tostring(h.UserId)..".json"))
    end
    local function R8()
        if not makefolder then
            return
        end
        local e = false
        if isfolder then
            local J, T = pcall(isfolder, A8)
            if J then
                e = T
            end
            end
        if not e then
            pcall(makefolder, A8)
        end
        end
    local function L8()
        if not writefile then
            warn("\226\157\140 [TOMI HUB] writefile unsupported by executor")
            return false
        end
        R8()
        local J, T = pcall(function ()
            local J = e:JSONEncode(e8)
            writefile(o8, J)
        end)
        if not J then
            warn("\226\157\140 [TOMI HUB] Save Error: "..tostring(T))
            return false
        end
        local a = false
        if isfile then
            pcall(function ()
                a = isfile(o8)
            end)
        end
        if not a then
            warn("\226\154\160\239\184\143 [TOMI HUB] Config may not have persisted")
        end
        return true
    end
    local u8 = false
    function SaveConfig()
        if u8 then
            return
        end
        u8 = true delay(1.5, function ()
            u8 = false
            local e = L8()
            if e then
                end
            end)
    end
    local function H8()
        if not readfile or not isfile then
            warn("\226\154\160\239\184\143 [TOMI HUB] readfile/isfile unsupported")
            return
        end
        R8()
        local J = false
        local T = pcall(function ()
            J = isfile(o8)
        end)
        if not T then
            warn("\226\154\160\239\184\143 [TOMI HUB] Failed checking config existence")
            return
        end
        if not J then
            L8()
            return
        end
        local a, X = pcall(readfile, o8)
        if not a or not X or X == "" then
            warn("\226\157\140 [TOMI HUB] Failed reading config or empty file")
            return
        end
        local k, h = pcall(function ()
            return e:JSONDecode(X)
        end)
        if not k or type(h) ~= "table" then
            warn("\226\154\160\239\184\143 [TOMI HUB] Config corrupted. Resetting...")
            L8()
            return
        end
        for e, J in pairs(h)
        do
            e8[e] = J
        end
        if h.AutoChatMsg and not h.AutoChatList then
            if type(h.AutoChatMsg) == "string" then
                e8.AutoChatList = {h.AutoChatMsg}
            elseif type(h.AutoChatMsg) == "table" then
                e8.AutoChatList = h.AutoChatMsg
            end
            e8.AutoChatMsg = nil
        end
        end
    pcall(H8)
    local function O8(e)
        return ((((tostring(e)):reverse()):gsub("%d%d%d", "%1,")):reverse()):gsub("^,", "")
    end
    local function y8(e, J)
        local T = 0.1
        local a = tonumber(e) or (3807462340) % 16133315
        local X = math.max(1, tonumber(J) or 0)
        local k = a + ((a * T) * X)
        return math.floor(k * 100.5) / (100)
    end
    local function V8(e)
        if not e then
            return nil
        end
        return e.PetData and ((e.PetData.Age or e.PetData.Level or e.PetData.PetAge or e.PetData.AgeLevel)) or e.Age or e.Level or e.PetAge or e.ItemAge or (e.data and ((e.data.PetData and ((e.data.PetData.Age or e.data.PetData.Level))))) or (e.data and ((e.data.Age or e.data.Level)))
    end
    local function M8(e)
        if not e then
            return nil
        end
        return e.PetData and ((e.PetData.BaseWeight or e.PetData.Weight or e.PetData.TrueWeight)) or e.BaseWeight or e.Weight or e.ItemWeight or (e.data and ((e.data.PetData and ((e.data.PetData.BaseWeight or e.data.PetData.Weight))))) or (e.data and e.data.BaseWeight)
    end
    local function G8(e)
        local J = o:GetData()
        local T = J.PetsData.PetInventory.Data
        local a = ((tostring(e)):gsub("{", "")):gsub("}", "")
        for e, J in pairs(T)
        do
            if ((tostring(e)):gsub("{", "")):gsub("}", "") == a then
                return J, e
            end
            end
        return nil
    end
    local function z8(e)
        pcall(function ()
            local J = workspace:FindFirstChild(e, true)
            if not J then
                return
            end
            if J:FindFirstChild("VoidHighlight") then
                return
            end
            local T = Instance.new("Highlight")
            T.Name = "VoidHighlight"
            T.FillColor = Color3.fromRGB(0, 255, 0)
            T.FillTransparency = 0.5
            T.OutlineColor = Color3.new(1, 1, 1)
            T.Parent = J
        end)
    end
    local function N8(e)
        local J = nil
        local T = nil
        local a = -math.huge
        local X, k = pcall(function ()
            local X = o:GetData()
            if not X then
                return
            end
            local k = X.PetsData and (X.PetsData.PetInventory and X.PetsData.PetInventory.Data)
            if type(k) ~= "table" then
                return
            end
            for X, k in pairs(k)
            do
                if type(k) == "table" and tostring(k.PetType) == e then
                    local e = k.PetData or {}
                    local h = tonumber(e.BaseWeight or k.BaseWeight) or 2703495617 % (10901192)
                    local b = tonumber(e.Age or e.Level or e.PetAge or e.AgeLevel or 0) or -1823526
                    local r = y8(h, b)
                    if r > a then
                        a = r
                        J = tostring(X)
                        T = k
                    end
                    end
                end
            end)
        if not X then
            warn("[TOMI HUB] FindBestPetByType error: "..tostring(k))
            return nil, nil
        end
        return J, T
    end
    local g8
    local function D8()
        task.spawn(function ()
            local e = e8.EquipPetName or (x[1] or "")
            if e == "" or e == "No Pets Found" then
                r:Notify("\226\154\160\239\184\143 Equip Pet: no valid pet selected.", 3)
                return
            end
            local J, T = N8(e)
            if not J then
                r:Notify("\226\157\140 Equip Pet: inventory unavailable \226\128\148 try again.", 3)
                return
            end
            local a = (T and T.PetData) or {}
            local X = tonumber(a.BaseWeight or (T and T.BaseWeight)) or (-919577) + (919578)
            local k = tonumber(a.Age or a.Level or a.PetAge or a.AgeLevel or 0) or 0
            local b = y8(X, k)
            local I = g8(T)
            local f = h.Character
            local p = h:FindFirstChild("Backpack")
            local n = nil
            local t = (tostring(J)):gsub("[{}]", "")
            local Q = (tostring(e)):lower()
            for e, J in ipairs({f, p})
            do
                if J then
                    for e, J in ipairs(J:GetChildren())
                    do
                        if J:IsA("Tool") and (J.Name:lower()):find(Q, 1, true) then
                            local e = (tostring(J:GetAttribute("PET_UUID") or J:GetAttribute("UUID") or J:GetAttribute("ItemId") or J:GetAttribute("ItemID") or J:GetAttribute("Id") or "")):gsub("[{}]", "")
                            if e == t then
                                n = J
                                break
                            end
                            local T = tonumber(J:GetAttribute("BaseWeight") or J:GetAttribute("Weight") or -1771010)
                            local a = tonumber(J:GetAttribute("Age") or J:GetAttribute("PetAge") or 0)
                            if T == X and a == k then
                                n = J
                                break
                            end
                            end
                        end
                    end
                if n then
                    break
                end
                end
            local w
            if n then
                local e = pcall(function ()
                    n:Equip()
                end)
                if not e and f then
                    n.Parent = f
                end
                w = "\226\156\139 Holding!"
            else
                w = "\226\154\160\239\184\143 Tool not found in backpack"
            end
            r:Notify(string.format("\226\156\133 %s \226\128\148 BaseW %.4f | Age %d | %s | %s", tostring(e), b, k, tostring(I), w), 4)
        end)
    end
    local C8 = false
    local d8 = nil
    local U8 = nil
    local Z8 = nil
    local P8 = nil
    local W8 = nil
    local q8 = nil
    local S8 = false
    local x8 = CFrame.new(0, -1, 13)
    _G.TOMIHUB_TestBoothTP = function ()
        local e = h.Character
        if not e then
            print("[TOMI HUB] No character found.")
            return
        end
        local J = tostring(q())
        local T = tostring(h.UserId)
        local a = Z:GetData()
        local X = nil
        if a and a.Players then
            local e = a.Players[J] or a.Players[T]
            if e and e.Booth then
                X = e.Booth
            end
            end
        if not X and (a and a.Booths) then
            for e, a in pairs(a.Booths)
            do
                local k = tostring(a.Owner)
                if k == J or k == T then
                    X = e
                    break
                end
                end
            end
        if not X then
            print("[TOMI HUB] No owned booth found -- claim one first.")
            r:Notify("No owned booth to test TP on.", 3)
            return
        end
        local k = G:FindFirstChild(X)
        if not k then
            print("[TOMI HUB] Booth instance not found: "..X)
            return
        end
        local b = k:GetPivot()
        local I = CFrame.new(((b * x8)).Position)
        print(string.format("[TOMI HUB] Booth \'%s\' pivot:  (%.1f, %.1f, %.1f)", X, b.Position.X, b.Position.Y, b.Position.Z))
        print(string.format("[TOMI HUB] Landing at:         (%.1f, %.1f, %.1f)", I.Position.X, I.Position.Y, I.Position.Z))
        print(string.format("[TOMI HUB] Active offset:      CFrame.new(%.1f, %.1f, %.1f)", x8.X, x8.Y, x8.Z))
        if S and S.Move then
            pcall(function ()
                S:Move(CFrame.new(I.Position), "Booth")
            end)
        else
            pcall(function ()
                e:PivotTo(I)
            end)
        end
        r:Notify(string.format("Test TP! Offset (%.1f, %.1f, %.1f) -- check console for coords", x8.X, x8.Y, x8.Z), 5)
    end
    local function m8()
        local e = Z:GetData()
        local J = {}
        if e and e.Booths then
            for e, T in pairs(e.Booths)
            do
                if T.Owner == nil then
                    local T = G:FindFirstChild(e)
                    if T then
                        table.insert(J, T)
                    end
                    end
                end
            end
        if #J == 0 then
            for e, T in pairs(G:GetChildren())
            do
                local a = T:FindFirstChild("ProximityPrompt", true)
                if a and a.ActionText == "Claim" then
                    table.insert(J, T)
                end
                end
            end
        if #J == 0 then
            return nil
        end
        table.sort(J, function (e, J)
            return (e:GetPivot()).Position.Y < (J:GetPivot()).Position.Y
        end)
        local T = J[1]
        return T
    end
    local function Y8()
        task.wait(3)
        if e8.AntiCollision and (type(e8.MyAltsList) == "table" and #e8.MyAltsList > 0) then
            local e = {}
            for J, T in ipairs(e8.MyAltsList)
            do
                e[T:lower()] = true
            end
            for J, T in pairs(game.Players:GetPlayers())
            do
                if T ~= h and e[T.Name:lower()] then
                    r:Notify("\226\154\160\239\184\143 Alt detected! Bouncing to a new server...", 5)
                    task.wait(2)
                    k8 = false P8()
                    return
                end
                end
            end
        if not e8.AutoClaim then
            return
        end
        if C8 then
            return
        end
        C8 = true task.spawn(function ()
            local e = h.Character or h.CharacterAdded:Wait()
            local J = e:WaitForChild("HumanoidRootPart", 10)
            if not J then
                C8 = false
                return
            end
            local T = tostring(q())
            local a = tostring(h.UserId)
            local function X()
                local e = Z:GetData()
                if e and e.Players then
                    local J = e.Players[T] or e.Players[a]
                    if J and J.Booth then
                        return J.Booth
                    end
                    end
                if e and e.Booths then
                    for e, J in pairs(e.Booths)
                    do
                        if type(J) == "table" then
                            local X = tostring(J.Owner)
                            if X == T or X == a then
                                return e
                            end
                            end
                        end
                    end
                return nil
            end
            local k = nil
            do
                local e = os.clock() + (10)
                while os.clock() < e
                do
                    local e = Z:GetData()
                    if e and (e.Players and next(e.Players) ~= nil) then
                        k = X()
                        break
                    end
                    task.wait(0.5)
                end
                end
            if not k then
                pcall(function ()
                    local e = o:GetData()
                    if e and (e.TradeData and e.TradeData.Listings) then
                        local J = 0
                        for e in pairs(e.TradeData.Listings)
                        do
                            J = J + (1)
                        end
                        if J > 0 then
                            task.wait(2)
                            k = X()
                        end
                        end
                    end)
            end
            if k then
                local e = G:FindFirstChild(k)
                local J = e and (e:GetPivot()).Position.Y or 999
                local function T()
                    task.wait(1)
                    if e8.AutoChat and d8 then
                        d8()
                    end
                    if e8.AutoHop and U8 then
                        U8()
                    end
                    if e8.SmartAutoFruitList and (Z8 and not _smartListActive) then
                        task.wait(2)
                        Z8("Fruit")
                    elseif e8.SmartAutoList and (Z8 and not _smartListActive) then
                        task.wait(2)
                        Z8("Pet")
                    end
                    if e8.EquipPet then
                        D8()
                    end
                    end
                if J < 1 then
                    r:Notify("\240\159\143\134 Already in Premium Front Row!", 3)
                    T()
                    C8 = false
                    return
                else
                    r:Notify("\240\159\148\132 Back-row booth \226\128\148 starting upgrade loop...", 3)
                    T()
                    if q8 then
                        q8()
                    end
                    C8 = false
                    return
                end
                end
            M:FireServer()
            task.wait(0.2)
            local b = 865444 + (-865414)
            local I = false
            local f = nil
            for J = 1, b, 1
            do
                if not e8.AutoClaim then
                    break
                end
                local T = false
                local a = m8()
                if not a then
                    local e = string.format("\226\143\179 All booths taken \226\128\148 retrying in 10s (attempt %d/%d)", J, b)
                    r:Notify(e, 9)
                    pcall(function ()
                        r.Labels.AutoReconnectStatusLabel:SetText("\240\159\159\161 Claim: Waiting for booth...")
                    end)
                    task.wait(10)
                    pcall(function ()
                        Z:GetData()
                    end)
                    T = true
                end
                if not T then
                    local J = CFrame.new(((a:GetPivot() * x8)).Position)
                    if S and S.Move then
                        pcall(function ()
                            S:Move(CFrame.new(J.Position), "Booth")
                        end)
                    else
                        e:PivotTo(J)
                    end
                    task.wait(0.5)
                    V:FireServer(a)
                    local T = nil
                    for e = 1, 16, 1
                    do
                        task.wait(0.5)
                        T = X()
                        if T then
                            break
                        end
                        end
                    if T then
                        f = T
                        r:Notify("\226\156\133 Booth Claimed! Starting auto-systems...", 3)
                        I = true
                        break
                    else
                        task.wait(2)
                    end
                    end
                end
            if not I then
                r:Notify("\226\157\140 Could not claim a booth after multiple attempts.", 5)
                C8 = false
                return
            end
            task.wait(1)
            if e8.AutoChat and d8 then
                d8()
            end
            if e8.AutoHop and U8 then
                U8()
            end
            if e8.SmartAutoFruitList and Z8 then
                task.wait(2)
                if not _smartListActive then
                    Z8("Fruit")
                end
                end
            if e8.SmartAutoList and (Z8 and not _smartListActive) then
                task.wait(2)
                Z8("Pet")
            end
            if q8 and f then
                local e = G and G:FindFirstChild(f)
                if e then
                    local J = (e:GetPivot()).Position.Y
                    if J >= 1 then
                        q8()
                    end
                    end
                end
            if e8.EquipPet then
                D8()
            end
            C8 = false
        end)
    end
    q8 = function ()
        if S8 then
            return
        end
        S8 = true task.spawn(function ()
            while S8 and e8.AutoClaim
            do
                if e8.AutoHop then
                    local e = ((e8.HopTimer or (767179857) % 5148858)) - ((e8.MinutesPassed or 0))
                    if e <= 835856 + (-835854) then
                        S8 = false
                        break
                    end
                    end
                local e = nil
                local J = Z:GetData()
                if J and J.Booths then
                    for J, T in pairs(J.Booths)
                    do
                        if T.Owner == nil then
                            local T = G:FindFirstChild(J)
                            if T then
                                local J = (T:GetPivot()).Position.Y
                                if J < 1 then
                                    if not e or J < (e:GetPivot()).Position.Y then
                                        e = T
                                    end
                                    end
                                end
                            end
                        end
                    end
                if e then
                    local J = (e:GetPivot()).Position.Y
                    r:Notify("\240\159\142\175 Front-row booth spotted! Snatching...", 5)
                    pcall(function ()
                        M:FireServer()
                    end)
                    task.wait(0.3)
                    local T = h.Character
                    if T then
                        local J = CFrame.new(((e:GetPivot() * x8)).Position)
                        if S and S.Move then
                            pcall(function ()
                                S:Move(CFrame.new(J.Position), "Booth")
                            end)
                        else
                            pcall(function ()
                                T:PivotTo(J)
                            end)
                        end
                        end
                    task.wait(0.5)
                    V:FireServer(e)
                    task.wait(0.5)
                    local a = tostring(q())
                    local X = tostring(h.UserId)
                    local k = false
                    local b = Z:GetData()
                    if b and b.Players then
                        local J = b.Players[a] or b.Players[X]
                        if J and J.Booth == e.Name then
                            k = true
                        end
                        end
                    if not k and (b and b.Booths) then
                        local J = b.Booths[e.Name]
                        if J then
                            local e = tostring(J.Owner)
                            if e == a or e == X then
                                k = true
                            end
                            end
                        end
                    if not k then
                        task.wait(1)
                        local J = Z:GetData()
                        if J and J.Players then
                            local T = J.Players[a] or J.Players[X]
                            if T and T.Booth == e.Name then
                                k = true
                            end
                            end
                        if not k and (J and J.Booths) then
                            local T = J.Booths[e.Name]
                            if T then
                                local e = tostring(T.Owner)
                                if e == a or e == X then
                                    k = true
                                end
                                end
                            end
                        end
                    if k then
                        r:Notify("\240\159\143\134 Upgraded to front-row booth!", 5)
                        S8 = false
                        break
                    else
                        r:Notify("\226\154\160\239\184\143 Front-row taken! Re-claiming fallback...", 5)
                        C8 = false S8 = false Y8()
                        break
                    end
                    end
                for e = 1, 120, 1
                do
                    if not S8 or not e8.AutoClaim then
                        break
                    end
                    task.wait(1)
                end
                end
            S8 = false
        end)
    end
    local function v8(e)
        if h8 then
            pcall(function ()
                end)
            h8 = nil
        end
        k8 = true h8 = task.spawn(function ()
            local J, T = pcall(e)
            if not J then
                warn("\226\157\140 [TOMI HUB] Hop Thread Error: "..tostring(T))
            end
            k8 = false h8 = nil
        end)
    end
    local i8 = false
    local K8 = (syn and syn.request) or (http and http.request) or http_request or request
    local function E8(J)
        if type(K8) == "function" then
            local T, a = pcall(K8, {Url = J, Method = "GET"})
            if T and (type(a) == "table" and (tonumber(a.StatusCode) == 200 and a.Body)) then
                local J, T = pcall(function ()
                    return e:JSONDecode(a.Body)
                end)
                if J and (type(T) == "table" and T.data) then
                    return true, T
                end
                end
            end
        if i8 then
            local T = J:gsub("games.roblox.com", "games.roproxy.com")
            local a, X = pcall(function ()
                return e:JSONDecode(game:HttpGet(T))
            end)
            if a and (type(X) == "table" and X.data) then
                return true, X
            end
            local k, h = pcall(function ()
                return e:JSONDecode(game:HttpGet(J))
            end)
            if k and (type(h) == "table" and h.data) then
                i8 = false
                return true, h
            end
            local b = not a and tostring(X) or (not k and tostring(h) or "Invalid data format")
            return false, b
        else
            local T, a = pcall(function ()
                return e:JSONDecode(game:HttpGet(J))
            end)
            if T and (type(a) == "table" and a.data) then
                return true, a
            end
            local X = J:gsub("games.roblox.com", "games.roproxy.com")
            local k, h = pcall(function ()
                return e:JSONDecode(game:HttpGet(X))
            end)
            if k and (type(h) == "table" and h.data) then
                i8 = true
                return true, h
            end
            local b = not T and tostring(a) or (not k and tostring(h) or "Invalid data format")
            return false, b
        end
        end
    local function c8()
        r:Notify("Searching for populated server (\226\137\16550% full)...", 5)
        local J = 0
        math.randomseed(((((tonumber((tostring(h.UserId)):sub(-6)) or (387458) - 387335)) + os.time())) % 2147483647)
        while true
        do
            local a = ""
            local X = 3
            local k = 0.5
            local b = {}
            local I = false
            local f = nil
            for e = 1, X, 1
            do
                local J = "https://games.roblox.com/v1/games/"..(J8.."/servers/Public?sortOrder=Desc&limit=100")
                if a ~= "" then
                    J = J..("&cursor="..a)
                end
                local T, X = E8(J)
                if not T then
                    I = true f = X
                    break
                end
                if type(X) ~= "table" or not X.data then
                    break
                end
                if type(X.nextPageCursor) == "string" and X.nextPageCursor ~= "null" then
                    a = X.nextPageCursor
                else
                    a = ""
                end
                for e, J in pairs(X.data)
                do
                    local T = tostring(J.id)
                    local a = false
                    for e, J in pairs(a8)
                    do
                        if T == tostring(J) then
                            a = true
                            break
                        end
                        end
                    local X = tonumber(J.playing) or 0
                    local h = tonumber(J.maxPlayers) or -523243 - (-523243)
                    if not a and (T ~= b8 and (h > 0 and X < h)) then
                        local e = X / h
                        local J = X
                        if e >= k then
                            J = J + (1000)
                        end
                        table.insert(b, {id = T;
                        playing = X;
                        maxPlayers = h;
                        score = J})
                    end
                    end
                if a == "" then
                    break
                end
                task.wait(0.5)
            end
            table.sort(b, function (e, J)
                return e.score > J.score
            end)
            if #b == -737153 - (-737153) then
                if I then
                    J = J + (1)
                    local e = math.min(90, 10 * (2 ^ ((J - 1))))
                    e = e + math.random(0, 5000) / (1000)
                    r:Notify(string.format("Server list unavailable (try %d, likely rate-limited). Waiting %ds -- keeping list. [%s]", J, math.floor(e), (tostring(f)):sub(1, 30)), 4)
                    task.wait(e)
                else
                    J = 0
                    r:Notify("No unvisited servers. Clearing list & retrying...", 3)
                    a8 = {}
                    pcall(function ()
                        writefile(T8, "[]")
                    end)
                    task.wait(5 + math.random(0, 3000) / 1000)
                end
                else
                J = 0
                local a = tonumber((tostring(h.UserId)):sub(-5)) or -1684309
                math.randomseed(((os.time() + a)) % 2147483647)
                local X = math.min(15, #b)
                local k = {}
                for e = 1, X, 1
                do
                    k[e] = b[e]
                end
                for e = #k, 2, -1
                do
                    local J = math.random(1, e)
                    k[e], k[J] = k[J], k[e]
                end
                for e = X + 1, #b, 1
                do
                    table.insert(k, b[e])
                end
                local I = false
                for J, a in ipairs(k)
                do
                    if a.id ~= b8 then
                        local X = math.floor(((a.playing / a.maxPlayers)) * 100)
                        r:Notify(string.format("Trying server %d/%d (%d/%d players, %d%% full)", J, #k, a.playing, a.maxPlayers, X), 5)
                        table.insert(a8, a.id)
                        if #a8 >= 50 then
                            a8 = {}
                        end
                        pcall(function ()
                            writefile(T8, e:JSONEncode(a8))
                        end)
                        local b = false
                        local f
                        f = T.TeleportInitFailed:Connect(function ()
                            b = true
                        end)
                        local p = pcall(function ()
                            T:TeleportToPlaceInstance(J8, a.id, h)
                        end)
                        local n = false
                        local t = tick()
                        while not n and (not b and (tick() - t < 8))
                        do
                            task.wait(0.5)
                            if not h.Character then
                                n = true
                            end
                            end
                        if f then
                            f:Disconnect()
                        end
                        if p and (not b and n) then
                            I = true
                            break
                        end
                        task.wait(1)
                    end
                    end
                if I then
                    break
                end
                r:Notify("All servers failed. Clearing & retrying...", 3)
                a8 = {}
                pcall(function ()
                    writefile(T8, "[]")
                end)
                task.wait(3)
            end
            end
        end
    local function l8()
        r:Notify("\226\154\161 Fast Hop: Starting fast server hop...", 4)
        while true
        do
            local J = "https://games.roblox.com/v1/games/"..(J8.."/servers/Public?sortOrder=Desc&limit=100")
            local a, X = E8(J)
            if a then
                if type(X) == "table" and X.data then
                    local J = {}
                    for e, T in pairs(X.data)
                    do
                        local a = tostring(T.id)
                        local X = false
                        for e, J in pairs(a8)
                        do
                            if a == tostring(J) then
                                X = true
                                break
                            end
                            end
                        local k = tonumber(T.playing) or (584901613) % 5200175
                        local h = tonumber(T.maxPlayers) or -493244
                        if not X and (a ~= b8 and (h > 0 and k < h)) then
                            table.insert(J, {id = a;
                            playing = k, maxPlayers = h})
                        end
                        end
                    if #J > 0 then
                        for e = #J, 2, -831613 - (-831612)
                        do
                            local T = math.random(1, e)
                            J[e], J[T] = J[T], J[e]
                        end
                        local a = math.min(5, #J)
                        local X = false
                        for k = 1, a, 1
                        do
                            local b = J[k]
                            local I = math.floor(((b.playing / b.maxPlayers)) * 100)
                            r:Notify(string.format("\226\154\161 Trying server %d/%d (%d/%d players, %d%% full)", k, a, b.playing, b.maxPlayers, I), 4)
                            table.insert(a8, b.id)
                            if #a8 >= 50 then
                                a8 = {}
                            end
                            pcall(function ()
                                writefile(T8, e:JSONEncode(a8))
                            end)
                            local f = false
                            local p
                            p = T.TeleportInitFailed:Connect(function ()
                                f = true
                            end)
                            local n = pcall(function ()
                                T:TeleportToPlaceInstance(J8, b.id, h)
                            end)
                            local t = false
                            local Q = tick()
                            while not t and (not f and (tick() - Q < 8))
                            do
                                task.wait(0.5)
                                if not h.Character then
                                    t = true
                                end
                                end
                            if p then
                                p:Disconnect()
                            end
                            if n and (not f and t) then
                                X = true
                                break
                            end
                            task.wait(1)
                        end
                        if X then
                            break
                        end
                        r:Notify("\226\154\161 All fast candidates failed. Retrying...", 3)
                        task.wait(2)
                    else
                        r:Notify("\226\154\160\239\184\143 Fast Hop: Visited all servers! Clearing history...", 3)
                        a8 = {}
                        pcall(function ()
                            writefile(T8, "[]")
                        end)
                        task.wait(3)
                    end
                    else
                    task.wait(3)
                end
                else
                task.wait(3)
            end
            end
        end
    P8 = function ()
        pcall(L8)
        v8(c8)
    end
    W8 = function ()
        pcall(L8)
        v8(l8)
    end
    _G.TOMIHUB_FastAgeBreak = _G.TOMIHUB_FastAgeBreak or {Active = false;
    PetReady = false;
    MainPlaceId = nil}
    local B8 = nil
    local function eW()
        local e = _G.TOMIHUB_FastAgeBreak
        local J = nil pcall(function ()
            J = (game:GetService("ReplicatedStorage")).GameEvents.TradeWorld.TravelToMainWorld
        end)
        r:Notify("\226\154\161 FastAgeBreak: Hop loop started, monitoring machine...", 3)
        while true
        do
            task.wait(2)
            local a = L()
            if a then
                if a.PetReady then
                    print("[FastAgeBreak] PetReady detected \226\128\148 returning to Main World to claim!")
                    r:Notify("\226\154\161 FastAgeBreak: Pet ready! Returning to Main World...", 5)
                    e.PetReady = true e.Active = false task.wait(1)
                    local a = false
                    if J then
                        local e = pcall(function ()
                            J:FireServer()
                        end)
                        if e then
                            a = true
                        end
                        else
                        local J = e.MainPlaceId
                        if J then
                            local e = pcall(function ()
                                T:Teleport(J, h)
                            end)
                            if e then
                                a = true
                            end
                            else
                            warn("[FastAgeBreak] No TravelToMainWorld remote and no MainPlaceId!")
                            r:Notify("\226\154\160\239\184\143 FastAgeBreak: Cannot return \226\128\148 no remote or PlaceId!", 5)
                        end
                        end
                    if a then
                        print("[FastAgeBreak] Travel to Main World initiated, waiting for teleport...")
                        task.wait(30)
                    end
                    elseif a.IsRunning and (a.TimeLeft and a.TimeLeft > 0) then
                    local J = a.TimeLeft
                    print(string.format("[FastAgeBreak] Machine timer active (%.0fs left) \226\128\148 starting fast hop!", J))
                    r:Notify(string.format("\226\154\161 FastAgeBreak: Timer active (%ds) \226\128\148 hopping!", math.ceil(J)), 4)
                    e.Active = true e.PetReady = false task.wait(1)
                    local X = Instance.new("TeleportOptions")
                    X.ServerInstanceId = game.JobId
                    local k, b = pcall(function ()
                        T:TeleportAsync(game.PlaceId, {h}, X)
                    end)
                    if not k then
                        pcall(function ()
                            T:Teleport(game.PlaceId, h)
                        end)
                    end
                    task.wait(30)
                end
                end
            end
        end
    task.spawn(function ()
        task.wait(2)
        B8 = task.spawn(eW)
    end)
    U8 = function ()
        e8.MinutesPassed = 0
    end
    task.spawn(function ()
        while task.wait(60)
        do
            if e8.AutoHop then
                if not ((e8.AutoScan or e8.AutoScanV2)) then
                    e8.MinutesPassed = ((e8.MinutesPassed or -1762228)) + 1
                    if e8.MinutesPassed >= e8.HopTimer then
                        if e8.SmartHop then
                            while e8.AutoHop and (not ((e8.AutoScan or e8.AutoScanV2)) and I8 > 0)
                            do
                                local e = r8 - ((tick() - I8))
                                if e <= 0 then
                                    break
                                end
                                task.wait(math.min(e, 5))
                            end
                            end
                        if e8.AutoHop and not ((e8.AutoScan or e8.AutoScanV2)) then
                            e8.MinutesPassed = -8657 - (-8657)
                            SaveConfig()
                            task.spawn(function ()
                                local e = math.random(1, 10)
                                task.wait(e)
                                if e8.AutoHop and not ((e8.AutoScan or e8.AutoScanV2)) then
                                    P8()
                                end
                                end)
                        end
                        end
                    end
                end
            end
        end)
    local JW = nil
    local TW = nil
    local aW = 228611 - (228611)
    local function XW()
        local e, J = pcall(function ()
            local e = require((game:GetService("ReplicatedStorage")).Modules.DataService)
            local J = e:GetData()
            return J.TradeData.Tokens
        end)
        if e and tonumber(J) then
            return tonumber(J)
        end
        local T, a = pcall(function ()
            return ((h:WaitForChild("leaderstats", 3)):WaitForChild("Tokens", 3)).Value
        end)
        if T and tonumber(a) then
            return tonumber(a)
        end
        return 0
    end
    local function kW(e)
        if typeof(e) == "Instance" and e:IsA("Player") then
            return e
        end
        local J = tonumber(e)
        if J then
            local e = X:GetPlayerByUserId(J)
            if e then
                return e
            end
            end
        local T = tostring(e)
        local a = X:FindFirstChild(T)
        if a then
            return a
        end
        for e, J in ipairs(X:GetPlayers())
        do
            if tostring(J.UserId) == T or J.Name == T or J.DisplayName == T then
                return J
            end
            end
        return nil
    end
    local function hW(e)
        local J = Z:GetData()
        if not J or not J.Booths then
            return false
        end
        local T = (tostring(e)):gsub("^Player_", "")
        for e, J in pairs(J.Booths)
        do
            local a = (tostring(J.Owner or "")):gsub("^Player_", "")
            if a == T then
                return true
            end
            end
        return false
    end
    local function bW(e, J, T, a, X)
        if aW >= ((e8.MaxBuys or 1)) then
            j("\240\159\155\145 MaxBuys limit reached ("..(aW..("/"..(e8.MaxBuys.."). AutoBuy disabled."))), 5)
            e8.AutoBuy = false SaveConfig()
            pcall(function ()
                Toggles.AutoBuyToggle:SetValue(false)
            end)
            return false
        end
        local k = XW()
        if k < T then
            j("\240\159\146\184 Insufficient tokens! Have: "..(O8(k)..(" | Need: "..O8(T))), 5)
            e8.AutoBuy = false SaveConfig()
            pcall(function ()
                Toggles.AutoBuyToggle:SetValue(false)
            end)
            return false
        end
        local h = math.floor(X * 100.5) / (100)
        local b = e8.MinWeight
        local r = e8.MaxWeight
        if h < b or h > r then
            j("\226\154\160\239\184\143 Weight mismatch after rounding ("..(string.format("%.2f", h).."). Skipped."), 3)
            return false
        end
        j(string.format("\240\159\155\146 Attempting to buy %s (%.2f KG) for %s tokens...", tostring(a), h, O8(T)), 3)
        local I, f, p = pcall(function ()
            return D:InvokeServer(e, tostring(J))
        end)
        if I and f then
            aW = aW + (1)
            j(string.format("\226\156\133 PURCHASED %s! (%.2f KG) | Buy #%d/%d", tostring(a), h, aW, e8.MaxBuys or -171229), 8)
            if aW >= ((e8.MaxBuys or 1)) then
                j("\240\159\155\145 MaxBuys limit reached. AutoBuy disabled.", 5)
                e8.AutoBuy = false SaveConfig()
                pcall(function ()
                    Toggles.AutoBuyToggle:SetValue(false)
                end)
            end
            return true
        else
            local e = "Unknown Error"
            if not I then
                e = tostring(f)
            elseif p then
                e = tostring(p)
            end
            j("\226\157\140 Purchase failed (likely sold): "..e:sub(1, 80), 5)
            return false
        end
        end
    local rW = {}
    local IW = {"Any"}
    pcall(function ()
        local e = require(((J:WaitForChild("Data", 5)):WaitForChild("PetRegistry", 5)):WaitForChild("PetMutationRegistry", 5))
        local T = e.EnumToPetMutation
        if type(T) ~= "table" then
            T = type(e.PetMutationRegistry) == "table" and e.PetMutationRegistry.EnumToPetMutation or nil
        end
        if type(T) ~= "table" then
            return
        end
        local a = {}
        for e, J in pairs(T)
        do
            if type(e) == "string" and type(J) == "string" then
                rW[e] = J
                table.insert(a, J)
            end
            end
        table.sort(a)
        for e, J in ipairs(a)
        do
            table.insert(IW, J)
        end
        end)
    if #IW == 1 then
        warn("[TOMI HUB] PetMutationRegistry failed \226\128\148 using hardcoded pet mutation fallback.")
        for e, J in ipairs({"Normal", "Golden", "Shiny", "Rainbow";
        "Everchanted";
        "Alienated";
        "Aromatic";
        "Ascended", "Aurora";
        "Blossoming";
        "Corrupted";
        "Crocodile";
        "Dreadbound";
        "Fiery", "Forger", "Fried";
        "Frozen", "Glimmering", "HyperHunger", "Inverted", "IronSkin";
        "JUMBO";
        "JollyDecorator";
        "Lion", "Luminous";
        "Mega", "MerryNursery";
        "Nightmare";
        "Nocturnal";
        "Nutty", "Oxpecker";
        "Peppermint";
        "Radiant", "Rhino", "Rideable", "RoyalJelly", "Silver";
        "Shocked";
        "Soulflame", "Spectral", "SpiritSparkle";
        "Tethered", "Tiny", "Tranquil", "UFO", "Venom", "Windy"})
        do
            table.insert(IW, J)
        end
        end
    g8 = function (e)
        if not e then
            return "Normal"
        end
        local J = e.PetData or (e.data and e.data.PetData)
        local T = J and ((J.MutationType or J.Mutation))
        if T == nil then
            T = e.MutationType or e.Mutation
        end
        if T == nil then
            return "Normal"
        end
        T = tostring(T)
        local a = rW[T]
        return a or T
    end
    local function fW(e)
        local J = e8.ScanMutations
        if type(J) ~= "table" or next(J) == nil then
            return true
        end
        local T = ((e or "Normal")):lower()
        for e, J in pairs(J)
        do
            if type(e) == "string" and J == true then
                if e:lower() == T then
                    return true
                end
                elseif type(e) == "number" and type(J) == "string" then
                if J:lower() == T then
                    return true
                end
                end
            end
        return false
    end
    F.MutationSetPasses = function (e, J)
        if type(e) ~= "table" or next(e) == nil then
            return true
        end
        local T = ((J or "Normal")):lower()
        for e, J in pairs(e)
        do
            if type(e) == "string" and J == true then
                if e:lower() == T then
                    return true
                end
                elseif type(e) == "number" and type(J) == "string" then
                if J:lower() == T then
                    return true
                end
                end
            end
        return false
    end
    local function pW(e, J)
        if not ((P and (P.Booths and P.Players))) then
            r:Notify("\226\157\140 Booth data not ready. Try again.", 3)
            return -727667 + (727667)
        end
        local T = 0
        local a = tostring(q())
        local X = tostring(h.UserId)
        local k = {}
        for J, b in pairs(P.Booths)
        do
            local I = b.Owner
            if I and I ~= -815770 - (-815770) then
                local b = (tostring(I)):gsub("^Player_", "")
                local f = tonumber(b) or I
                if b ~= a and (b ~= X and not k[b]) then
                    k[b] = true
                    local a = P.Players[I] or P.Players[f] or P.Players[b]
                    if a and a.Listings then
                        for X, k in pairs(a.Listings)
                        do
                            if _blacklistedListings and _blacklistedListings[tostring(X)] then
                                else
                                local b = k.ItemId
                                local I = k.Price or 0
                                local p = a.Items and a.Items[b]
                                if p then
                                    local a = p.Name or p.ItemName or p.PetType or p.SkinID
                                    local k = V8(p)
                                    local b = M8(p)
                                    local n = tonumber(k) or -115012
                                    local t = tonumber(b) or (153597) - (153597)
                                    local Q = g8(p)
                                    if a and a == e8.TargetPet then
                                        local e = {}
                                        for J, T in pairs(e8.ScanMutations or {})
                                        do
                                            if type(J) == "string" and T == true then
                                                table.insert(e, J)
                                            elseif type(J) == "number" and type(T) == "string" then
                                                table.insert(e, T)
                                            end
                                            end
                                        print(string.format("[MutDebug] Pet: %s | RawEnum: %s | Decoded: %s | Filter: [%s] | Pass: %s", tostring(a), tostring(p.PetData and p.PetData.MutationType or "nil"), tostring(Q), #e > 0 and table.concat(e, ",") or "ANY", tostring(fW(Q))))
                                    end
                                    local w = e8.MinWeight
                                    local F = e8.MaxWeight
                                    local A = t * 1.1
                                    if a and (a == e8.TargetPet and (A > 11797482 % (170978) and (A >= w and (A <= F and (I <= e8.MaxPrice and (n <= e8.MaxAge and fW(Q))))))) then
                                        T = T + 1
                                        task.spawn(function ()
                                            pcall(r.Notify, r, string.format("\226\156\133 %s Found! Base: %.2f KG | Age: %d | \240\159\167\172 %s | \240\159\146\176 %s | Booth: %s", tostring(a), t, n, tostring(Q), tostring(I), tostring(J)), 8)
                                        end)
                                        z8(J)
                                        if e8.AutoTPToBooth then
                                            pcall(function ()
                                                local e = G:FindFirstChild(J)
                                                if e then
                                                    local J = CFrame.new(((e:GetPivot() * x8)).Position)
                                                    local T = h.Character
                                                    if T then
                                                        if S and S.Move then
                                                            S:Move(CFrame.new(J.Position), "Booth")
                                                        else
                                                            T:PivotTo(J)
                                                        end
                                                        end
                                                    end
                                                end)
                                        end
                                        if e8.AutoBuy then
                                            local e = kW(f)
                                            if e then
                                                bW(e, X, I, a, A)
                                            else
                                                j("\226\154\160\239\184\143 Booth owner left server. Cannot buy.", 3)
                                            end
                                            end
                                        if e and JW then
                                            JW(a, t, k, I, J, Q)
                                        end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        if T == 0 then
            if not J then
                task.spawn(function ()
                    pcall(r.Notify, r, "\226\157\140 No "..(tostring(e8.TargetPet).." matching filters."), 5)
                end)
            end
            else
            task.spawn(function ()
                pcall(r.Notify, r, string.format("\226\156\133 %d %s match(es) found!", T, tostring(e8.TargetPet)), 5)
            end)
        end
        return T
    end
    do
        local e = workspace.CurrentCamera
        while e and ((e.ViewportSize.X < 100 or e.ViewportSize.Y < 100))
        do
            task.wait(1)
            e = workspace.CurrentCamera
        end
        end
    local nW = r:CreateWindow({Title = "TOMI HUB", Footer = "discord.gg/8FCVvpGezP", Size = UDim2.fromOffset(720, 600), ToggleKeybind = Enum.KeyCode.LeftControl;
    AutoShow = true, Center = true;
    ShowCustomCursor = false})
    local tW = nW:AddTab("MAIN", "house")
    local QW = nW:AddTab("BOOTH MANAGER", "store")
    local wW = nW:AddTab("SCANNER", "scan")
    local FW = nW:AddTab("SNIPER", "crosshair")
    local AW = nW:AddTab("SERVER HOP", "zap")
    local sW = nW:AddTab("SETTINGS", "settings")
    local jW = tW:AddRightGroupbox("Server")
    do
        local e = 6
        local J = 2072559910 % (13909798)
        local T = (getmetatable(jW)).__index
        local function a(e, J)
            local T = e.BuildDropdownList
            local a = e.Menu
            if not ((T and (a and a.Open))) then
                return
            end
            local X = (J == true)
            e.BuildDropdownList = function (...)
                if a.Active then
                    X = false
                    return T(...)
                end
                X = true
            end
            local k = a.Open
            a.Open = function (e,...)
                if X then
                    X = false T()
                end
                return k(e,...)
            end
            end
        local X = T.AddDropdown
        T.AddDropdown = function (T, k, h)
            local b = nil
            if type(h) == "table" and (type(h.Values) == "table" and (#h.Values > 40 and h.Default == nil)) then
                b = h.Values
                h.Values = {}
            end
            local r = X(T, k, h)
            a(r, b ~= nil)
            if b then
                r.Values = b
                r.DefaultValues = b
            end
            local I = T.Container:GetChildren()
            local f = I[#I]
            if f and f:IsA("Frame") then
                local T = f.Size.Y.Offset > 21
                f.Size = UDim2.new(1, 0, 0, ((T and 39 or -787701)) + e)
                local a = f:FindFirstChildWhichIsA("TextButton")
                if a then
                    a.Size = UDim2.new(1, 0, 0, 21 + e)
                    local T = a:FindFirstChildOfClass("UICorner")
                    if T then
                        T.CornerRadius = UDim.new(0, J)
                    else
                        local e = Instance.new("UICorner")
                        e.CornerRadius = UDim.new(0, J)
                        e.Parent = a
                    end
                    local X = a:FindFirstChildWhichIsA("TextButton")
                    if X then
                        X.Size = UDim2.new(1, 0, 0, 21 + e)
                    end
                    a.TextYAlignment = Enum.TextYAlignment.Center
                    for e, J in ipairs(a:GetDescendants())
                    do
                        if J:IsA("TextLabel") or J:IsA("TextButton") then
                            J.TextYAlignment = Enum.TextYAlignment.Center
                        end
                        end
                    end
                end
            return r
        end
        local k = T.AddInput
        T.AddInput = function (T, a, X)
            local h = k(T, a, X)
            local b = T.Container:GetChildren()
            local r = b[#b]
            if r and r:IsA("Frame") then
                local T = r.Size.Y.Offset > -845061 - (-845082)
                r.Size = UDim2.new(1, 0, 0, ((T and (237095) + -237056 or 21)) + e)
                local a = r:FindFirstChildWhichIsA("TextBox")
                if a then
                    a.Size = UDim2.new(1, 0, 0, 21 + e)
                    a.ClearTextOnFocus = false a.TextScaled = false a.TextSize = 13
                    a.TextYAlignment = Enum.TextYAlignment.Center
                    for e, J in ipairs(a:GetDescendants())
                    do
                        if J:IsA("TextLabel") or J:IsA("TextButton") then
                            J.TextYAlignment = Enum.TextYAlignment.Center
                        end
                        end
                    local T = a:FindFirstChildOfClass("UICorner")
                    if T then
                        T.CornerRadius = UDim.new(0, J)
                    else
                        local e = Instance.new("UICorner")
                        e.CornerRadius = UDim.new(0, J)
                        e.Parent = a
                    end
                    end
                end
            return h
        end
        end
    jW:AddToggle("AutoReconnectToggle", {Text = "\240\159\148\129 Auto Reconnect", Default = e8.AutoReconnect;
    Tooltip = "Automatically rejoins a fresh server when disconnected (errors 277/279/288)"})
    jW:AddLabel("AutoReconnectStatusLabel", {Text = e8.AutoReconnect and "\240\159\159\162 Reconnect: Listening..." or "\240\159\148\180 Reconnect: Off";
    DoesWrap = true})
    jW:AddDivider()
    w(jW, "BtnRejoinServer", {{"\240\159\148\132 Rejoin Server", function ()
        pcall(L8)
        r:Notify("\240\159\148\132 Rejoining server...", 3)
        local e = Instance.new("TeleportOptions")
        e.ServerInstanceId = game.JobId
        local J, a = pcall(function ()
            T:TeleportAsync(game.PlaceId, {h}, e)
        end)
        if not J then
            r:Notify("\226\154\160\239\184\143 Retrying with fallback...", 3)
            pcall(function ()
                T:Teleport(game.PlaceId, h)
            end)
        end
        end};
    {"\240\159\147\139 Copy Job ID", function ()
        local e = tostring(game.JobId)
        if e and e ~= "" then
            local J = false pcall(function ()
                if setclipboard then
                    setclipboard(e)
                    J = true
                elseif toclipboard then
                    toclipboard(e)
                    J = true
                elseif Clipboard and Clipboard.set then
                    Clipboard.set(e)
                    J = true
                end
                end)
            if J then
                r:Notify("\240\159\147\139 Job ID copied: "..e, 4)
            else
                r:Notify("\226\154\160\239\184\143 Clipboard not supported by your executor. Job ID: "..e, 6)
            end
            else
            r:Notify("\226\154\160\239\184\143 Job ID is unavailable in this server.", 4)
        end
        end}})
    local oW = tW:AddLeftGroupbox("\240\159\147\138 Server Status")
    F.Merge(oW, function ()
        oW:AddLabel("ServerTimeLabel", {Text = "\226\143\177\239\184\143 Time in Server: 0m 0s", DoesWrap = true})
        oW:AddLabel("ActiveListingsLabel", {Text = "\240\159\147\166 Listings: \226\128\148", DoesWrap = true})
        oW:AddLabel("ServerBuysLabel", {Text = "\240\159\155\146 Buys This Server: 0", DoesWrap = true})
    end)
    local RW = tW:AddLeftGroupbox("\240\159\142\146 Inventory")
    RW:AddLabel("BalanceLabel", {Text = "\240\159\170\153 Tokens: \226\128\148";
    DoesWrap = true})
    RW:AddDivider()
    RW:AddLabel("PetCountLabel", {Text = "\240\159\144\190 Pets: \226\128\148";
    DoesWrap = true})
    RW:AddLabel("PetBreakdownLabel", {Text = "";
    DoesWrap = true})
    RW:AddDivider()
    RW:AddLabel("FruitCountLabel", {Text = "\240\159\141\142 Fruits: \226\128\148", DoesWrap = true})
    local function LW(e)
        local J = math.floor(e)
        local T = math.floor(J / 3600)
        local a = math.floor(((J % 3600)) / 60)
        local X = J % (60)
        if T > (-857849) - (-857849) then
            return string.format("%dh %dm %ds", T, a, X)
        else
            return string.format("%dm %ds", a, X)
        end
        end
    task.spawn(function ()
        task.wait(3)
        while true
        do
            pcall(function ()
                local e = o:GetData()
                local J = tick() - f8
                r.Labels.ServerTimeLabel:SetText("\226\143\177\239\184\143 Time in Server: "..LW(J))
                local T = e.TradeData and e.TradeData.Listings or {}
                local a = 0
                for e in pairs(T)
                do
                    a = a + (1)
                end
                local X = (e.TradeData and e.TradeData.MaxListings) or (-66611) - (-66661)
                r.Labels.ActiveListingsLabel:SetText(string.format("\240\159\147\166 Listings: %d / %d", a, X))
                r.Labels.ServerBuysLabel:SetText("\240\159\155\146 Buys This Server: "..p8)
                local k = (e.TradeData and e.TradeData.Tokens) or 0
                r.Labels.BalanceLabel:SetText("\240\159\170\153 Tokens: "..O8(k))
                local h = e.PetsData and (e.PetsData.PetInventory and e.PetsData.PetInventory.Data) or {}
                local b = 197777790 % (2197531)
                local I = {}
                for e, J in pairs(h)
                do
                    b = b + 1
                    local T = tostring(J.PetType or "Unknown")
                    I[T] = ((I[T] or 0)) + (1)
                end
                local f = e.PetsData and (e.PetsData.MutableStats and e.PetsData.MutableStats.MaxPetsInInventory) or "?"
                r.Labels.PetCountLabel:SetText(string.format("\240\159\144\190 Pets: %d / %s", b, tostring(f)))
                local p = {}
                for e, J in pairs(I)
                do
                    table.insert(p, string.format("  %s  %dx", e, J))
                end
                table.sort(p)
                r.Labels.PetBreakdownLabel:SetText(table.concat(p, "\n"))
                local n = -221392 - (-221392)
                local t = 0
                local Q = e and e.InventoryData
                if type(Q) == "table" then
                    local e = {}
                    for J, T in pairs(Q)
                    do
                        if type(T) == "table" and T.ItemType == "Holdable" then
                            n = n + 1
                            local J = T.ItemData or {}
                            local a = J.ItemName or J.Name or T.ItemName or T.Name
                            if a and not e[a] then
                                e[a] = true t = t + (1)
                            end
                            end
                        end
                    end
                r.Labels.FruitCountLabel:SetText(string.format("\240\159\141\142 Fruits: %d (%d types)", n, t))
            end)
            task.wait(5)
        end
        end)
    local uW = QW:AddLeftGroupbox("Pet Listing")
    uW:AddLabel("PetSmartListerStatusLabel", {Text = "\226\143\184\239\184\143 Smart Lister: Off";
    DoesWrap = true})
    uW:AddLabel("PetSmartListerSlotLabel", {Text = "\240\159\147\166 Slots: \226\128\148", DoesWrap = true})
    uW:AddDivider()
    local HW = Q(uW, "SelectPet", "Select Pet", x, {text = "\240\159\144\190 Select Pet";
    get = function ()
        return e8.ListingPet
    end, set = function (e)
        e8.ListingPet = e
    end, onChange = SaveConfig})
    uW:AddDivider()
    uW:AddInput("PriceInput", {Text = "\240\159\146\176 Price", Default = tostring(e8.Price);
    Numeric = true;
    Placeholder = "20"})
    uW:AddInput("MinWeightInput", {Text = "Min Weight";
    Default = tostring(e8.ListingMinWeight), Numeric = true;
    Placeholder = "1.0"})
    uW:AddInput("MaxWeightInput", {Text = "Max Weight";
    Default = tostring(e8.ListingMaxWeight);
    Numeric = true, Placeholder = "10.0"})
    F.ListMutationStore = {}
    if type(e8.ListMutations) == "table" then
        for e, J in pairs(e8.ListMutations)
        do
            if J == true then
                F.ListMutationStore[e] = true
            end
            end
        end
    F.ListMutationCtl = Q(uW, "ListMutationMulti", "List Mutations", ((function ()
        local e = {}
        for J, T in ipairs(IW)
        do
            if T ~= "Normal" then
                table.insert(e, T)
            end
            end
        if #e < #IW then
            table.insert(e, 1, "Normal")
        end
        return e
    end))(), {text = "\240\159\167\172 List Mutations";
    tooltip = "Only list pets with these mutations. Pick Normal for unmutated pets. Leave empty to list all.", multi = true, store = F.ListMutationStore, onChange = function ()
        local e = {}
        for J, T in pairs(F.ListMutationStore)
        do
            if T == true then
                e[J] = true
            end
            end
        e8.ListMutations = e
        SaveConfig()
    end})
    uW:AddDivider()
    uW:AddToggle("AutoListToggle", {Text = "\226\154\161 Auto-List", Default = false;
    Tooltip = "Lists all matching pets once then stops \226\128\148 does not check slot limit"})
    uW:AddToggle("SmartAutoListToggle", {Text = "\240\159\167\160 Smart Auto-List", Default = false, Tooltip = "Persistent lister \226\128\148 checks slots before each listing, sleeps when booth is full, wakes when a sale opens a slot"})
    local OW = QW:AddLeftGroupbox("Fruit / Holdable Listing")
    OW:AddLabel("FruitSmartListerStatusLabel", {Text = "\226\143\184\239\184\143 Smart Lister: Off";
    DoesWrap = true})
    OW:AddLabel("FruitSmartListerSlotLabel", {Text = "\240\159\147\166 Slots: \226\128\148", DoesWrap = true})
    OW:AddDivider()
    local yW = Q(OW, "SelectFruit", "Select Fruit", K, {text = "\240\159\141\142 Select Fruit";
    get = function ()
        return e8.ListingFruit
    end;
    set = function (e)
        e8.ListingFruit = e
    end, onChange = SaveConfig})
    OW:AddDivider()
    OW:AddInput("FruitPriceInput", {Text = "\240\159\146\176 Price", Default = tostring(e8.FruitPrice);
    Numeric = true;
    Placeholder = "5"})
    OW:AddInput("FruitMinWeightInput", {Text = "Min Weight";
    Default = tostring(e8.FruitMinWeight);
    Numeric = true, Placeholder = "0"})
    OW:AddInput("FruitMaxWeightInput", {Text = "Max Weight", Default = tostring(e8.FruitMaxWeight);
    Numeric = true, Placeholder = "140"})
    OW:AddDivider()
    OW:AddToggle("AutoFruitListToggle", {Text = "\226\154\161 Auto-List ", Default = false, Tooltip = "Lists all matching fruits once then stops \226\128\148 does not check slot limit"})
    OW:AddToggle("SmartAutoFruitListToggle", {Text = "\240\159\167\160 Smart Auto-List ", Default = false;
    Tooltip = "Persistent lister \226\128\148 checks slots before each listing, sleeps when booth is full, wakes when a sale opens a slot"})
    OW:AddDivider()
    w(OW, "BtnRefreshFruitInventory", {{"\240\159\148\132 Refresh Fruit Inventory";
    function ()
        local e, J = pcall(function ()
            K = {}
            E = {}
            local e = o:GetData()
            if not e then
                r:Notify("\226\157\140 Refresh failed: no data from server.", 4)
                return
            end
            if type(e.InventoryData) ~= "table" then
                r:Notify("\226\157\140 Refresh failed: InventoryData not found.", 4)
                return
            end
            c(e)
            if #K == -993780 - (-993780) then
                table.insert(K, "No Fruits Found")
                r:Notify("\226\154\160\239\184\143 No holdable fruits found in inventory.", 4)
            else
                table.sort(K)
                yW.Overlay.SetItems(K)
                yW:SetValue(K[1])
                e8.ListingFruit = K[1]
                SaveConfig()
                r:Notify(string.format("\226\156\133 Refreshed! %d fruit type(s) found.", #K), 3)
            end
            end)
        if not e then
            r:Notify("\226\157\140 Refresh error \226\128\148 check console.", 4)
        end
        end}})
    local VW = QW:AddRightGroupbox("Unlisting & Automation")
    w(VW, "BtnUnlistTargetRange", {{"Unlist Target Range", function ()
        if e8.AutoList then
            e8.AutoList = false r.Toggles.AutoListToggle:SetValue(false)
            task.wait(0.5)
        end
        local e = J.GameEvents.TradeEvents.Booths.RemoveListing
        local T = (o:GetData()).TradeData.Listings
        if not T then
            return
        end
        for J, T in pairs(T)
        do
            local a = G8(T.ItemId)
            if a and tostring(a.PetType) == e8.ListingPet then
                local T = a.PetData or a
                local X = T.Age or T.Level or T.PetAge or 302226384 % (12592766)
                local k = y8(T.BaseWeight, X)
                if k >= e8.ListingMinWeight and k <= e8.ListingMaxWeight then
                    e:InvokeServer(J)
                    task.wait(0.5)
                end
                end
            end
        r:Notify("Unlisting process finished.", 3)
    end};
    {"Unlist ALL Items (Safe Mode)";
    function ()
        if e8.AutoList then
            e8.AutoList = false r.Toggles.AutoListToggle:SetValue(false)
            task.wait(0.5)
        end
        local e = J.GameEvents.TradeEvents.Booths.RemoveListing
        local T = o:GetData()
        local a = T.TradeData and T.TradeData.Listings or {}
        local X = -359512 - (-359512)
        for e in pairs(a)
        do
            X = X + (1)
        end
        if X == 0 then
            r:Notify("No items to remove.", 3)
            return
        end
        for J, T in pairs(a)
        do
            local a = pcall(function ()
                return e:InvokeServer(J)
            end)
            if not a then
                task.wait(5)
                pcall(function ()
                    e:InvokeServer(J)
                end)
            end
            task.wait(0.5)
        end
        r:Notify("All items unlisted successfully.", 3)
    end}})
    VW:AddDivider()
    local MW = QW:AddRightGroupbox("Auto Chat")
    F.ChatListUI = F.List(MW, "ChatListDisplay")
    F.RefreshChat = function ()
        F.ClearRows(F.ChatListUI.frame)
        if type(e8.AutoChatList) ~= "table" then
            e8.AutoChatList = {}
        end
        local e = F.chatSelected
        if e and ((e < 1 or e > #e8.AutoChatList)) then
            F.chatSelected = nil e = nil
        end
        if #e8.AutoChatList == 905939 - 1484889329 % (8290410) then
            F.Row(F.ChatListUI.frame, 1, "No messages yet \226\128\148 add one below.", {})
        end
        for J, T in ipairs(e8.AutoChatList)
        do
            F.Row(F.ChatListUI.frame, J, string.format("%d. %s", J, T), {selected = (e == J);
            onClick = function ()
                if F.chatSelected == J then
                    F.chatSelected = nil
                else
                    F.chatSelected = J
                    pcall(function ()
                        r.Options.AddChatInput:SetValue(T)
                    end)
                end
                F.RefreshChat()
            end})
        end
        if F.chatBtns and F.chatBtns[1] then
            F.chatBtns[1].Text = F.chatSelected and "\240\159\146\190 Update" or "\226\158\149 Add"
        end
        F.ChatListUI.resize()
    end
    MW:AddInput("AddChatInput", {Text = "Add Message", Default = "";
    Numeric = false;
    Finished = false, Placeholder = "Type a chat message to add...", TextScaled = false;
    TextSize = 14})
    F.chatRowPanel, F.chatBtns = F.ButtonRow(MW, "ChatListButtons", {{"\226\158\149 Add";
    function ()
        local e = r.Options.AddChatInput.Value
        if type(e) == "string" then
            e = e:match("^%s*(.-)%s*$")
        end
        if not e or e == "" then
            r:Notify("Please type a message first.", 3)
            return
        end
        local J = F.chatSelected
        for T, a in ipairs(e8.AutoChatList)
        do
            if a == e and T ~= J then
                r:Notify("Message already in list!", 3)
                r.Options.AddChatInput:SetValue("")
                return
            end
            end
        if J and e8.AutoChatList[J] then
            e8.AutoChatList[J] = e
            F.chatSelected = nil r:Notify("\240\159\146\190 Message updated!", 3)
        else
            table.insert(e8.AutoChatList, e)
            r:Notify("Added message to chat list! ("..(#e8.AutoChatList.." total)"), 3)
        end
        SaveConfig()
        r.Options.AddChatInput:SetValue("")
        F.RefreshChat()
    end}, {"\240\159\151\145\239\184\143 Remove", function ()
        local e = F.chatSelected
        if not e or not e8.AutoChatList[e] then
            r:Notify("Click a message in the list first.", 3)
            return
        end
        table.remove(e8.AutoChatList, e)
        F.chatSelected = nil SaveConfig()
        F.RefreshChat()
        r:Notify("Removed message from list. ("..(#e8.AutoChatList.." remaining)"), 3)
    end}})
    F.RefreshChat()
    MW:AddDivider()
    MW:AddInput("AutoChatDelayInput", {Text = "Delay (Seconds)";
    Default = tostring(e8.AutoChatDelay), Numeric = true, Placeholder = "60"})
    MW:AddDivider()
    MW:AddToggle("AutoChatToggle", {Text = "\240\159\146\172 Enable Auto Chat", Default = e8.AutoChat;
    Tooltip = "Rotates through your chat list on a timer"})
    local GW = QW:AddLeftGroupbox("\240\159\143\170 Booth Manager")
    local zW = Q(GW, "SelectBestPet", "Select a Pet", x, {text = "\240\159\144\190 Select a Pet";
    tooltip = "Choose which pet type to find the heaviest copy of", get = function ()
        return e8.EquipPetName
    end, set = function (e)
        e8.EquipPetName = e
    end;
    onChange = SaveConfig})
    GW:AddToggle("FindBestPetToggle", {Text = "\226\154\150\239\184\143 Equip Pet";
    Default = e8.EquipPet;
    Tooltip = "Finds the heaviest copy of the selected pet type and equips it"})
    GW:AddToggle("AutoClaimToggle", {Text = "\240\159\143\170 Auto-Claim Booth", Default = e8.AutoClaim, Tooltip = "Automatically claim an unclaimed booth on join"})
    F.UpdatePriceBox = QW:AddRightGroupbox("\240\159\146\178 Update Price")
    F.PriceListUI = F.List(F.UpdatePriceBox, "PriceListDisplay")
    F.priceSelected = nil F.CollectListingGroups = function ()
        local e, J = {}, {}
        pcall(function ()
            local T = (o:GetData()).TradeData.Listings
            if type(T) ~= "table" then
                return
            end
            for T, a in pairs(T)
            do
                if type(a) == "table" and (a.ItemType == "Pet" and a.ItemId) then
                    local X, k, h = "Unknown Pet", "Normal", 545589 - (545589)
                    pcall(function ()
                        local e = G8(a.ItemId)
                        if e then
                            X = tostring(e.PetType or X)
                            k = tostring(g8(e))
                            local J = e.PetData or {}
                            h = tonumber(J.BaseWeight) or 0
                        end
                        end)
                    local b = tonumber(a.Price) or -674526
                    local r = X..("|"..tostring(b))
                    local I = e[r]
                    if not I then
                        I = {pet = X, price = b;
                        entries = {};
                        muts = {};
                        mutOrder = {}}
                        e[r] = I
                        table.insert(J, r)
                    end
                    table.insert(I.entries, {id = T;
                    uuid = a.ItemId, mutation = k, baseW = h})
                    if not I.muts[k] then
                        I.muts[k] = true table.insert(I.mutOrder, k)
                    end
                    end
                end
            end)
        table.sort(J)
        return e, J
    end
    F.RefreshPriceList = function ()
        F.ClearRows(F.PriceListUI.frame)
        local e, J = F.CollectListingGroups()
        if F.priceSelected and not e[F.priceSelected] then
            F.priceSelected = nil
        end
        if #J == -775956 - (-775956) then
            F.Row(F.PriceListUI.frame, 1, "No pets listed right now.", {})
        end
        for J, T in ipairs(J)
        do
            local a = e[T]
            table.sort(a.mutOrder)
            local X, k = math.huge, 0
            for e, J in ipairs(a.entries)
            do
                if J.baseW < X then
                    X = J.baseW
                end
                if J.baseW > k then
                    k = J.baseW
                end
                end
            local h
            if #a.entries == 1 or X == k then
                h = string.format("%.2f", X)
            else
                h = string.format("%.2f - %.2f", X, k)
            end
            local b
            if #a.mutOrder > 3 then
                b = table.concat(a.mutOrder, ", ", 1, 3)..(" +"..(#a.mutOrder - 3))
            else
                b = table.concat(a.mutOrder, ", ")
            end
            F.Row(F.PriceListUI.frame, J, string.format("%dx %s\n\240\159\146\176 %d tokens\n\240\159\167\172 %s\n\226\154\150\239\184\143 %s", #a.entries, a.pet, a.price, b, h), {selected = (F.priceSelected == T);
            onClick = function ()
                if F.priceSelected == T then
                    F.priceSelected = nil
                else
                    F.priceSelected = T
                    pcall(function ()
                        r.Options.NewPriceInput:SetValue(tostring(a.price))
                    end)
                end
                F.RefreshPriceList()
            end})
        end
        F.PriceListUI.resize()
    end
    F.UpdatePriceBox:AddInput("NewPriceInput", {Text = "New Price (Tokens)";
    Default = "";
    Numeric = true;
    Placeholder = "e.g. 250"})
    F.ButtonRow(F.UpdatePriceBox, "PriceButtons", {{"\240\159\148\132 Refresh", function ()
        F.RefreshPriceList()
        r:Notify("Listing groups refreshed.", 2)
    end}, {"\240\159\146\190 Update Price";
    function ()
        if F.priceUpdateBusy then
            r:Notify("\226\143\179 A price update is already running.", 3)
            return
        end
        local e = F.priceSelected
        if not e then
            r:Notify("Click a row in the list first.", 3)
            return
        end
        local T = math.floor(tonumber(r.Options.NewPriceInput.Value) or -1232276)
        if T < 1 then
            r:Notify("Enter a valid token price first.", 3)
            return
        end
        local a = F.CollectListingGroups()
        local X = a[e]
        if not X or #X.entries == 0 then
            r:Notify("That group is no longer listed.", 3)
            F.RefreshPriceList()
            return
        end
        if X.price == T then
            r:Notify("Those listings are already at "..(T.." tokens."), 3)
            return
        end
        F.priceUpdateBusy = true task.spawn(function ()
            local e = e8.SmartAutoList == true
            local a = e8.AutoList == true
            if e then
                pcall(function ()
                    Toggles.SmartAutoListToggle:SetValue(false)
                end)
            end
            if a then
                pcall(function ()
                    r.Toggles.AutoListToggle:SetValue(false)
                end)
            end
            if e or a then
                task.wait(0.5)
            end
            local k = J.GameEvents.TradeEvents.Booths.RemoveListing
            local h = J.GameEvents.TradeEvents.Booths.CreateListing
            local function b(e)
                local J = os.clock() + (6)
                while os.clock() < J
                do
                    task.wait(1)
                    local J = false pcall(function ()
                        local a = (o:GetData()).TradeData.Listings
                        if type(a) == "table" then
                            for a, X in pairs(a)
                            do
                                if type(X) == "table" and (X.ItemId == e and tonumber(X.Price) == T) then
                                    J = true
                                end
                                end
                            end
                        end)
                    if J then
                        return true
                    end
                    end
                return false
            end
            r:Notify(string.format("\240\159\146\178 Re-pricing %dx %s \226\134\146 %d tokens (about %ds)...", #X.entries, X.pet, T, #X.entries * 8), 5)
            local I, f = 0, (-506526) - (-506526)
            for e, J in ipairs(X.entries)
            do
                local a = pcall(function ()
                    k:InvokeServer(J.id)
                end)
                task.wait(1)
                local r = false
                if a then
                    for e = 1, 2, (-1000433) - (-1000434)
                    do
                        pcall(function ()
                            h:InvokeServer("Pet", J.uuid, T)
                        end)
                        r = b(J.uuid)
                        if r then
                            break
                        end
                        task.wait(5)
                    end
                    end
                if r then
                    I = I + (1)
                else
                    f = f + (1)
                    warn(string.format("[UpdatePrice] %s (%s) did not relist -- check the booth!", tostring(X.pet), tostring(J.uuid)))
                end
                task.wait(5)
            end
            if e then
                pcall(function ()
                    Toggles.SmartAutoListToggle:SetValue(true)
                end)
            end
            if a then
                pcall(function ()
                    r.Toggles.AutoListToggle:SetValue(true)
                end)
            end
            F.priceSelected = nil F.RefreshPriceList()
            if f > 35662380 % (11887460) then
                r:Notify(string.format("\240\159\146\178 %s: %d re-priced to %d, \226\154\160\239\184\143 %d FAILED to relist!", X.pet, I, T, f), 8)
            else
                r:Notify(string.format("\240\159\146\178 %s: all %d re-priced to %d tokens.", X.pet, I, T), 5)
            end
            F.priceUpdateBusy = false
        end)
    end}})
    task.spawn(function ()
        task.wait(3)
        F.RefreshPriceList()
    end)
    local NW = wW:AddLeftGroupbox("Scanner Filters")
    local gW = Q(NW, "ScanPetDropdown", "Select Pet to Scan", v, {text = "\240\159\148\141 Select Pet to Scan", get = function ()
        return e8.TargetPet
    end, set = function (e)
        e8.TargetPet = e
    end;
    onChange = SaveConfig})
    NW:AddDivider()
    NW:AddInput("ScanMinWeight", {Text = "Min Weight";
    Default = tostring(e8.MinWeight);
    Numeric = true;
    Placeholder = "0"})
    NW:AddInput("ScanMaxWeight", {Text = "Max Weight", Default = tostring(e8.MaxWeight);
    Numeric = true;
    Placeholder = "999"})
    NW:AddInput("ScanMaxPrice", {Text = "Max Price";
    Default = tostring(e8.MaxPrice);
    Numeric = true;
    Placeholder = "1000000"})
    NW:AddInput("ScanMaxAge", {Text = "Max Age", Default = tostring(e8.MaxAge);
    Numeric = true;
    Placeholder = "999"})
    NW:AddDivider()
    local DW = {}
    if type(e8.ScanMutations) == "table" then
        for e, J in pairs(e8.ScanMutations)
        do
            if J == true then
                DW[e] = true
            end
            end
        end
    local CW = Q(NW, "ScanMutationMulti", "Mutation Filter", IW, {text = "\240\159\167\172 Mutation Filter", tooltip = "Pick one or more mutations to filter for. Leave empty to accept any mutation.";
    multi = true, store = DW, onChange = function ()
        local e = {}
        for J, T in pairs(DW)
        do
            if T == true then
                e[J] = true
            end
            end
        e8.ScanMutations = e
        SaveConfig()
    end})
    NW:AddDivider()
    w(NW, "BtnBeginScanning", {{"\240\159\148\141 Begin Scanning", function ()
        P = Z:GetData()
        pW()
    end}})
    local dW = wW:AddRightGroupbox("Scan Automation")
    dW:AddToggle("AutoTPToggle", {Text = "\240\159\147\141 Auto-TP to Booth", Default = e8.AutoTPToBooth or false, Tooltip = "Teleport to the matched booth when scanner finds a result"})
    dW:AddToggle("AutoBuyToggle", {Text = "\240\159\155\146 Auto-Buy (Smart Purchase)";
    Default = e8.AutoBuy or false, Tooltip = "Automatically buy matched listings. Checks token balance and respects MaxBuys limit."})
    dW:AddInput("MaxBuysInput", {Text = "Max Purchases";
    Default = tostring(e8.MaxBuys or (-480933) - -480934), Numeric = true, Placeholder = "1"})
    dW:AddLabel("AutoBuyStatusLabel", {Text = "\240\159\155\146 Buys: 0/"..tostring(e8.MaxBuys or 1);
    DoesWrap = true})
    dW:AddDivider()
    dW:AddToggle("AutoScanToggle", {Text = "\240\159\148\132 Manual Server Scan", Default = e8.AutoScan or false, Tooltip = "Scan booths, hop if no match found"})
    dW:AddDivider()
    dW:AddToggle("AutoScanV2Toggle", {Text = "\240\159\154\128 Smart Auto-Scan";
    Default = e8.AutoScanV2 or false;
    Tooltip = "Use server-side FindSellers API + auto-teleport"})
    dW:AddToggle("AutoScanV2PersistToggle", {Text = "\226\154\161 Persist Auto-Scan";
    Default = e8.AutoScanV2Persist or false, Tooltip = "If teleport fails or no pet listed, instantly hop via fast matchmaking"})
    dW:AddDivider()
    w(dW, "BtnSkipListingContinueV2", {{"\226\143\173\239\184\143 Skip Listing & Continue V2", function ()
        if _lastFoundListingId and _lastFoundListingId ~= "" then
            _blacklistedListings[_lastFoundListingId] = true
            if type(e8.BlacklistedListings) ~= "table" then
                e8.BlacklistedListings = {}
            end
            table.insert(e8.BlacklistedListings, _lastFoundListingId)
        end
        _blacklistedServers[tostring(game.JobId)] = true
        if type(e8.BlacklistedServers) ~= "table" then
            e8.BlacklistedServers = {}
        end
        table.insert(e8.BlacklistedServers, tostring(game.JobId))
        local e = 0
        for J in pairs(_blacklistedListings)
        do
            e = e + (1)
        end
        pcall(function ()
            r.Labels.ScanBlacklistCount:SetText("\240\159\154\171 Skipped: "..(e.." listings"))
        end)
        e8.AutoScanV2 = true SaveConfig()
        r:Notify("\226\143\173\239\184\143 Skipped! Hopping \226\128\148 V2 will auto-resume on next server.", 4)
        k8 = false
        if e8.AutoScanV2Persist then
            W8()
        else
            P8()
        end
        end}, {"\240\159\151\145\239\184\143 Clear Blacklist", function ()
        _blacklistedListings = {}
        _blacklistedServers = {}
        _lastFoundListingId = nil e8.BlacklistedListings = {}
        e8.BlacklistedServers = {}
        SaveConfig()
        pcall(function ()
            r.Labels.ScanBlacklistCount:SetText("\240\159\154\171 Skipped: 0 listings")
        end)
        r:Notify("\240\159\151\145\239\184\143 All blacklists cleared.", 3)
    end}})
    dW:AddDivider()
    dW:AddLabel("ScanBlacklistCount", {Text = "\240\159\154\171 Skipped: 0 listings";
    DoesWrap = true})
    dW:AddLabel("ScanStatus", {Text = "\226\143\184\239\184\143 Scanner: Idle", DoesWrap = true})
    local UW = AW:AddLeftGroupbox("Server Hop")
    UW:AddToggle("AutoHopToggle", {Text = "\240\159\148\132 Auto Server Hop";
    Default = e8.AutoHop;
    Tooltip = "Automatically hop to a new server on a timer"})
    UW:AddToggle("SmartHopToggle", {Text = "\240\159\167\160 Smart Hop (Buyer Grace)", Default = e8.SmartHop, Tooltip = "Delays the hop for 3 minutes after your last booth sale \226\128\148 prevents leaving during active buying"})
    UW:AddInput("HopTimerInput", {Text = "Hop Delay (Minutes)", Default = tostring(e8.HopTimer);
    Numeric = true;
    Placeholder = "15"})
    UW:AddDivider()
    w(UW, "BtnForceServerHopNow", {{"\226\154\161 Force Server Hop Now";
    function ()
        if e8.AutoScanV2Persist then
            W8()
        else
            P8()
        end
        end}})
    F.AntiCollisionBox = AW:AddRightGroupbox("\240\159\155\161\239\184\143 Anti-Collision")
    F.AltListUI = F.List(F.AntiCollisionBox, "AltListDisplay")
    F.RefreshAlts = function ()
        F.ClearRows(F.AltListUI.frame)
        if type(e8.MyAltsList) ~= "table" then
            e8.MyAltsList = {}
        end
        local e = F.altSelected
        if e and ((e < 1 or e > #e8.MyAltsList)) then
            F.altSelected = nil e = nil
        end
        if #e8.MyAltsList == 0 then
            F.Row(F.AltListUI.frame, 1, "No alts yet \226\128\148 add one below.", {})
        end
        for J, T in ipairs(e8.MyAltsList)
        do
            F.Row(F.AltListUI.frame, J, string.format("%d. %s", J, T), {selected = (e == J), onClick = function ()
                if F.altSelected == J then
                    F.altSelected = nil
                else
                    F.altSelected = J
                    pcall(function ()
                        r.Options.AddAltInput:SetValue(T)
                    end)
                end
                F.RefreshAlts()
            end})
        end
        if F.altBtns and F.altBtns[1] then
            F.altBtns[1].Text = F.altSelected and "\240\159\146\190 Update" or "\226\158\149 Add"
        end
        F.AltListUI.resize()
    end
    F.AntiCollisionBox:AddInput("AddAltInput", {Text = "Add Alt Username";
    Default = "";
    Placeholder = "Type username here...";
    Finished = false})
    F.altRowPanel, F.altBtns = F.ButtonRow(F.AntiCollisionBox, "AltListButtons", {{"\226\158\149 Add", function ()
        local e = r.Options.AddAltInput.Value
        if type(e) == "string" then
            e = e:match("^%s*(.-)%s*$")
        end
        if not e or e == "" then
            r:Notify("Please type a username first.", 3)
            return
        end
        local J = F.altSelected
        for T, a in ipairs(e8.MyAltsList)
        do
            if a:lower() == e:lower() and T ~= J then
                r:Notify("Alt already exists in list!", 3)
                r.Options.AddAltInput:SetValue("")
                return
            end
            end
        if J and e8.MyAltsList[J] then
            e8.MyAltsList[J] = e
            F.altSelected = nil r:Notify("\240\159\146\190 Alt updated!", 3)
        else
            table.insert(e8.MyAltsList, e)
            r:Notify("Added "..(e.." to avoidance list!"), 3)
        end
        SaveConfig()
        r.Options.AddAltInput:SetValue("")
        F.RefreshAlts()
    end}, {"\240\159\151\145\239\184\143 Remove", function ()
        local e = F.altSelected
        if not e or not e8.MyAltsList[e] then
            r:Notify("Click an alt in the list first.", 3)
            return
        end
        local J = e8.MyAltsList[e]
        table.remove(e8.MyAltsList, e)
        F.altSelected = nil SaveConfig()
        F.RefreshAlts()
        r:Notify("Removed "..(J.." from list."), 3)
    end}})
    F.RefreshAlts()
    F.AntiCollisionBox:AddToggle("AntiCollisionToggle", {Text = "\240\159\155\161\239\184\143 Anti-Collision (Avoid Alts)", Default = e8.AntiCollision})
    UW:AddDivider()
    UW:AddInput("JoinServerIdInput", {Text = "\240\159\140\144 Server ID (JobId)";
    Default = "", Placeholder = "Paste JobId from webhook...";
    Finished = false})
    w(UW, "BtnTeleporttoServer", {{"\240\159\154\128 Teleport to Server", function ()
        pcall(L8)
        local e = r.Options.JoinServerIdInput.Value
        if type(e) == "string" then
            e = e:match("^%s*(.-)%s*$")
        end
        if not e or e == "" then
            r:Notify("\226\157\140 Please paste a Server ID (JobId) first.", 4)
            return
        end
        if e == tostring(game.JobId) then
            r:Notify("\226\154\160\239\184\143 You are already in this server!", 3)
            return
        end
        r:Notify("\240\159\154\128 Teleporting to server: "..(e:sub(1, 12).."..."), 5)
        local J = false
        local a
        a = T.TeleportInitFailed:Connect(function (e, T, a)
            J = true task.spawn(function ()
                pcall(function ()
                    r:Notify("\226\157\140 Teleport failed: "..tostring(a), 5)
                end)
            end)
        end)
        local X = pcall(function ()
            T:TeleportToPlaceInstance(J8, e, h)
        end)
        task.wait(8)
        if a then
            a:Disconnect()
        end
        if not X or J then
            r:Notify("\226\157\140 Server may be full or no longer exists. Try again.", 5)
        end
        end}})
    UW:AddDivider()
    local ZW = sW:AddLeftGroupbox("General")
    ZW:AddLabel("ConfigInfoLabel", {Text = "\226\154\153\239\184\143 Settings save automatically.";
    DoesWrap = true})
    ZW:AddToggle("UniversalConfigToggle", {Text = "\240\159\140\141 Use Universal Config", Default = j8, Tooltip = "Saves and loads settings across all your accounts. Re-execute script to apply changes."})
    local PW = sW:AddLeftGroupbox("Booth Sales Webhook")
    PW:AddInput("WebhookURLInput", {Text = "Discord Webhook URL";
    Default = e8.WebhookURL;
    Placeholder = "https://discord.com/api/webhooks/..."})
    PW:AddToggle("BoothNotifsToggle", {Text = "Enable Booth Webhook";
    Default = e8.BoothNotifs;
    Tooltip = "Send Discord notification when any item (pet or fruit) sells from your booth"})
    PW:AddDivider()
    w(PW, "BtnTestBoothWebhook", {{"Test Booth Webhook";
    function ()
        local J = e8.WebhookURL
        if J == "" or not J:find("discord.com") then
            r:Notify("Please enter a valid Discord webhook URL.", 3)
            return
        end
        if not e8.BoothNotifs then
            r:Notify("\226\154\160\239\184\143 Booth Webhook is disabled \226\128\148 enable the toggle first.", 3)
            return
        end
        local T = e:JSONEncode({content = "\240\159\141\128 **TOMI HUB Connection Test**";
        embeds = {{title = "\226\156\133 Booth Webhook Linked Successfully!";
        description = "TOMI HUB is now ready to send sales logs (pets & fruits) to this channel.", color = 65280;
        footer = {text = "TOMI HUB Booth Manager"}}}})
        local a = syn and syn.request or http_request or request or http.request
        if a then
            local e, X = pcall(function ()
                a({Url = J, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = T})
            end)
            r:Notify(e and "Check Discord!" or ("Failed: "..tostring(X)), 3)
        else
            r:Notify("Executor doesn\'t support HTTP requests.", 3)
        end
        end}})
    PW:AddDivider()
    PW:AddInput("SnipeWebhookInput", {Text = "Snipe Webhook URL";
    Default = e8.SnipeWebhookURL;
    Placeholder = "https://discord.com/api/webhooks/..."})
    w(PW, "BtnTestSnipeWebhook", {{"Test Snipe Webhook";
    function ()
        local J = e8.SnipeWebhookURL
        if J == "" or not J:find("discord.com") then
            r:Notify("Please enter a valid Snipe Webhook URL.", 3)
            return
        end
        if not e8.SnipeNotifs then
            r:Notify("\226\154\160\239\184\143 Snipe Webhook is disabled \226\128\148 enable the toggle first.", 3)
            return
        end
        local T = e:JSONEncode({content = "\240\159\142\175 **TOMI HUB Snipe Test**";
        embeds = {{title = "\226\156\133 Snipe Webhook Linked Successfully!", description = "TOMI HUB will send alerts here when a pet is successfully sniped.";
        color = 65280, footer = {text = "TOMI HUB Sniper"}}}})
        local a = syn and syn.request or http_request or request or http.request
        if a then
            local e, X = pcall(function ()
                a({Url = J;
                Method = "POST";
                Headers = {["Content-Type"] = "application/json"}, Body = T})
            end)
            r:Notify(e and "Check Discord!" or ("Failed: "..tostring(X)), 3)
        else
            r:Notify("Executor doesn\'t support HTTP requests.", 3)
        end
        end}})
    PW:AddToggle("SnipeNotifsToggle", {Text = "Enable Snipe Webhook", Default = e8.SnipeNotifs or false, Tooltip = "Send Discord alert when a pet is successfully sniped"})
    PW:AddDivider()
    PW:AddInput("ScannerWebhookInput", {Text = "Scanner Webhook URL", Default = e8.ScannerWebhookURL, Placeholder = "https://discord.com/api/webhooks/..."})
    PW:AddToggle("ScannerNotifsToggle", {Text = "Enable Scanner Webhook", Default = e8.ScannerNotifs, Tooltip = "Send Discord alert when scanner finds your target pet"})
    PW:AddDivider()
    w(PW, "BtnTestScannerWebhook", {{"Test Scanner Webhook", function ()
        local J = e8.ScannerWebhookURL
        if J == "" or not J:find("discord.com") then
            r:Notify("Please enter a valid Scanner Webhook URL.", 3)
            return
        end
        local T = e:JSONEncode({content = "\240\159\148\141 **TOMI HUB Scanner Test**";
        embeds = {{title = "\226\156\133 Scanner Webhook Linked Successfully!", description = "TOMI HUB will send alerts here when automation finds your target pet.";
        color = 3447003;
        footer = {text = "TOMI HUB Scanner"}}}})
        local a = syn and syn.request or http_request or request or http.request
        if a then
            local e, X = pcall(function ()
                a({Url = J, Method = "POST", Headers = {["Content-Type"] = "application/json"};
                Body = T})
            end)
            r:Notify(e and "Check Discord!" or ("Failed: "..tostring(X)), 3)
        else
            r:Notify("Executor doesn\'t support HTTP requests.", 3)
        end
        end}})
    local WW = sW:AddRightGroupbox("Dev Tools")
    w(WW, "BtnLoadDEXExplorer", {{"\240\159\148\141 Load DEX Explorer", function ()
        r:Notify("Loading DEX Explorer...", 3)
        pcall(function ()
            (loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/download/stable-3.0/out.lua")))()
        end)
    end}, {"\240\159\149\181\239\184\143 Load Remote Spy", function ()
        r:Notify("Loading Remote Spy...", 3)
        pcall(function ()
            (loadstring(game:HttpGet("https://raw.githubusercontent.com/Klinac/scripts/main/utopia_spy.lua", true)))()
        end)
    end}})
    local qW = r:AddDraggableButton("TOMI HUB", function ()
        r:Toggle()
    end)
    qW.Button.Size = UDim2.fromOffset(120, 36)
    qW.Button.TextSize = -98259 - (-98276)
    do
        local e = r:GetIcon("clover")
        if e then
            local J = Instance.new("UIPadding")
            J.PaddingLeft = UDim.new(0, 35)
            J.PaddingRight = UDim.new(0, 6)
            J.Parent = qW.Button
            local T = Instance.new("ImageLabel")
            T.Name = "clover"
            T.AnchorPoint = Vector2.new(0, 0.5)
            T.Size = UDim2.fromOffset(22, 22)
            T.Position = UDim2.new(0, -24, 0.5, 0)
            T.BackgroundTransparency = -965268 + (965269)
            T.Image = e.Url
            T.ImageRectOffset = e.ImageRectOffset
            T.ImageRectSize = e.ImageRectSize
            T.ImageColor3 = Color3.fromRGB(255, 255, 255)
            T.ZIndex = 10
            T.Parent = qW.Button
        end
        end
    task.spawn(function ()
        task.wait(1)
        local e = r.ScreenGui or r.Root or r.Main
        if not e then
            pcall(function ()
                for J, T in pairs(h.PlayerGui:GetChildren())
                do
                    if T:IsA("ScreenGui") and T.Name:find("Obsidian") or T.Name:find("TOMI HUB") then
                        e = T
                        break
                    end
                    end
                end)
        end
        if e then
            local J = -996092 - (-996092)
            for e, T in pairs(e:GetDescendants())
            do
                if T:IsA("TextBox") then
                    T.TextScaled = false T.TextSize = 14
                    T.TextTruncate = Enum.TextTruncate.AtEnd
                    if T.Parent then
                        T.Parent.ClipsDescendants = true
                    end
                    J = J + (1)
                end
                end
            e.DescendantAdded:Connect(function (e)
                if e:IsA("TextBox") then
                    task.spawn(function ()
                        e.TextScaled = false e.TextSize = -589740 - (-589754)
                        e.TextTruncate = Enum.TextTruncate.AtEnd
                        if e.Parent then
                            e.Parent.ClipsDescendants = true
                        end
                        end)
                end
                end)
        end
        end)
    local SW = r.Options
    local xW = r.Toggles
    xW.UniversalConfigToggle:OnChanged(function (J)
        if J ~= j8 then
            j8 = J
            pcall(function ()
                if writefile then
                    R8()
                    writefile(s8, e:JSONEncode({UseUniversalConfig = j8}))
                end
                end)
            r:Notify("<font color=\"#FFD700\">\226\154\153\239\184\143 Config mode changed!</font> Re-execute script to apply.", 6)
        end
        end)
    SW.PriceInput:OnChanged(function ()
        e8.Price = tonumber(SW.PriceInput.Value) or 0
        SaveConfig()
    end)
    SW.MinWeightInput:OnChanged(function ()
        e8.ListingMinWeight = tonumber(SW.MinWeightInput.Value) or -396804 - (-396804)
        SaveConfig()
    end)
    SW.MaxWeightInput:OnChanged(function ()
        e8.ListingMaxWeight = tonumber(SW.MaxWeightInput.Value) or (-23600) - (-24599)
        SaveConfig()
    end)
    SW.FruitPriceInput:OnChanged(function ()
        e8.FruitPrice = tonumber(SW.FruitPriceInput.Value) or 1215810171 % (7110001)
        SaveConfig()
    end)
    SW.FruitMinWeightInput:OnChanged(function ()
        e8.FruitMinWeight = tonumber(SW.FruitMinWeightInput.Value) or (2751970200) % 16380775
        SaveConfig()
    end)
    SW.FruitMaxWeightInput:OnChanged(function ()
        e8.FruitMaxWeight = tonumber(SW.FruitMaxWeightInput.Value) or (49514300) % 2063090
        SaveConfig()
    end)
    xW.FindBestPetToggle:OnChanged(function (e)
        e8.EquipPet = e
        SaveConfig()
        if not e then
            return
        end
        D8()
    end)
    local mW = 0
    local YW = -1026941 - (-1026946)
    local vW = false
    local iW = Instance.new("BindableEvent")
    local KW = false
    local function EW(e)
        if e ~= "AutoList" and e8.AutoList then
            e8.AutoList = false pcall(function ()
                xW.AutoListToggle:SetValue(false)
            end)
        end
        if e ~= "AutoFruitList" and e8.AutoFruitList then
            e8.AutoFruitList = false pcall(function ()
                xW.AutoFruitListToggle:SetValue(false)
            end)
        end
        if e ~= "SmartAutoList" and e8.SmartAutoList then
            e8.SmartAutoList = false pcall(function ()
                xW.SmartAutoListToggle:SetValue(false)
            end)
        end
        if e ~= "SmartAutoFruitList" and e8.SmartAutoFruitList then
            e8.SmartAutoFruitList = false pcall(function ()
                xW.SmartAutoFruitListToggle:SetValue(false)
            end)
        end
        KW = false
    end
    local function cW(e)
        local J = 0
        for e in pairs(e.TradeData and e.TradeData.Listings or {})
        do
            J = J + (1)
        end
        local T = (e.TradeData and e.TradeData.MaxListings) or 50
        return J, T
    end
    local function lW(e)
        local J = e.PetsData and (e.PetsData.PetInventory and e.PetsData.PetInventory.Data) or {}
        local T = {}
        local a = e.TradeData and e.TradeData.Listings or {}
        for e, J in pairs(a)
        do
            local a = J.ItemId or J.itemId
            if a then
                T[(tostring(a)):gsub("[{}]", "")] = true
            end
            end
        for e, J in pairs(J)
        do
            local a = J.PetData or {}
            if tostring(J.PetType) == e8.ListingPet and not a.IsFavorite then
                local X = (tostring(e)):gsub("[{}]", "")
                local k = J.ListingID or J.IsListed or T[X]
                if not k then
                    local T = a.Age or a.Level or a.PetAge or a.AgeLevel or (3307153870) % 16054145
                    local X = y8(a.BaseWeight, T)
                    if X >= e8.ListingMinWeight and (X <= e8.ListingMaxWeight and F.MutationSetPasses(e8.ListMutations, g8(J))) then
                        return {uuid = tostring(e);
                        weight = X}
                    end
                    end
                end
            end
        return nil
    end
    local function BW(e)
        local J = e and e.InventoryData
        if type(J) ~= "table" then
            return nil
        end
        local T = {}
        local a = e.TradeData and e.TradeData.Listings or {}
        for e, J in pairs(a)
        do
            local a = J.ItemId or J.itemId
            if a then
                T[(tostring(a)):gsub("[{}]", "")] = true
            end
            end
        local X = ((tostring(e8.ListingFruit)):lower()):gsub("%s+", "")
        for e, J in pairs(J)
        do
            if type(J) == "table" and J.ItemType == "Holdable" then
                local a = J.ItemData or {}
                local k = a.ItemName or a.Name or J.ItemName or J.Name
                if k and (k:lower()):gsub("%s+", "") == X then
                    local a = (tostring(e)):gsub("[{}]", "")
                    local X = J.ListingID or J.IsListed or T[a]
                    if not X then
                        local T = B(J)
                        if T and (T >= e8.FruitMinWeight and T <= e8.FruitMaxWeight) then
                            return {uuid = tostring(e), weight = T, name = k}
                        end
                        end
                    end
                end
            end
        return nil
    end
    Z8 = function (e)
        if KW then
            return
        end
        KW = true
        local T = J.GameEvents.TradeEvents.Booths.CreateListing
        local a = (e == "Pet")
        task.spawn(function ()
            local function J()
                if a then
                    return e8.SmartAutoList == true
                else
                    return e8.SmartAutoFruitList == true
                end
                end
            local function X(e)
                if a then
                    pcall(function ()
                        r.Labels.PetSmartListerStatusLabel:SetText(e)
                    end)
                else
                    pcall(function ()
                        r.Labels.FruitSmartListerStatusLabel:SetText(e)
                    end)
                end
                end
            local function k(e, J)
                local T = string.format("\240\159\147\166 Slots: %d / %d  (%d free)", e, J, J - e)
                if a then
                    pcall(function ()
                        r.Labels.PetSmartListerSlotLabel:SetText(T)
                    end)
                else
                    pcall(function ()
                        r.Labels.FruitSmartListerSlotLabel:SetText(T)
                    end)
                end
                end
            X(string.format("\240\159\148\141 Smart Lister: Scanning (%s)...", e))
            while J()
            do
                local h = o:GetData()
                local b, I = cW(h)
                local f = I - b
                k(b, I)
                if f <= (-768707) - (-768707) then
                    X("\240\159\147\166 Booth full \226\128\148 waiting for a sale...")
                    local e = false
                    local T = iW.Event:Connect(function ()
                        e = true
                    end)
                    local a = 0
                    while not e and (a < -950566 - (-950596) and J())
                    do
                        task.wait(1)
                        a = a + (1)
                    end
                    T:Disconnect()
                    if not J() then
                        break
                    end
                    task.wait(2)
                else
                    local J = a and lW(h) or BW(h)
                    if not J then
                        X("\226\156\133 SmartList: All eligible items listed!")
                        r:Notify(string.format("\226\156\133 SmartList (%s): No more items to list.", e), 5)
                        if a then
                            e8.SmartAutoList = false pcall(function ()
                                xW.SmartAutoListToggle:SetValue(false)
                            end)
                        else
                            e8.SmartAutoFruitList = false pcall(function ()
                                xW.SmartAutoFruitListToggle:SetValue(false)
                            end)
                        end
                        break
                    end
                    local k = a and "Pet" or "Holdable"
                    local f = a and math.floor(e8.Price) or math.floor(e8.FruitPrice)
                    X(string.format("\226\172\134\239\184\143 Listing... (%d/%d slots used)", b, I))
                    local p, n = pcall(function ()
                        return T:InvokeServer(k, J.uuid, f)
                    end)
                    if p and n ~= false then
                        task.wait(5)
                    else
                        X(string.format("\226\154\160\239\184\143 Rejected: %s | S: %s", tostring(n), tostring(p)))
                        task.wait(5)
                    end
                    end
                end
            KW = false X("\226\143\184\239\184\143 Smart Lister: Off")
            if a then
                pcall(function ()
                    r.Labels.PetSmartListerSlotLabel:SetText("\240\159\147\166 Slots: \226\128\148")
                end)
            else
                pcall(function ()
                    r.Labels.FruitSmartListerSlotLabel:SetText("\240\159\147\166 Slots: \226\128\148")
                end)
            end
            end)
    end
    xW.AutoFruitListToggle:OnChanged(function (e)
        e8.AutoFruitList = e
        if e then
            if vW then
                r:Notify("\226\143\179 A listing cycle is already running. Wait for it to finish.", 3)
                xW.AutoFruitListToggle:SetValue(false)
                return
            end
            local e = tick()
            if e < mW then
                local J = math.ceil(mW - e)
                r:Notify(string.format("\226\143\179 Listing cooldown \226\128\148 wait %ds", J), 3)
                xW.AutoFruitListToggle:SetValue(false)
                return
            end
            EW("AutoFruitList")
            vW = true mW = tick() + YW
            task.spawn(function ()
                local e = J.GameEvents.TradeEvents.Booths.CreateListing
                local T = o:GetData()
                local a = T and T.InventoryData
                if type(a) ~= "table" then
                    r:Notify("\226\157\140 InventoryData not found. Try again.", 3)
                    xW.AutoFruitListToggle:SetValue(false)
                    vW = false
                    return
                end
                local X = {}
                local k, h, b, I, f = 0, 0, 0, 0, 0
                for e, J in pairs(a)
                do
                    if type(J) == "table" and J.ItemType == "Holdable" then
                        k = k + (1)
                        local T = J.ItemData or {}
                        local a = T.ItemName or T.Name or J.ItemName or J.Name
                        local r = e8.ListingFruit
                        if not a or (a:lower()):gsub("%s+", "") ~= (r:lower()):gsub("%s+", "") then
                            h = h + (1)
                        else
                            local T = J.ListingID or J.IsListed
                            if T then
                                b = b + (1)
                            else
                                local T = B(J)
                                if not T then
                                    f = f + 1
                                elseif T < e8.FruitMinWeight or T > e8.FruitMaxWeight then
                                    I = I + 1
                                else
                                    table.insert(X, {uuid = tostring(e), weight = T, name = a})
                                end
                                end
                            end
                        end
                    end
                if #X == 0 then
                    local e = ""
                    if k == 0 then
                        e = "No holdable items in inventory."
                    elseif h == k then
                        e = string.format("No \'%s\' found \226\128\148 check dropdown matches inventory.", e8.ListingFruit)
                    elseif f > 0 and #X == -827584 + (827584) then
                        e = "Weight calculation failed \226\128\148 Calculate_Weight module may be missing."
                    elseif I > 0 then
                        e = string.format("Found \'%s\' but weight outside %.2f\226\128\147%.2f KG range.", e8.ListingFruit, e8.FruitMinWeight, e8.FruitMaxWeight)
                    elseif b > -941460 - (-941460) then
                        e = string.format("All \'%s\' are already listed.", e8.ListingFruit)
                    else
                        e = "No fruits matched all filters."
                    end
                    r:Notify("\226\157\140 "..e, 5)
                    xW.AutoFruitListToggle:SetValue(false)
                    vW = false
                    return
                end
                for J, T in ipairs(X)
                do
                    if not e8.AutoFruitList then
                        break
                    end
                    pcall(function ()
                        e:InvokeServer("Holdable", tostring(T.uuid), math.floor(e8.FruitPrice))
                    end)
                    task.wait(5)
                end
                mW = tick() + YW
                e8.AutoFruitList = false xW.AutoFruitListToggle:SetValue(false)
                vW = false r:Notify("Fruit listing complete! Re-enable in 5s.", 5)
            end)
        end
        end)
    xW.AutoListToggle:OnChanged(function (e)
        e8.AutoList = e
        if e then
            if vW then
                r:Notify("\226\143\179 A listing cycle is already running. Wait for it to finish.", 3)
                xW.AutoListToggle:SetValue(false)
                return
            end
            local e = tick()
            if e < mW then
                local J = math.ceil(mW - e)
                r:Notify(string.format("\226\143\179 Listing cooldown \226\128\148 wait %ds", J), 3)
                xW.AutoListToggle:SetValue(false)
                return
            end
            EW("AutoList")
            vW = true mW = tick() + YW
            task.spawn(function ()
                local e = J.GameEvents.TradeEvents.Booths.CreateListing
                local T = o:GetData()
                local a = T.PetsData.PetInventory.Data
                local X = {}
                local k = T.TradeData and T.TradeData.Listings or {}
                for e, J in pairs(k)
                do
                    local T = J.ItemId or J.itemId
                    if T then
                        X[(tostring(T)):gsub("[{}]", "")] = true
                    end
                    end
                local h = {}
                for e, J in pairs(a)
                do
                    local T = J.PetData or {}
                    if tostring(J.PetType) == e8.ListingPet and not T.IsFavorite then
                        local a = (tostring(e)):gsub("[{}]", "")
                        local k = J.ListingID or J.IsListed or X[a]
                        if not k then
                            local a = T.Age or T.Level or T.PetAge or T.AgeLevel or -1720574
                            local X = y8(T.BaseWeight, a)
                            if X >= e8.ListingMinWeight and (X <= e8.ListingMaxWeight and F.MutationSetPasses(e8.ListMutations, g8(J))) then
                                table.insert(h, {uuid = e;
                                weight = X})
                            end
                            end
                        end
                    end
                if #h == -131761 - (-131761) then
                    r:Notify("No pets in range.", 3)
                    xW.AutoListToggle:SetValue(false)
                    vW = false
                    return
                end
                for J, T in ipairs(h)
                do
                    if not e8.AutoList then
                        break
                    end
                    pcall(function ()
                        e:InvokeServer("Pet", tostring(T.uuid), math.floor(e8.Price))
                    end)
                    task.wait(5)
                end
                mW = tick() + YW
                e8.AutoList = false xW.AutoListToggle:SetValue(false)
                vW = false r:Notify("Listing complete! Re-enable in 5s.", 5)
            end)
        end
        end)
    xW.AutoClaimToggle:OnChanged(function (e)
        e8.AutoClaim = e
        SaveConfig()
        if e then
            Y8()
        end
        end)
    xW.SmartAutoListToggle:OnChanged(function (e)
        e8.SmartAutoList = e
        SaveConfig()
        if e then
            if KW then
                r:Notify("\226\143\179 Smart Lister already running.", 3)
                xW.SmartAutoListToggle:SetValue(false)
                return
            end
            EW("SmartAutoList")
            r:Notify("\240\159\167\160 Smart Auto-List (Pets) started!", 3)
            Z8("Pet")
        else
            KW = false
        end
        end)
    xW.SmartAutoFruitListToggle:OnChanged(function (e)
        e8.SmartAutoFruitList = e
        SaveConfig()
        if e then
            if KW then
                r:Notify("\226\143\179 Smart Lister already running.", 3)
                xW.SmartAutoFruitListToggle:SetValue(false)
                return
            end
            EW("SmartAutoFruitList")
            r:Notify("\240\159\167\160 Smart Auto-List (Fruits) started!", 3)
            Z8("Fruit")
        else
            KW = false
        end
        end)
    SW.ScanMinWeight:OnChanged(function ()
        e8.MinWeight = tonumber(SW.ScanMinWeight.Value) or (138928671) % (2205217)
        SaveConfig()
    end)
    SW.ScanMaxWeight:OnChanged(function ()
        e8.MaxWeight = tonumber(SW.ScanMaxWeight.Value) or -85979 - (-86978)
        SaveConfig()
    end)
    SW.ScanMaxPrice:OnChanged(function ()
        e8.MaxPrice = tonumber(SW.ScanMaxPrice.Value) or 1000000
        SaveConfig()
    end)
    SW.ScanMaxAge:OnChanged(function ()
        e8.MaxAge = tonumber(SW.ScanMaxAge.Value) or -24174 - (-25173)
        SaveConfig()
    end)
    xW.AutoTPToggle:OnChanged(function (e)
        e8.AutoTPToBooth = e
        SaveConfig()
    end)
    xW.AutoBuyToggle:OnChanged(function (e)
        e8.AutoBuy = e
        if e then
            aW = 1580918465 % (11886605)
            pcall(function ()
                r.Labels.AutoBuyStatusLabel:SetText("\240\159\155\146 Buys: 0/"..tostring(e8.MaxBuys or -1070419))
            end)
        end
        SaveConfig()
    end)
    SW.MaxBuysInput:OnChanged(function ()
        local e = tonumber(SW.MaxBuysInput.Value)
        if e and e >= 1 then
            e8.MaxBuys = math.floor(e)
            SaveConfig()
            pcall(function ()
                r.Labels.AutoBuyStatusLabel:SetText("\240\159\155\146 Buys: "..(aW..("/"..e8.MaxBuys)))
            end)
        end
        end)
    xW.AutoHopToggle:OnChanged(function (e)
        e8.AutoHop = e
        e8.MinutesPassed = 0
        SaveConfig()
    end)
    SW.HopTimerInput:OnChanged(function ()
        local e = tonumber(SW.HopTimerInput.Value)
        if e then
            e8.HopTimer = e
            SaveConfig()
            r:Notify("Hop set to "..(e.." mins"), 2)
        end
        end)
    xW.AntiCollisionToggle:OnChanged(function (e)
        e8.AntiCollision = e
        SaveConfig()
    end)
    local el = nil
    local function Jl()
        if el then
            el:Disconnect()
            el = nil
        end
        el = h.Idled:Connect(function ()
            local e = game:GetService("VirtualUser")
            e:CaptureController()
            e:ClickButton2(Vector2.new())
        end)
    end
    Jl()
    local Tl = (422805037) % (3644871)
    SW.AutoChatDelayInput:OnChanged(function ()
        local e = tonumber(SW.AutoChatDelayInput.Value)
        if e and e >= 1 then
            e8.AutoChatDelay = e
            SaveConfig()
        end
        end)
    local function al(e)
        pcall(function ()
            local J = game:GetService("TextChatService")
            if J.ChatVersion == Enum.ChatVersion.TextChatService then
                J.TextChannels.RBXGeneral:SendAsync(e)
            else
                (game:GetService("ReplicatedStorage")).DefaultChatSystemChatEvents.SayMessageRequest:FireServer(e, "All")
            end
            end)
    end
    local Xl = nil
    local function kl()
        if Xl then
            pcall(function ()
                task.cancel(Xl)
            end)
            Xl = nil
        end
        Xl = task.spawn(function ()
            while e8.AutoChat
            do
                local e = e8.AutoChatList
                if type(e) == "table" and #e > -811769 - (-811769) then
                    if Tl > #e then
                        Tl = -813942 - (-813943)
                    end
                    local J = e[Tl]
                    if J and J ~= "" then
                        al(J)
                    end
                    Tl = Tl + 1
                    if Tl > #e then
                        Tl = 1
                    end
                    end
                for e = 1, math.max(1, e8.AutoChatDelay), 1
                do
                    if not e8.AutoChat then
                        break
                    end
                    task.wait(1)
                end
                end
            Xl = nil
        end)
    end
    d8 = function ()
        if Xl then
            return
        end
        kl()
    end
    xW.AutoChatToggle:OnChanged(function (e)
        e8.AutoChat = e
        SaveConfig()
        if e then
            Tl = 1
            d8()
        else
            if Xl then
                pcall(function ()
                    task.cancel(Xl)
                end)
                Xl = nil
            end
            end
        end)
    SW.WebhookURLInput:OnChanged(function ()
        e8.WebhookURL = SW.WebhookURLInput.Value
        SaveConfig()
    end)
    xW.BoothNotifsToggle:OnChanged(function (e)
        e8.BoothNotifs = e
        SaveConfig()
    end)
    SW.ScannerWebhookInput:OnChanged(function ()
        e8.ScannerWebhookURL = SW.ScannerWebhookInput.Value
        SaveConfig()
    end)
    xW.ScannerNotifsToggle:OnChanged(function (e)
        e8.ScannerNotifs = e
        SaveConfig()
    end)
    local function hl(J, T, a, X, k, b)
        if not e8.ScannerNotifs or e8.ScannerWebhookURL == "" then
            return
        end
        local r = syn and syn.request or http_request or request or http.request
        if not r then
            return
        end
        local I = y8(T, a)
        local f = tostring(b or "Normal")
        local p = e:JSONEncode({embeds = {{title = "\240\159\148\141 "..(tostring(J)..(" ["..(string.format("%.2f KG", I).."]")));
        description = "Scanned by: **||"..(h.Name.."||**"), color = 3447003;
        fields = {{name = "\240\159\148\142 Scan Info";
        value = "```ansi\n"..("\240\159\144\190 Pet: "..(tostring(J)..("\n"..("\240\159\167\172 Mutation: "..(f..("\n"..("\226\154\150\239\184\143 True Weight: "..(string.format("%.2f KG", I)..("\n"..("\240\159\147\143 Base Weight: "..(string.format("%.2f KG", tonumber(T) or -1633442)..("\n"..("\240\159\147\133 Age: "..(tostring(a or "N/A")..("\n"..("\240\159\146\176 Price: "..(O8(tonumber(X) or 0).."```"))))))))))))))))), inline = false}, {name = "\240\159\143\170 Listing Info", value = "```ansi\n"..("\240\159\143\170 Booth: "..(tostring(k)..("\n"..("\240\159\140\144 Server: "..(tostring(game.JobId).."```"))))), inline = false}}, footer = {text = "tomi hub scanner \226\128\162 "..os.date("%m/%d/%Y %I:%M %p")}}}})
        pcall(function ()
            r({Url = e8.ScannerWebhookURL;
            Method = "POST", Headers = {["Content-Type"] = "application/json"};
            Body = p})
        end)
    end
    JW = hl
    _blacklistedListings = {}
    _blacklistedServers = {}
    _lastFoundListingId = nil
    if type(e8.BlacklistedListings) == "table" then
        for e, J in ipairs(e8.BlacklistedListings)
        do
            _blacklistedListings[J] = true
        end
        end
    if type(e8.BlacklistedServers) == "table" then
        for e, J in ipairs(e8.BlacklistedServers)
        do
            _blacklistedServers[J] = true
        end
        end
    local function bl(e)
        task.spawn(function ()
            pcall(function ()
                r.Labels.ScanStatus:SetText(e)
            end)
        end)
    end
    local function rl()
        task.spawn(function ()
            bl("\240\159\148\132 V1: Waiting for booth data...")
            local e = -264521 - (-264536)
            local J = tick()
            repeat
                P = Z:GetData()
                task.wait(0.5)
            until
            (P and (P.Booths and P.Players)) or (tick() - J > e)
            if not ((P and (P.Booths and P.Players))) then
                j("\226\157\140 Booth data not ready. Try again.", 5)
                e8.AutoScan = false xW.AutoScanToggle:SetValue(false)
                bl("\226\143\184\239\184\143 Scanner: Idle")
                return
            end
            while e8.AutoScan
            do
                if k8 then
                    task.wait(1)
                else
                    bl("\240\159\148\132 V1: Scanning...")
                    P = Z:GetData()
                    local e = pW(true)
                    if not e8.AutoScan then
                        break
                    end
                    if e and e > 0 then
                        j("\240\159\142\175 Target pet found! Automation stopped.", 8)
                        e8.AutoScan = false SaveConfig()
                        xW.AutoScanToggle:SetValue(false)
                        bl("\226\156\133 V1: Target found!")
                        break
                    else
                        j("No matches. Hopping to next server...", 3)
                        bl("\240\159\148\132 V1: Hopping...")
                        k8 = false P8()
                        task.wait(10)
                        local e = -636865 - (-636880)
                        local J = tick()
                        repeat
                            P = Z:GetData()
                            task.wait(0.5)
                        until
                        (P and (P.Booths and P.Players)) or (tick() - J > e)
                    end
                    end
                end
            bl("\226\143\184\239\184\143 Scanner: Idle")
        end)
    end
    local function Il()
        task.spawn(function ()
            bl("\240\159\154\128 V2: Waiting for booth data...")
            local e = tick()
            repeat
                task.wait(0.5)
            until
            (Z:GetData() and ((Z:GetData()).Booths and (Z:GetData()).Players)) or (tick() - e > 15)
            local J = 0
            local a = 3
            while e8.AutoScanV2
            do
                if k8 then
                    task.wait(1)
                else
                    local e = false
                    if not _blacklistedServers[tostring(game.JobId)] then
                        bl("\240\159\154\128 V2: Scanning local booths...")
                        P = Z:GetData()
                        local J = pW(true, true)
                        if not e8.AutoScanV2 then
                            break
                        end
                        if J and J > 603770 + (-603770) then
                            j("\240\159\142\175 V2: "..(e8.TargetPet.." found locally!"), 8)
                            e8.AutoScanV2 = false SaveConfig()
                            xW.AutoScanV2Toggle:SetValue(false)
                            bl("\226\156\133 V2: Target found!")
                            e = true
                        end
                        end
                    if not e and e8.AutoScanV2 then
                        bl("\240\159\154\128 V2: Querying FindSellers...")
                        local e, X, k = pcall(function ()
                            return N:InvokeServer("Pet", {PetType = e8.TargetPet, PetData = {MutationType = "Normal", Hunger = 0;
                            LevelProgress = 0;
                            Level = 0;
                            BaseWeight = 1, Boosts = {}};
                            PetAbility = {}})
                        end)
                        if not e8.AutoScanV2 then
                            break
                        end
                        if not ((e and (X and (k and type(k) == "string")))) then
                            J = J + (1)
                            bl(string.format("\240\159\154\128 V2: No sellers found (%d/%d) \226\128\148 %s...", J, a, J >= a and "hopping" or "retrying"))
                            if J >= a then
                                j("\240\159\154\128 V2: No sellers in any server. Hopping...", 3)
                                J = 0
                                k8 = false
                                if e8.AutoScanV2Persist then
                                    W8()
                                else
                                    P8()
                                end
                                task.wait(10)
                                local e = 15
                                local T = tick()
                                repeat
                                    P = Z:GetData()
                                    task.wait(0.5)
                                until
                                (P and (P.Booths and P.Players)) or (tick() - T > e)
                            else
                                task.wait(1)
                            end
                            elseif _blacklistedListings[k] then
                            J = J + (1)
                            j(string.format("\226\143\173\239\184\143 Blacklisted listing (%d/%d). Retrying FindSellers...", J, a), 3)
                            bl("\240\159\154\128 V2: Skipped (blacklisted) \226\128\148 retrying...")
                            if J >= a then
                                j("\240\159\154\128 V2: Too many blacklisted results. Hopping...", 3)
                                J = 67706 - (67706)
                                k8 = false
                                if e8.AutoScanV2Persist then
                                    W8()
                                else
                                    P8()
                                end
                                task.wait(10)
                                local e = 15
                                local T = tick()
                                repeat
                                    P = Z:GetData()
                                    task.wait(0.5)
                                until
                                (P and (P.Booths and P.Players)) or (tick() - T > e)
                            else
                                task.wait(0.5)
                            end
                            else
                            J = 0
                            _lastFoundListingId = k
                            j("\226\156\133 V2: "..(tostring(e8.TargetPet).." found! Teleporting..."), 5)
                            bl("\240\159\154\128 V2: Teleporting to listing...")
                            local e = "pending"
                            local a
                            a = T.TeleportInitFailed:Connect(function (J, T)
                                e = "failed"
                                j("\226\154\160\239\184\143 Teleport Failed: "..tostring(T), 4)
                            end)
                            task.spawn(function ()
                                local J, T = pcall(function ()
                                    return g:InvokeServer(k)
                                end)
                                if J and T ~= false then
                                    if e ~= "failed" then
                                        e = "transitioning"
                                    end
                                    else
                                    e = "failed"
                                end
                                end)
                            local X = tick()
                            while e == "pending" and (tick() - X < 5)
                            do
                                task.wait(0.2)
                            end
                            if a then
                                a:Disconnect()
                            end
                            if e == "failed" then
                                _blacklistedListings[k] = true
                                local e = 0
                                for J in pairs(_blacklistedListings)
                                do
                                    e = e + 1
                                end
                                pcall(function ()
                                    r.Labels.ScanBlacklistCount:SetText("\240\159\154\171 Skipped: "..(e.." listings"))
                                end)
                                j("\226\154\160\239\184\143 Teleport rejected. Retrying FindSellers immediately...", 3)
                                bl("\240\159\154\128 V2: Teleport failed \226\128\148 retrying FindSellers...")
                            else
                                j("\240\159\154\128 V2: In transit. Waiting for server load...", 4)
                                bl("\240\159\154\128 V2: Loading new server...")
                                local e = false
                                local J
                                J = T.TeleportInitFailed:Connect(function (J, T)
                                    e = true j("\226\154\160\239\184\143 Teleport failed mid-transit: "..tostring(T), 4)
                                end)
                                local a = tick()
                                repeat
                                    task.wait(0.5)
                                until
                                e or (Z:GetData() and ((Z:GetData()).Booths and (Z:GetData()).Players)) or (tick() - a > 15)
                                if J then
                                    J:Disconnect()
                                end
                                if e then
                                    _blacklistedListings[k] = true
                                    local e = (602010617) % (5055996) + (-347093)
                                    for J in pairs(_blacklistedListings)
                                    do
                                        e = e + 1
                                    end
                                    pcall(function ()
                                        r.Labels.ScanBlacklistCount:SetText("\240\159\154\171 Skipped: "..(e.." listings"))
                                    end)
                                    j("\226\154\160\239\184\143 Failed mid-transit. Retrying FindSellers...", 3)
                                else
                                    bl("\240\159\154\128 V2: Verifying on new server...")
                                    P = Z:GetData()
                                    local e = pW(false, true)
                                    if e and e > -235251 - (-235251) then
                                        j("\240\159\142\175 V2: "..(e8.TargetPet.." confirmed! Stopping."), 8)
                                        e8.AutoScanV2 = false SaveConfig()
                                        xW.AutoScanV2Toggle:SetValue(false)
                                        bl("\226\156\133 V2: Target found!")
                                        break
                                    else
                                        _blacklistedListings[k] = true _blacklistedServers[tostring(game.JobId)] = true
                                        if type(e8.BlacklistedServers) ~= "table" then
                                            e8.BlacklistedServers = {}
                                        end
                                        table.insert(e8.BlacklistedServers, tostring(game.JobId))
                                        SaveConfig()
                                        local e = 0
                                        for J in pairs(_blacklistedListings)
                                        do
                                            e = e + (1)
                                        end
                                        pcall(function ()
                                            r.Labels.ScanBlacklistCount:SetText("\240\159\154\171 Skipped: "..(e.." listings"))
                                        end)
                                        j("\226\154\160\239\184\143 Didn\'t match filters. Retrying FindSellers...", 3)
                                        bl("\240\159\154\128 V2: No match \226\128\148 retrying FindSellers...")
                                    end
                                    end
                                end
                            end
                        end
                    end
                end
            bl("\226\143\184\239\184\143 Scanner: Idle")
        end)
    end
    xW.AutoScanToggle:OnChanged(function (e)
        e8.AutoScan = e
        SaveConfig()
        if e then
            if e8.AutoScanV2 then
                e8.AutoScanV2 = false xW.AutoScanV2Toggle:SetValue(false)
            end
            rl()
        end
        end)
    xW.AutoScanV2Toggle:OnChanged(function (e)
        e8.AutoScanV2 = e
        SaveConfig()
        if e then
            if e8.AutoScan then
                e8.AutoScan = false xW.AutoScanToggle:SetValue(false)
            end
            if e8.AutoSnipeV2 then
                e8.AutoSnipeV2 = false _snipeActive = false pcall(function ()
                    DetachSnipeSignals()
                end)
                pcall(function ()
                    xW.AutoSnipeV2Toggle:SetValue(false)
                end)
                j("\226\132\185\239\184\143 Server Hop disabled \226\128\148 Scanner V2 is now active.", 4)
            end
            Il()
        end
        end)
    xW.AutoScanV2PersistToggle:OnChanged(function (e)
        e8.AutoScanV2Persist = e
        SaveConfig()
    end)
    xW.SmartHopToggle:OnChanged(function (e)
        e8.SmartHop = e
        SaveConfig()
        if e then
            r:Notify("\240\159\167\160 SmartHop enabled \226\128\148 hop will delay 3m after a sale.", 4)
        else
            r:Notify("\240\159\167\160 SmartHop disabled \226\128\148 hops will fire on timer regardless.", 4)
        end
        end)
    xW.AutoReconnectToggle:OnChanged(function (e)
        e8.AutoReconnect = e
        SaveConfig()
        if e then
            w8()
            r.Labels.AutoReconnectStatusLabel:SetText("\240\159\159\162 Reconnect: Listening...")
            r:Notify("\240\159\148\129 Auto Reconnect enabled.", 3)
        else
            F8()
            r.Labels.AutoReconnectStatusLabel:SetText("\240\159\148\180 Reconnect: Off")
            r:Notify("\240\159\148\129 Auto Reconnect disabled.", 3)
        end
        end)
    local fl = J.GameEvents.TradeEvents.Booths.AddToHistory
    fl.OnClientEvent:Connect(function (J)
        if J.status and J.status.result == "Completed" then
            local T = J.seller and J.seller.userId
            if T == h.UserId then
                I8 = tick()
                p8 = p8 + (1)
                pcall(function ()
                    iW:Fire()
                end)
                pcall(function ()
                    r.Labels.ServerBuysLabel:SetText("\240\159\155\146 Buys This Server: "..p8)
                end)
                if e8.BoothNotifs and e8.WebhookURL ~= "" then
                    pcall(function ()
                        local T = 0
                        local a = 0
                        local X = o:GetData()
                        T = X.TradeData.Tokens or 0
                        local k = X.TradeData.Listings or {}
                        for e in pairs(k)
                        do
                            a = a + 1
                        end
                        local b = X.TradeData.MaxListings or -560398
                        local r = "Unknown"
                        local I = ""
                        local f = 0
                        local p = J.price or 0
                        local n = J.buyer.username or "Unknown"
                        local t = false
                        if J.item.type == "Pet" or J.item.data.PetType then
                            r = J.item.data.PetType or "Unknown"
                            I = J.item.data.PetData and J.item.data.PetData.Name or ""
                            local e = J.item.data.PetData and J.item.data.PetData.BaseWeight or 0
                            local T = J.item.data.PetData and ((J.item.data.PetData.Age or J.item.data.PetData.Level or J.item.data.PetData.PetAge)) or 0
                            f = y8(e, T)
                        else
                            t = true
                            local e = J.item.data
                            f = B(e) or B(e.ItemData) or 0
                            if e.ItemData then
                                r = e.ItemData.ItemName or e.ItemData.Name or e.ItemData.HoldableType or e.ItemData.FruitType or "Unknown Fruit"
                            else
                                r = e.Name or e.ItemName or e.HoldableType or e.FruitType or e.SkinID or "Unknown Fruit"
                            end
                            end
                        local Q = ""
                        if t then
                            Q = "\240\159\141\142 "..(r..(" ["..(string.format("%.2f KG", f).."]")))
                        else
                            Q = "\240\159\146\176 "..(r..(((I ~= "" and (" ("..(I..")")) or ""))..(" ["..(string.format("%.2f KG", f).."]"))))
                        end
                        local w = ""
                        if t then
                            w = "```ansi\n"..("\240\159\141\142 Fruit: "..(r..("\n"..("\226\154\150\239\184\143 Weight: "..(string.format("%.2f KG", f)..("\n"..("\240\159\146\176 Sold For: "..(O8(p)..("\n"..("\226\156\168 New Balance: "..(O8(T)..("\n"..("\240\159\145\164 Buyer: "..(n.."```"))))))))))))))
                        else
                            w = "```ansi\n"..("\240\159\146\176 Sold For: "..(O8(p)..("\n"..("\226\156\168 New Balance: "..(O8(T)..("\n"..("\240\159\145\164 Buyer: "..(n.."```"))))))))
                        end
                        local F = e:JSONEncode({embeds = {{title = Q;
                        description = "By User: **||"..(h.Name.."||**"), color = t and 5763719 or (589767789) % 4347694, fields = {{name = "\240\159\147\136 Sales info", value = w, inline = false}, {name = "\240\159\143\170 Booth status";
                        value = "```ansi\n"..("\240\159\147\166 Booth stock: "..(a..(" / "..(b..("\n"..("\226\154\160\239\184\143 Remaining Space: "..((b - a)..("\n"..("\240\159\140\144 Server: "..(tostring(game.JobId).."```")))))))))), inline = false}};
                        footer = {text = "tomi hub \226\128\162 "..os.date("%m/%d/%Y %I:%M %p")}}}})
                        local A = syn and syn.request or http_request or request or http.request
                        if not A then
                            return
                        end
                        A({Url = e8.WebhookURL;
                        Method = "POST";
                        Headers = {["Content-Type"] = "application/json"}, Body = F})
                    end)
                end
                end
            end
        end)
    task.spawn(function ()
        if not game:IsLoaded() then
            game.Loaded:Wait()
        end
        local e = h.Character or h.CharacterAdded:Wait()
        local J = tick()
        while #G:GetChildren() == 0 and tick() - J < (-553675) - (-553680)
        do
            task.wait(0.2)
        end
        if e8.AutoClaim then
            Y8()
        end
        if e8.AutoChat then
            Tl = 1
            kl()
        end
        if e8.AutoReconnect then
            w8()
        end
        task.spawn(function ()
            task.wait(2.5)
            if e8.AutoHop then
                xW.AutoHopToggle:SetValue(true)
            else
                xW.AutoHopToggle:SetValue(false)
            end
            if e8.SmartHop then
                xW.SmartHopToggle:SetValue(true)
            else
                xW.SmartHopToggle:SetValue(false)
            end
            if e8.AntiCollision then
                xW.AntiCollisionToggle:SetValue(true)
            end
            if e8.AutoClaim then
                xW.AutoClaimToggle:SetValue(true)
            end
            if e8.AutoChat then
                xW.AutoChatToggle:SetValue(true)
            end
            if e8.AutoReconnect then
                xW.AutoReconnectToggle:SetValue(true)
            end
            if e8.SmartAutoList then
                xW.SmartAutoListToggle:SetValue(true)
                if not KW then
                    Z8("Pet")
                end
                end
            if e8.SmartAutoFruitList then
                xW.SmartAutoFruitListToggle:SetValue(true)
                if not KW then
                    Z8("Fruit")
                end
                end
            if e8.AutoScanV2Persist then
                pcall(function ()
                    xW.AutoScanV2PersistToggle:SetValue(true)
                end)
            end
            pcall(function ()
                local e = e8.ListMutations
                if type(e) == "table" and next(e) ~= nil then
                    local J = {}
                    for e, T in pairs(e)
                    do
                        if type(e) == "string" and T == true then
                            J[e] = true
                        elseif type(e) == "number" and type(T) == "string" then
                            J[T] = true
                        end
                        end
                    if next(J) ~= nil then
                        F.ListMutationCtl:SetValue(J)
                    end
                    end
                end)
            pcall(function ()
                local e = e8.ScanMutations
                if type(e) == "table" and next(e) ~= nil then
                    local J = {}
                    for e, T in pairs(e)
                    do
                        if type(e) == "string" and T == true then
                            J[e] = true
                        elseif type(e) == "number" and type(T) == "string" then
                            J[T] = true
                        end
                        end
                    if next(J) ~= nil then
                        CW:SetValue(J)
                    end
                    end
                end)
            if e8.AutoScanV2 then
                xW.AutoScanV2Toggle:SetValue(true)
                Il()
            elseif e8.AutoScan then
                xW.AutoScanToggle:SetValue(true)
                rl()
            end
            end)
    end)
    local pl = false
    local nl = -891439 - (-891439)
    local tl = nil
    local Ql = {}
    local wl = false
    local function Fl()
        if tl then
            pcall(function ()
                tl:Disconnect()
            end)
            tl = nil
        end
        Ql = {}
    end
    local Al = {}
    local sl = FW:AddLeftGroupbox("General Snipe Filters")
    local jl = {}
    if type(e8.SnipePets) == "table" then
        for e, J in pairs(e8.SnipePets)
        do
            if J == true then
                table.insert(jl, e)
            elseif type(e) == "number" and type(J) == "string" then
                table.insert(jl, J)
            end
            end
        end
    local ol = {}
    if type(e8.SnipePets) == "table" then
        for e, J in pairs(e8.SnipePets)
        do
            if J == true then
                ol[e] = true
            end
            end
        end
    local Rl = Q(sl, "SnipePetMultiSelect", "Pets to Snipe", i, {text = "\240\159\142\175 Pets to Snipe (General)", multi = true, store = ol;
    onChange = function ()
        local e = {}
        for J, T in pairs(ol)
        do
            if T == true then
                e[J] = true
            end
            end
        e8.SnipePets = e
        Al = {}
        for e in pairs(e)
        do
            Al[e] = true
        end
        SaveConfig()
    end})
    sl:AddInput("SnipeMinWeightInput", {Text = "Min Weight";
    Default = tostring(e8.SnipeMinWeight or .8), Numeric = true, Placeholder = "0"})
    sl:AddInput("SnipeMaxWeightInput", {Text = "Max Weight", Default = tostring(e8.SnipeMaxWeight or 11.44);
    Numeric = true, Placeholder = "140"})
    sl:AddInput("SnipeMaxPriceInput", {Text = "Max Price";
    Default = tostring(e8.SnipeMaxPrice or (906240) + -906140), Numeric = true, Placeholder = "100"})
    sl:AddInput("SnipeMaxAgeInput", {Text = "Max Age", Default = tostring(e8.SnipeMaxAge or 125), Numeric = true;
    Placeholder = "125"})
    local Ll = FW:AddLeftGroupbox("Add New Snipe Rule")
    local ul = Q(Ll, "RulePetSelect", "Select Pet", i, {text = "\240\159\142\175 Select Pet";
    get = function ()
        return i[1]
    end})
    Ll:AddInput("RuleMinWeight", {Text = "Min Weight (KG)", Default = "0.8";
    Numeric = true})
    Ll:AddInput("RuleMaxWeight", {Text = "Max Weight (KG)";
    Default = "11.44", Numeric = true})
    Ll:AddInput("RuleMaxPrice", {Text = "Max Price (Tokens)";
    Default = "100";
    Numeric = true})
    Ll:AddInput("RuleMaxAge", {Text = "Max Age";
    Default = "125", Numeric = true})
    local function Hl(e)
        return string.format("[%s] \240\159\146\176%s | \226\154\150\239\184\143%s-%s | \240\159\147\133%s", tostring(e.Pet), tostring(e.MaxPrice), tostring(e.MinWeight), tostring(e.MaxWeight), tostring(e.MaxAge))
    end
    F.ruleRowPanel, F.ruleBtns = F.ButtonRow(Ll, "RuleFormButtons", {{"\226\158\149 Add Rule";
    function ()
        local e = r.Options.RulePetSelect.Value
        local J = tonumber(r.Options.RuleMinWeight.Value) or -547623 + (547623)
        local T = tonumber(r.Options.RuleMaxWeight.Value) or 999
        local a = tonumber(r.Options.RuleMaxPrice.Value) or -1774848
        local X = tonumber(r.Options.RuleMaxAge.Value) or (-345542) + 346541
        if type(e8.SnipeRules) ~= "table" then
            e8.SnipeRules = {}
        end
        local k = {Pet = e;
        MinWeight = J, MaxWeight = T, MaxPrice = a;
        MaxAge = X}
        local h = F.rulesSelected
        if h and e8.SnipeRules[h] then
            e8.SnipeRules[h] = k
            F.rulesSelected = nil r:Notify("\240\159\146\190 Rule updated for "..e, 3)
        else
            table.insert(e8.SnipeRules, k)
            r:Notify("\226\156\133 Rule added for "..e, 3)
        end
        SaveConfig()
        F.RefreshRules()
    end}, {"\240\159\151\145\239\184\143 Remove";
    function ()
        local e = F.rulesSelected
        if not e or type(e8.SnipeRules) ~= "table" or not e8.SnipeRules[e] then
            r:Notify("Click a rule in the Active Rules list first.", 3)
            return
        end
        table.remove(e8.SnipeRules, e)
        F.rulesSelected = nil SaveConfig()
        F.RefreshRules()
        r:Notify("\240\159\151\145\239\184\143 Rule removed.", 3)
    end}})
    local Ol = FW:AddRightGroupbox("Active Rules")
    F.RulesListUI = F.List(Ol, "ActiveRulesList")
    F.RefreshRules = function ()
        F.ClearRows(F.RulesListUI.frame)
        if type(e8.SnipeRules) ~= "table" then
            e8.SnipeRules = {}
        end
        local e = F.rulesSelected
        if e and ((e < 1 or e > #e8.SnipeRules)) then
            F.rulesSelected = nil e = nil
        end
        if #e8.SnipeRules == -139394 - (-139394) then
            F.Row(F.RulesListUI.frame, 1, "No active rules", {})
        end
        for J, T in ipairs(e8.SnipeRules)
        do
            F.Row(F.RulesListUI.frame, J, string.format("%d. %s", J, Hl(T)), {selected = (e == J);
            onClick = function ()
                if F.rulesSelected == J then
                    F.rulesSelected = nil
                else
                    F.rulesSelected = J
                    pcall(function ()
                        ul:SetValue(T.Pet)
                        r.Options.RuleMinWeight:SetValue(tostring(T.MinWeight))
                        r.Options.RuleMaxWeight:SetValue(tostring(T.MaxWeight))
                        r.Options.RuleMaxPrice:SetValue(tostring(T.MaxPrice))
                        r.Options.RuleMaxAge:SetValue(tostring(T.MaxAge))
                    end)
                end
                F.RefreshRules()
            end})
        end
        if F.ruleBtns and F.ruleBtns[1] then
            F.ruleBtns[1].Text = F.rulesSelected and "\240\159\146\190 Update Rule" or "\226\158\149 Add Rule"
        end
        F.RulesListUI.resize()
    end
    local function yl()
        Al = {}
        local e = e8.SnipePets
        if type(e) == "table" then
            for e, J in pairs(e)
            do
                if J then
                    Al[e] = true
                end
                end
            end
        end
    task.spawn(function ()
        task.wait(1)
        F.RefreshRules()
        yl()
    end)
    local Vl = FW:AddRightGroupbox("Snipe Automation")
    F.Merge(Vl, function ()
        Vl:AddLabel("SnipeV2Status", {Text = "\226\143\184\239\184\143 Server Hop: Idle";
        DoesWrap = true})
        Vl:AddLabel("SnipeServerLabel", {Text = "\240\159\140\144 Server: \226\128\148";
        DoesWrap = true})
        Vl:AddLabel("SnipeBuyCountLabel", {Text = "\240\159\142\175 Snipe Buys: 0/1", DoesWrap = true})
        Vl:AddLabel("SnipeStatus", {Text = "\226\143\184\239\184\143 Auto Snipe: Idle", DoesWrap = true})
    end)
    Vl:AddDivider()
    Vl:AddInput("SnipeMaxBuysInput", {Text = "Max Purchases";
    Default = tostring(e8.SnipeMaxBuys), Numeric = true, Placeholder = "1"})
    Vl:AddToggle("UseCustomSnipeRulesToggle", {Text = "\240\159\148\146 Custom Rules Only";
    Default = e8.UseCustomSnipeRules or false;
    Tooltip = "OFF = Cascade Mode: General Filters run first, Custom Rules act as fallback. ON = Custom Rules Only: General Filters are skipped entirely."})
    Vl:AddToggle("SnipeSkipFavoritedToggle", {Text = "\226\173\144 Skip Favorited Pets", Default = e8.SnipeSkipFavorited;
    Tooltip = "If a listed pet has IsFavorite = true, skip it. Prevents getting stuck buying the same favorited pet repeatedly."})
    Vl:AddToggle("AutoSnipeToggle", {Text = "\226\154\161 Auto Snipe", Default = e8.AutoSnipe or false, Tooltip = "Listens via signal for new listings in this server only. Fires immediately on match."})
    Vl:AddToggle("AutoSnipeV2Toggle", {Text = "\240\159\154\128 Server Hop", Default = e8.AutoSnipeV2 or false, Tooltip = "Scans each server on arrival. Hops immediately if no match. Mutually exclusive with Scanner V2."})
    local function Ml(e)
        task.spawn(function ()
            pcall(function ()
                r.Labels.SnipeStatus:SetText(e)
            end)
        end)
    end
    local function Gl(e)
        task.spawn(function ()
            pcall(function ()
                r.Labels.SnipeV2Status:SetText(e)
            end)
        end)
    end
    local function zl()
        pcall(function ()
            r.Labels.SnipeBuyCountLabel:SetText("\240\159\142\175 Snipe Buys: "..(nl..("/"..tostring(e8.SnipeMaxBuys))))
        end)
    end
    local function Nl(e, J, T, a)
        local X = math.floor(J * 100.5) / (100)
        if not e8.UseCustomSnipeRules then
            if Al[e] and (X >= ((e8.SnipeMinWeight or -1433218)) and (X <= ((e8.SnipeMaxWeight or 999)) and (T <= ((e8.SnipeMaxPrice or 999)) and a <= ((e8.SnipeMaxAge or 999))))) then
                return {Pet = e, General = true}
            end
            end
        if type(e8.SnipeRules) == "table" then
            for J, k in ipairs(e8.SnipeRules)
            do
                if k.Pet == e and (X >= ((k.MinWeight or -389520)) and (X <= ((k.MaxWeight or -1261389)) and (T <= ((k.MaxPrice or 999)) and a <= ((k.MaxAge or 999))))) then
                    return k
                end
                end
            end
        return nil
    end
    local function gl(J, T, a, X, k)
        if not e8.SnipeNotifs then
            return
        end
        local h = {}
        if e8.SnipeWebhookURL and e8.SnipeWebhookURL ~= "" then
            table.insert(h, e8.SnipeWebhookURL)
        end
        if #h == 0 then
            return
        end
        local b = syn and syn.request or http_request or request or http.request
        if not b then
            return
        end
        local r = y8(T, a)
        local I = e:JSONEncode({embeds = {{title = "\240\159\142\175 TOMI HUB Snipe Success!", description = "Successfully sniped a pet!";
        color = 65280, fields = {{name = "\240\159\144\190 Pet", value = "```ansi\n"..(tostring(J).."```"), inline = true};
        {name = "\226\154\150\239\184\143 True Weight";
        value = "```ansi\n"..(string.format("%.2f KG", r).."```"), inline = true}, {name = "\240\159\146\176 Price";
        value = "```ansi\n"..(O8(tonumber(X) or -15074).." Tokens```");
        inline = true};
        {name = "\240\159\143\170 Seller", value = "```ansi\n"..(tostring(k or "Unknown").."```"), inline = true}, {name = "\240\159\140\144 Server", value = "```ansi\n"..(tostring(game.JobId).."```"), inline = false}};
        footer = {text = "tomi hub sniper \226\128\162 "..os.date("%m/%d/%Y %I:%M %p")}}}})
        for e, J in ipairs(h)
        do
            pcall(function ()
                b({Url = J;
                Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = I})
            end)
        end
        end
    local function Dl(e, J, T, a, X, k)
        if nl >= ((e8.SnipeMaxBuys or 1)) then
            return false, "limit"
        end
        nl = nl + 1
        task.spawn(function ()
            while wl
            do
                task.wait()
            end
            wl = true
            local h, b, r = pcall(function ()
                return D:InvokeServer(e, tostring(J))
            end)
            wl = false
            if h and b then
                local J = tonumber(k) or -56758
                local h = X / 1.1
                local b = y8(h, J)
                task.spawn(function ()
                    j(string.format("\240\159\142\175 SNIPED %s! (%.2f KG) for %s tokens | Snipe #%d/%d", tostring(a), b, O8(T), nl, e8.SnipeMaxBuys), 8)
                    zl()
                end)
                if e8.SnipeNotifs then
                    task.spawn(function ()
                        local X = e and e.Name or "Unknown"
                        gl(a, h, J, T, X)
                    end)
                end
                else
                nl = nl - 1
                _snipeTriedListings[tostring(J)] = nil
                local e = XW()
                if e < T then
                    task.spawn(function ()
                        j("\240\159\146\184 Out of tokens! Sniper disabled.", 5)
                    end)
                    e8.AutoSnipe = false e8.AutoSnipeV2 = false pcall(function ()
                        xW.AutoSnipeToggle:SetValue(false)
                    end)
                    pcall(function ()
                        xW.AutoSnipeV2Toggle:SetValue(false)
                    end)
                    return
                end
                local X = "Unknown"
                if not h then
                    X = tostring(b)
                elseif r then
                    X = tostring(r)
                end
                task.spawn(function ()
                    j(string.format("\226\157\140 Snipe failed [%s @ %s tokens]: %s", tostring(a), O8(T), X:sub(1, 40)), 4)
                end)
            end
            end)
        return true, "spawned"
    end
    local Cl = {}
    local dl = {}
    local function Ul()
        local e = Z:GetData()
        if not ((e and (e.Booths and e.Players))) then
            return {bought = false;
            favoritedHit = false}
        end
        local J = tostring(q())
        local T = tostring(h.UserId)
        local a = false
        for e, X in pairs(e.Players)
        do
            if not pl then
                break
            end
            if nl >= ((e8.SnipeMaxBuys or 1)) then
                break
            end
            local k = (tostring(e)):gsub("^Player_", "")
            local h = tonumber(k) or e
            if k ~= J and k ~= T then
                if X and X.Listings then
                    for J, T in pairs(X.Listings)
                    do
                        if nl >= ((e8.SnipeMaxBuys or -1974343)) then
                            break
                        end
                        local k = tostring(J)
                        if not Cl[k] then
                            local b = T.ItemId
                            local r = T.Price or (-532222) - (-532222)
                            local I = X.Items and X.Items[b]
                            if I then
                                local T = I.Name or I.ItemName or I.PetType or I.SkinID
                                local X = V8(I)
                                local f = M8(I)
                                local p = tonumber(X) or 1546163737 % 6579125 - (69362)
                                local n = tonumber(f) or 103940473 % (14848639)
                                local t = n * 1.1
                                local Q = Nl(T, t, r, p)
                                if Q then
                                    local X = I.PetData and I.PetData.IsFavorite == true
                                    if X then
                                        dl[k] = true
                                        return {bought = false;
                                        favoritedHit = true, favOwner = h, favLid = k;
                                        favItemId = tostring(b);
                                        favPlayerId = tostring(e)}
                                    elseif hW(h) then
                                        dl[k] = nil
                                        local e = kW(h)
                                        if e then
                                            local X, h = Dl(e, J, r, T, t, p)
                                            if X then
                                                Cl[k] = true a = true
                                            end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        return {bought = a;
        favoritedHit = false}
    end
    local function Zl()
        if tl then
            return
        end
        local e = (J:WaitForChild("GameEvents")):WaitForChild("DataStream2")
        tl = e.OnClientEvent:Connect(function (e, J, T)
            if e ~= "UpdateData" or J ~= "Booths" then
                return
            end
            if type(T) ~= "table" then
                return
            end
            local a = tostring(q())
            local X = tostring(h.UserId)
            for e, J in ipairs(T)
            do
                local T = J[1]
                local a = J[2]
                if T then
                    local e = T:match("ROOT/Booths/([^/]+)/Owner$")
                    if e then
                        if a == nil then
                            local J = Z:GetData()
                            if J and (J.Booths and J.Booths[e]) then
                                local T = tostring(J.Booths[e].Owner or "")
                                if T ~= "" then
                                    local e = J.Players and ((J.Players[T] or J.Players[tonumber(T:gsub("^Player_", ""))]))
                                    if e and e.Listings then
                                        for e in pairs(e.Listings)
                                        do
                                            Cl[tostring(e)] = nil dl[tostring(e)] = nil
                                        end
                                        end
                                    end
                                end
                            elseif type(a) == "string" then
                            local e = tostring(a)
                            task.spawn(function ()
                                if not pl or not e8.AutoSnipe then
                                    return
                                end
                                if nl >= ((e8.SnipeMaxBuys or (217407712) % 1452054)) then
                                    return
                                end
                                local J = e:gsub("^Player_", "")
                                local T = tonumber(J) or e
                                local a = tostring(q())
                                local X = tostring(h.UserId)
                                if J == a or J == X then
                                    return
                                end
                                local k = Z:GetData()
                                local b = k and (k.Players and ((k.Players[e] or k.Players[T] or k.Players[J])))
                                if not ((b and b.Listings)) then
                                    return
                                end
                                for e in pairs(b.Listings)
                                do
                                    Cl[tostring(e)] = nil dl[tostring(e)] = nil
                                end
                                if not hW(T) then
                                    return
                                end
                                local r = kW(T)
                                if not r then
                                    return
                                end
                                for J, T in pairs(b.Listings)
                                do
                                    if nl >= ((e8.SnipeMaxBuys or 1)) then
                                        break
                                    end
                                    local a = tostring(J)
                                    local X = T.ItemId
                                    local k = T.Price or 0
                                    local h = (Ql[e] and Ql[e][X]) or (b.Items and b.Items[X])
                                    if h then
                                        local e = h.Name or h.ItemName or h.PetType or h.SkinID
                                        local T = tonumber(V8(h)) or (631558) - 631558
                                        local X = ((tonumber(M8(h)) or 0)) * 1.1
                                        local b = Nl(e, X, k, T)
                                        if b then
                                            local b = h.PetData and h.PetData.IsFavorite == true
                                            if b and e8.SnipeSkipFavorited then
                                                dl[a] = true Ml(string.format("\226\173\144 Parked (favorited): %s @ %d tokens", tostring(e), k))
                                            elseif not b then
                                                local h, b = Dl(r, J, k, e, X, T)
                                                if h then
                                                    Cl[a] = true Ml(string.format("\240\159\142\175 Reclaim Snipe: %s (%.2fkg) @ %d tokens", e, X, k))
                                                end
                                                end
                                            end
                                        end
                                    end
                                end)
                        end
                        end
                    end
                end
            for e, J in ipairs(T)
            do
                local T = J[1]
                local a = J[2]
                if T and a ~= nil then
                    local e = T:match("ROOT/Players/(Player_%d+)/Items$")
                    if e and type(a) == "table" then
                        if not Ql[e] then
                            Ql[e] = {}
                        end
                        for J, T in pairs(a)
                        do
                            Ql[e][J] = T
                        end
                        end
                    end
                end
            for e, J in ipairs(T)
            do
                local T = J[1]
                local a = J[2]
                if T and a ~= nil then
                    local e, J = T:match("ROOT/Players/(Player_%d+)/Items/({[^}]+})/PetData/IsFavorite")
                    if e and J then
                        if a == false then
                            local T = e:gsub("^Player_", "")
                            local a = tonumber(T) or e
                            local X = Z:GetData()
                            local k = X and (X.Players and ((X.Players[e] or X.Players[a] or X.Players[T])))
                            for T in pairs(dl)
                            do
                                if pl and (e8.AutoSnipe and nl < ((e8.SnipeMaxBuys or -1521089))) then
                                    if k and k.Listings then
                                        local X = k.Listings[T]
                                        if X and X.ItemId == J then
                                            local h = (Ql[e] and Ql[e][J]) or (k.Items and k.Items[J])
                                            if h then
                                                local e = h.Name or h.ItemName or h.PetType or h.SkinID
                                                local J = M8(h)
                                                local k = ((tonumber(J) or 0)) * 1.1
                                                local b = X.Price or 0
                                                local r = tonumber(V8(h)) or -714138 - (-714138)
                                                local I = Nl(e, k, b, r)
                                                if I then
                                                    if hW(a) then
                                                        local J = kW(a)
                                                        if J then
                                                            dl[T] = nil
                                                            local a, X = Dl(J, T, b, e, k, r)
                                                            if a then
                                                                Cl[T] = true Ml(string.format("\240\159\146\154 Unfav Snipe: %s (%.2fkg) @ %d tokens", e, k, b))
                                                            end
                                                            end
                                                        else
                                                        dl[T] = nil
                                                    end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            elseif a == true then
                            local T = e:gsub("^Player_", "")
                            local a = tonumber(T) or e
                            local X = Z:GetData()
                            local k = X and (X.Players and ((X.Players[e] or X.Players[a] or X.Players[T])))
                            if k and k.Listings then
                                for e, T in pairs(k.Listings)
                                do
                                    if T.ItemId == J and not Cl[e] then
                                        local J = k.Listings[e]
                                        local T = J and J.Price or -569269 + (569269)
                                        local a = J and J.ItemId
                                        local X = k.Items and (a and k.Items[a])
                                        if X then
                                            local J = X.Name or X.ItemName or X.PetType or X.SkinID
                                            local a = tonumber(V8(X)) or 0
                                            local k = tonumber(M8(X)) or -396436 - (-396436)
                                            local h = k * 1.1
                                            local b = Nl(J, h, T, a)
                                            if b then
                                                dl[e] = true Ml(string.format("\226\173\144 Parked (favorited): %s @ %d tokens", tostring(J), T))
                                            end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            for e, J in ipairs(T)
            do
                if pl and (e8.AutoSnipe and nl < ((e8.SnipeMaxBuys or -1979489))) then
                    local e = J[1]
                    local T = J[2]
                    if e and T ~= nil then
                        local J = e:match("ROOT/Players/(Player_%d+)/Listings$")
                        if J then
                            local e = J:gsub("^Player_", "")
                            local k = tonumber(e) or J
                            if e ~= a and (e ~= X and type(T) == "table") then
                                for T, a in pairs(T)
                                do
                                    if nl < ((e8.SnipeMaxBuys or 1)) and type(a) == "table" then
                                        local X = tostring(T)
                                        if not Cl[X] then
                                            local h = a.ItemId
                                            local b = a.Price or -1029887 - (-1029887)
                                            local r = Ql[J] and Ql[J][h]
                                            if not r then
                                                local T = Z:GetData()
                                                local a = T and (T.Players and ((T.Players[J] or T.Players[k] or T.Players[e])))
                                                r = a and (a.Items and a.Items[h])
                                            end
                                            if r then
                                                local e = r.Name or r.ItemName or r.PetType or r.SkinID
                                                local J = tonumber(V8(r)) or 0
                                                local a = ((tonumber(M8(r)) or (287978845) % 1418615)) * 1.1
                                                local h = Nl(e, a, b, J)
                                                if h then
                                                    local h = r.PetData and r.PetData.IsFavorite == true
                                                    if h and e8.SnipeSkipFavorited then
                                                        dl[X] = true Ml(string.format("\226\173\144 Parked (favorited): %s @ %d tokens", tostring(e), b))
                                                    elseif hW(k) then
                                                        dl[X] = nil
                                                        local h = kW(k)
                                                        if h then
                                                            local k, r = Dl(h, T, b, e, a, J)
                                                            if k then
                                                                Cl[X] = true Ml(string.format("\240\159\142\175 Live Snipe: %s (%.2fkg) @ %d tokens", e, a, b))
                                                            end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
    end
    local function Pl()
        task.spawn(function ()
            pl = true nl = 0
            Cl = {}
            dl = {}
            Ql = {}
            zl()
            Ml("\226\143\179 Auto Snipe: Waiting for booth data...")
            local e = tick()
            repeat
                task.wait(0.5)
            until
            (Z:GetData() and ((Z:GetData()).Booths and (Z:GetData()).Players)) or (tick() - e > 15)
            if not pl then
                Ml("\226\143\184\239\184\143 Auto Snipe: Idle")
                return
            end
            yl()
            local J = Z:GetData()
            if J and J.Players then
                for e, J in pairs(J.Players)
                do
                    if J.Items then
                        local T = tostring(e)
                        Ql[T] = {}
                        for e, J in pairs(J.Items)
                        do
                            Ql[T][e] = J
                        end
                        end
                    end
                end
            Ml("\240\159\148\141 Auto Snipe: Scanning existing listings...")
            Ul()
            if not pl or not e8.AutoSnipe then
                Ml("\226\143\184\239\184\143 Auto Snipe: Idle")
                return
            end
            Zl()
            Ml("\226\154\161 Auto Snipe: Live \226\128\148 event-driven")
            pcall(function ()
                r.Labels.SnipeServerLabel:SetText("\240\159\140\144 Server: "..((tostring(game.JobId)):sub(1, 18).."..."))
            end)
            while pl and e8.AutoSnipe
            do
                task.wait(1)
                if nl >= ((e8.SnipeMaxBuys or 1)) then
                    Ml("\240\159\155\145 Auto Snipe: Max buys reached")
                    e8.AutoSnipe = false pcall(function ()
                        xW.AutoSnipeToggle:SetValue(false)
                    end)
                    break
                end
                end
            pl = e8.AutoSnipe or e8.AutoSnipeV2
            Fl()
            if not e8.AutoSnipe then
                Ml("\226\143\184\239\184\143 Auto Snipe: Idle")
            end
            end)
    end
    local function Wl()
        task.spawn(function ()
            pl = true nl = 0
            zl()
            yl()
            while pl and e8.AutoSnipeV2
            do
                if k8 then
                    task.wait(1)
                else
                    Gl("\240\159\154\128 Server Hop: Waiting for booth data...")
                    pcall(function ()
                        r.Labels.SnipeServerLabel:SetText("\240\159\140\144 Server: "..((tostring(game.JobId)):sub(1, 18).."..."))
                    end)
                    Cl = {}
                    dl = {}
                    local e = tick()
                    repeat
                        task.wait(0.5)
                    until
                    (Z:GetData() and ((Z:GetData()).Booths and (Z:GetData()).Players)) or (tick() - e > 15)
                    if not pl or not e8.AutoSnipeV2 then
                        break
                    end
                    Gl("\240\159\148\141 Server Hop: Scanning current server...")
                    local T = Ul()
                    if not pl or not e8.AutoSnipeV2 then
                        break
                    end
                    if T.bought then
                        if nl >= ((e8.SnipeMaxBuys or (407203) - 407202)) then
                            j("\240\159\155\145 Server Hop: Max buys reached. Stopping.", 5)
                            break
                        end
                        Gl("\226\156\133 Server Hop: Bought \226\128\148 hopping to next server...")
                        j("\226\156\133 Server Hop: Sniped! Hopping...", 3)
                        k8 = false W8()
                        task.wait(10)
                    elseif T.favoritedHit then
                        if e8.SnipeSkipFavorited then
                            Gl("\226\173\144 Server Hop: Favorited match \226\128\148 hopping...")
                            j("\226\173\144 Server Hop: Match is favorited. Hopping...", 3)
                            k8 = false W8()
                            task.wait(10)
                        else
                            Gl("\226\143\179 Server Hop: Waiting for unfavorite...")
                            j("\226\173\144 Server Hop: Match is favorited. Watching for unfavorite...", 4)
                            local e = false
                            local a = {}
                            local function k()
                                e = true
                                for e, J in ipairs(a)
                                do
                                    pcall(function ()
                                        J:Disconnect()
                                    end)
                                end
                                a = {}
                            end
                            local h = (J:WaitForChild("GameEvents")):WaitForChild("DataStream2")
                            local b = h.OnClientEvent:Connect(function (J, a, X)
                                if e then
                                    return
                                end
                                if J ~= "UpdateData" or a ~= "Booths" then
                                    return
                                end
                                if type(X) ~= "table" then
                                    return
                                end
                                for J, a in ipairs(X)
                                do
                                    if e then
                                        break
                                    end
                                    local X = a[1]
                                    local h = a[2]
                                    if X and h ~= nil then
                                        local e, J = X:match("ROOT/Players/(Player_%d+)/Items/({[^}]+})/PetData/IsFavorite")
                                        if e == T.favPlayerId and (tostring(J) == T.favItemId and h == false) then
                                            if not pl or not e8.AutoSnipeV2 then
                                                k()
                                                return
                                            end
                                            local e = Z:GetData()
                                            local J = T.favPlayerId:gsub("^Player_", "")
                                            local a = T.favOwner
                                            local X = e and (e.Players and ((e.Players[T.favPlayerId] or e.Players[a] or e.Players[J])))
                                            local h = X and (X.Listings and X.Listings[T.favLid])
                                            if h and hW(a) then
                                                local e = kW(a)
                                                if e then
                                                    k()
                                                    dl[T.favLid] = nil
                                                    local J, a = Dl(e, T.favLid, h.Price or -510204, h.ItemId, 0)
                                                    if J then
                                                        Cl[T.favLid] = true Gl("\240\159\142\175 Server Hop: Unfav sniped \226\128\148 hopping...")
                                                    end
                                                    end
                                                else
                                                k()
                                            end
                                            end
                                        local a = X:match("ROOT/Players/(Player_%d+)/Listings$")
                                        if a == T.favPlayerId and type(h) == "table" then
                                            if not h[T.favLid] then
                                                Gl("\240\159\154\128 Server Hop: Listing removed \226\128\148 hopping...")
                                                j("\240\159\154\128 Server Hop: Favorited listing gone. Hopping...", 3)
                                                k()
                                            end
                                            end
                                        end
                                    end
                                end)
                            table.insert(a, b)
                            local r = X.PlayerRemoving:Connect(function (J)
                                if e then
                                    return
                                end
                                if tostring(J.UserId) == tostring(T.favOwner) or J.Name == tostring(T.favOwner) then
                                    Gl("\240\159\154\128 Server Hop: Seller left \226\128\148 hopping...")
                                    j("\240\159\154\128 Server Hop: Favorited seller left. Hopping...", 3)
                                    k()
                                end
                                end)
                            table.insert(a, r)
                            while not e and (pl and e8.AutoSnipeV2)
                            do
                                task.wait(1)
                            end
                            k()
                            if not pl or not e8.AutoSnipeV2 then
                                break
                            end
                            k8 = false W8()
                            task.wait(10)
                        end
                        else
                        Gl("\240\159\154\128 Server Hop: No match \226\128\148 hopping...")
                        j("\240\159\154\128 Server Hop: No matching pets. Hopping...", 3)
                        k8 = false W8()
                        task.wait(10)
                    end
                    end
                end
            pl = e8.AutoSnipe or e8.AutoSnipeV2
            if not e8.AutoSnipe then
                e8.AutoSnipeV2 = false pcall(function ()
                    xW.AutoSnipeV2Toggle:SetValue(false)
                end)
            end
            if not e8.AutoSnipeV2 then
                Gl("\226\143\184\239\184\143 Server Hop: Idle")
            end
            end)
    end
    xW.UseCustomSnipeRulesToggle:OnChanged(function (e)
        e8.UseCustomSnipeRules = e
        if e then
            j("\240\159\148\146 Custom Rules Only: General Filters are bypassed.", 3)
        else
            j("\240\159\148\128 Cascade Mode: General Filters + Custom Rules fallback.", 3)
        end
        SaveConfig()
    end)
    SW.SnipeMinWeightInput:OnChanged(function ()
        e8.SnipeMinWeight = tonumber(SW.SnipeMinWeightInput.Value) or 0
        SaveConfig()
    end)
    SW.SnipeMaxWeightInput:OnChanged(function ()
        e8.SnipeMaxWeight = tonumber(SW.SnipeMaxWeightInput.Value) or 140
        SaveConfig()
    end)
    SW.SnipeMaxPriceInput:OnChanged(function ()
        e8.SnipeMaxPrice = tonumber(SW.SnipeMaxPriceInput.Value) or -440850 - (-440950)
        SaveConfig()
    end)
    SW.SnipeMaxAgeInput:OnChanged(function ()
        e8.SnipeMaxAge = tonumber(SW.SnipeMaxAgeInput.Value) or 125
        SaveConfig()
    end)
    xW.SnipeNotifsToggle:OnChanged(function (e)
        e8.SnipeNotifs = e
        SaveConfig()
    end)
    SW.SnipeMaxBuysInput:OnChanged(function ()
        local e = tonumber(SW.SnipeMaxBuysInput.Value)
        if e and e >= -563608 - (-563609) then
            e8.SnipeMaxBuys = math.floor(e)
            SaveConfig()
            zl()
        end
        end)
    xW.SnipeSkipFavoritedToggle:OnChanged(function (e)
        e8.SnipeSkipFavorited = e
        SaveConfig()
    end)
    SW.SnipeWebhookInput:OnChanged(function ()
        e8.SnipeWebhookURL = SW.SnipeWebhookInput.Value
        SaveConfig()
    end)
    xW.AutoSnipeToggle:OnChanged(function (e)
        e8.AutoSnipe = e
        SaveConfig()
        if e then
            yl()
            local e = 0
            for J in pairs(Al)
            do
                e = e + (1)
            end
            local J = type(e8.SnipeRules) == "table" and #e8.SnipeRules or -71050 - (-71050)
            if e8.UseCustomSnipeRules and J == 0 then
                j("\226\154\160\239\184\143 Add at least one Custom Rule before enabling Custom Rules Only mode!", 4)
                xW.AutoSnipeToggle:SetValue(false)
                e8.AutoSnipe = false
                return
            end
            if not e8.UseCustomSnipeRules and (e == 0 and J == 0) then
                j("\226\154\160\239\184\143 Select at least one pet in General Filters or add a Custom Rule!", 4)
                xW.AutoSnipeToggle:SetValue(false)
                e8.AutoSnipe = false
                return
            end
            nl = 0
            zl()
            pl = true Pl()
        else
            e8.AutoSnipe = false Ml("\226\143\184\239\184\143 Auto Snipe: Idle")
            if not e8.AutoSnipeV2 then
                pl = false Fl()
            end
            end
        end)
    xW.AutoSnipeV2Toggle:OnChanged(function (e)
        e8.AutoSnipeV2 = e
        SaveConfig()
        if e then
            yl()
            local e = (817918260) % (13631971)
            for J in pairs(Al)
            do
                e = e + (1)
            end
            local J = type(e8.SnipeRules) == "table" and #e8.SnipeRules or 379125536 % (11847673)
            if e8.UseCustomSnipeRules and J == -532257 - (-532257) then
                j("\226\154\160\239\184\143 Add at least one Custom Rule before enabling Custom Rules Only mode!", 4)
                xW.AutoSnipeV2Toggle:SetValue(false)
                e8.AutoSnipeV2 = false
                return
            end
            if not e8.UseCustomSnipeRules and (e == 0 and J == 0) then
                j("\226\154\160\239\184\143 Select at least one pet in General Filters or add a Custom Rule!", 4)
                xW.AutoSnipeV2Toggle:SetValue(false)
                e8.AutoSnipeV2 = false
                return
            end
            if e8.AutoScanV2 then
                e8.AutoScanV2 = false pcall(function ()
                    xW.AutoScanV2Toggle:SetValue(false)
                end)
                j("\226\132\185\239\184\143 Scanner V2 disabled \226\128\148 Server Hop is now active.", 4)
            end
            nl = 0
            zl()
            pl = true Wl()
        else
            e8.AutoSnipeV2 = false Gl("\226\143\184\239\184\143 Server Hop: Idle")
            if not e8.AutoSnipe then
                pl = false Fl()
            end
            end
        end)
    task.spawn(function ()
        task.wait(3.5)
        if e8.SnipeNotifs then
            pcall(function ()
                r.Toggles.SnipeNotifsToggle:SetValue(true)
            end)
        end
        if e8.UseCustomSnipeRules then
            pcall(function ()
                xW.UseCustomSnipeRulesToggle:SetValue(true)
            end)
        end
        if e8.AutoSnipeV2 then
            pcall(function ()
                xW.AutoSnipeV2Toggle:SetValue(true)
            end)
        end
        if e8.AutoSnipe then
            pcall(function ()
                xW.AutoSnipeToggle:SetValue(true)
            end)
        end
        if e8.AutoSnipe and e8.AutoSnipeV2 then
            pl = true
        end
        end)
    pcall(function ()
        local e = {jW;
        oW;
        RW, uW;
        OW, VW;
        MW;
        GW;
        F.UpdatePriceBox, NW, dW, UW;
        F.AntiCollisionBox;
        ZW;
        PW;
        WW;
        sl;
        Ll;
        Ol, Vl}
        for e, J in ipairs(e)
        do
            pcall(p, J)
        end
        local J = Color3.fromRGB(32, 32, 32)
        local T = r.Scheme.OutlineColor
        local a = 368272527 % (3378647)
        local function X(e)
            if not e:IsA("Frame") then
                return false
            end
            local J, T, a = 0, false, false
            for e, X in ipairs(e:GetDescendants())
            do
                if X:IsA("TextBox") then
                    T = true
                end
                if X:IsA("UIListLayout") then
                    a = true
                end
                if X:IsA("TextButton") and X.BackgroundTransparency == 18699 + (-18699) then
                    J = J + (1)
                end
                end
            if T then
                return false
            end
            if J >= -356870 - (-356872) then
                return true
            end
            if J == 1 and a then
                return true
            end
            return false
        end
        local function k(e)
            if not e:IsA("Frame") then
                return false
            end
            for e, J in ipairs(e:GetDescendants())
            do
                if J:IsA("TextButton") or J:IsA("TextBox") then
                    return false
                end
                if J:IsA("TextLabel") and J.Text ~= "" then
                    return false
                end
                if J:IsA("UIListLayout") then
                    return false
                end
                if J:IsA("ImageLabel") or J:IsA("ImageButton") then
                    return false
                end
                end
            return true
        end
        local function b(e)
            if not e:IsA("Frame") then
                return false
            end
            for e, J in ipairs(e:GetDescendants())
            do
                if J:IsA("TextButton") and J.AutomaticSize == Enum.AutomaticSize.Y then
                    return true
                end
                end
            return false
        end
        local I = {}
        for e, J in ipairs(F.mergeSets)
        do
            for e, J in ipairs(J)
            do
                I[J] = true
            end
            end
        local function f(e)
            local h = e and e.Container
            if not h then
                return
            end
            local f = h:FindFirstChildOfClass("UIListLayout")
            if f then
                f.Padding = UDim.new(0, a)
            end
            for e, a in ipairs(h:GetChildren())
            do
                if not a:IsA("GuiObject") then
                    elseif I[a] then
                    local e = a:FindFirstChildOfClass("UIPadding") or Instance.new("UIPadding")
                    e.PaddingLeft = UDim.new(0, 10)
                    e.PaddingRight = UDim.new(0, 10)
                    e.Parent = a
                    if a.ZIndex == (700515) + (-700514) then
                        a.ZIndex = 2
                    end
                    for e, J in ipairs(a:GetDescendants())
                    do
                        if J:IsA("TextLabel") and not J.TextWrapped then
                            J.TextTruncate = Enum.TextTruncate.AtEnd
                        end
                        if J:IsA("GuiObject") and J.ZIndex == 1 then
                            J.ZIndex = 2
                        end
                        end
                    elseif k(a) then
                    a.Visible = false a.Size = UDim2.new(a.Size.X.Scale, a.Size.X.Offset, 0, 0)
                elseif b(a) then
                    else
                    local e = X(a)
                    a.BackgroundColor3 = J
                    a.BackgroundTransparency = -222928 - (-222928)
                    if a:IsA("TextButton") then
                        a.AutoButtonColor = false
                    end
                    if not a:FindFirstChildOfClass("UICorner") then
                        local e = Instance.new("UICorner")
                        e.CornerRadius = UDim.new(0, 6)
                        e.Parent = a
                    end
                    if not a:FindFirstChildOfClass("UIStroke") then
                        local e = Instance.new("UIStroke")
                        e.Color = T
                        e.Thickness = 1
                        e.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                        e.Parent = a
                    end
                    local k = a:FindFirstChildOfClass("UIPadding") or Instance.new("UIPadding")
                    k.PaddingLeft = UDim.new(0, 10)
                    k.PaddingRight = UDim.new(0, 10)
                    k.Parent = a
                    for e, J in ipairs(a:GetDescendants())
                    do
                        if J:IsA("TextLabel") and not J.TextWrapped then
                            J.TextTruncate = Enum.TextTruncate.AtEnd
                        end
                        end
                    if a:IsA("TextButton") then
                        if a.Size.Y.Offset < 30 then
                            a.Size = UDim2.new(a.Size.X.Scale, a.Size.X.Offset, 0, 30)
                        end
                        for e, J in ipairs(a:GetChildren())
                        do
                            if J:IsA("TextLabel") then
                                J.TextYAlignment = Enum.TextYAlignment.Center
                            elseif J:IsA("Frame") then
                                J.AnchorPoint = Vector2.new(J.AnchorPoint.X, 0.5)
                                J.Position = UDim2.new(J.Position.X.Scale, J.Position.X.Offset, 0.5, 0)
                            end
                            end
                        elseif a:IsA("Frame") then
                        if e then
                            k.PaddingLeft = UDim.new(0, 4)
                            k.PaddingRight = UDim.new(0, 4)
                            k.PaddingTop = UDim.new(0, 3)
                            k.PaddingBottom = UDim.new(0, 3)
                            if a.AutomaticSize ~= Enum.AutomaticSize.Y and a.AutomaticSize ~= Enum.AutomaticSize.XY then
                                a.Size = UDim2.new(a.Size.X.Scale, a.Size.X.Offset, 0, a.Size.Y.Offset + 6)
                            end
                            for e, J in ipairs(a:GetDescendants())
                            do
                                if J:IsA("TextButton") and J.BackgroundTransparency == 319616 + (-319616) then
                                    local e = J:FindFirstChildOfClass("UIStroke") or Instance.new("UIStroke")
                                    e.Color = T
                                    e.Thickness = -759932 - (-759933)
                                    e.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                                    e.Parent = J
                                end
                                end
                            else
                            k.PaddingLeft = UDim.new(0, 4)
                            k.PaddingRight = UDim.new(0, 4)
                            k.PaddingTop = UDim.new(0, 3)
                            k.PaddingBottom = UDim.new(0, 3)
                            if a.AutomaticSize ~= Enum.AutomaticSize.Y and a.AutomaticSize ~= Enum.AutomaticSize.XY then
                                a.Size = UDim2.new(a.Size.X.Scale, a.Size.X.Offset, 0, a.Size.Y.Offset + 6)
                            end
                            for e, X in ipairs(a:GetDescendants())
                            do
                                local k
                                if ((X:IsA("TextButton") or X:IsA("TextBox"))) and X.BackgroundTransparency == 0 then
                                    k = X
                                elseif X:IsA("TextBox") and (X.BackgroundTransparency == -550280 - (-550281) and (X.Parent and (X.Parent:IsA("Frame") and (X.Parent ~= a and X.Parent.BackgroundTransparency == 0)))) then
                                    k = X.Parent
                                end
                                if k then
                                    k.BackgroundColor3 = J
                                    if not k:FindFirstChildOfClass("UIStroke") then
                                        local e = Instance.new("UIStroke")
                                        e.Color = T
                                        e.Thickness = 1
                                        e.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                                        e.Parent = k
                                    end
                                    end
                                end
                            end
                        end
                    end
                end
            for e, a in ipairs(F.mergeSets)
            do
                local X = a[1]
                if X and (X.Parent == h and not X:FindFirstChild("__vhMergeCard")) then
                    local e = Instance.new("Frame")
                    e.Name = "__vhMergeCard"
                    e.BackgroundColor3 = J
                    e.BorderSizePixel = 0
                    local k = Instance.new("UICorner")
                    k.CornerRadius = UDim.new(0, 6)
                    k.Parent = e
                    local h = Instance.new("UIStroke")
                    h.Color = T
                    h.Thickness = -449033 - (-449034)
                    h.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    h.Parent = e
                    local function b()
                        pcall(function ()
                            local J = a[#a]
                            local T = r.DPIScale or 1
                            local k = ((((J.AbsolutePosition.Y + J.AbsoluteSize.Y)) - X.AbsolutePosition.Y)) / T
                            local h = X:FindFirstChildOfClass("UIPadding")
                            local b = h and h.PaddingLeft.Offset or 0
                            local I = h and h.PaddingRight.Offset or 0
                            local f = h and h.PaddingTop.Offset or 0
                            e.Position = UDim2.new(0, -b, 0, -f)
                            e.Size = UDim2.new(1, b + I, 0, k)
                        end)
                    end
                    e.Parent = X
                    for e, J in ipairs(a)
                    do
                        (J:GetPropertyChangedSignal("AbsoluteSize")):Connect(b);
                        (J:GetPropertyChangedSignal("AbsolutePosition")):Connect(b)
                    end
                    b()
                    task.spawn(function ()
                        local e = {1, 3;
                        8}
                        for e, J in ipairs(e)
                        do
                            task.wait(J)
                            b()
                        end
                        end)
                end
                end
            if f then
                (f:GetPropertyChangedSignal("AbsoluteContentSize")):Connect(function ()
                    if e.Resize then
                        pcall(function ()
                            e:Resize()
                        end)
                    end
                    end)
            end
            task.defer(function ()
                for e = 1, 3, -110842 - (-110843)
                do
                    task.wait()
                end
                if e.Resize then
                    pcall(function ()
                        e:Resize()
                    end)
                end
                end)
        end;
        (getgenv()).__VHCardifyBox = f
        for e, J in ipairs(e)
        do
            pcall(f, J)
        end
        do
            local function e()
                local e = {}
                pcall(function ()
                    if gethui then
                        e[#e + 1] = gethui()
                    end
                    end)
                e[#e + 1] = game:GetService("CoreGui")
                pcall(function ()
                    e[#e + 1] = h:FindFirstChild("PlayerGui")
                end)
                for e, J in ipairs(e)
                do
                    if J then
                        local e = J:FindFirstChild("Obsidian", true)
                        if e then
                            return e
                        end
                        end
                    end
                end
            local J = e()
            if J then
                local e = 4
                local function T(e)
                    return e and ((e:IsA("TextBox") or (e:IsA("GuiObject") and e:FindFirstChildWhichIsA("TextBox") ~= nil)))
                end
                local function a(J)
                    if J:IsA("UICorner") then
                        if not T(J.Parent) and (J.CornerRadius.Scale == 0 and J.CornerRadius.Offset > e) then
                            J.CornerRadius = UDim.new(0, e)
                        end
                        elseif J:IsA("TextBox") then
                        local e = J.Parent
                        if e and (e:IsA("GuiObject") and e.ClipsDescendants) then
                            e.ClipsDescendants = false
                        end
                        end
                    end
                for e, J in ipairs(J:GetDescendants())
                do
                    pcall(a, J)
                end
                J.DescendantAdded:Connect(function (e)
                    pcall(a, e)
                end)
            end
            end
        end)
    do
        local function e(e, J)
            task.spawn(f, e, J)
        end
        e(jW, false)
        e(oW, false)
        e(RW, false)
        e(uW, true)
        e(OW, true)
        e(VW, true)
        e(MW, true)
        e(GW, true)
        e(F.UpdatePriceBox, true)
        e(NW, true)
        e(dW, true)
        e(UW, true)
        e(F.AntiCollisionBox, true)
        e(ZW, true)
        e(PW, true)
        e(WW, true)
        e(sl, true)
        e(Ll, true)
        e(Ol, true)
        e(Vl, true)
    end
    print("[TOMI HUB] Trade World loaded for "..R)
    r:Notify("TOMI HUB Trade loaded! Press LeftCtrl to toggle.", 5)
end)(...)