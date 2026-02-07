local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Function to create the loading UI
local function createLoadingUI()
    local playerGui = player:WaitForChild("PlayerGui")

    -- Check if UI already exists
    if playerGui:FindFirstChild("IntroLoadingGui") then
        return playerGui.IntroLoadingGui
    end

    -- Create UI
    local LoadingGui = Instance.new("ScreenGui")
    LoadingGui.Name = "IntroLoadingGui"
    LoadingGui.Parent = playerGui
    LoadingGui.DisplayOrder = 999
    LoadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local LoadingFrame = Instance.new("Frame")
    LoadingFrame.Parent = LoadingGui
    LoadingFrame.Size = UDim2.new(0, 300, 0, 150)
    LoadingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    LoadingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    LoadingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    LoadingFrame.BorderSizePixel = 4
    LoadingFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)

    local LoadingFrameCorner = Instance.new("UICorner")
    LoadingFrameCorner.CornerRadius = UDim.new(0, 16)
    LoadingFrameCorner.Parent = LoadingFrame

    local LoadingTitle = Instance.new("TextLabel")
    LoadingTitle.Parent = LoadingFrame
    LoadingTitle.Size = UDim2.new(1, -20, 0.5, 0)
    LoadingTitle.Position = UDim2.new(0, 10, 0, 10)
    LoadingTitle.BackgroundTransparency = 1
    LoadingTitle.Text = "LOADING SCRIPT PLEASE WAIT..."
    LoadingTitle.Font = Enum.Font.SourceSansBold
    LoadingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    LoadingTitle.TextScaled = true

    local LoadingBarBackground = Instance.new("Frame")
    LoadingBarBackground.Parent = LoadingFrame
    LoadingBarBackground.Size = UDim2.new(0.8, 0, 0.1, 0)
    LoadingBarBackground.Position = UDim2.new(0.1, 0, 0.7, 0)
    LoadingBarBackground.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

    local LoadingBar = Instance.new("Frame")
    LoadingBar.Parent = LoadingBarBackground
    LoadingBar.Size = UDim2.new(0, 0, 1, 0)
    LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

    return {
        Gui = LoadingGui,
        Bar = LoadingBar,
        Title = LoadingTitle
    }
end

-- Function to run loading
local function runLoading(uiElements)
    local steps = 100
    local delayTime = 60 / steps -- spread 1 minute over 100 steps

    for i = 1, steps do
        uiElements.Bar.Size = UDim2.new(i / steps, 0, 1, 0)
        task.wait(delayTime)
    end

    -- Full 100% reached
    uiElements.Title.Text = "LOADING COMPLETE PLEASE WAIT"
    uiElements.Bar.Size = UDim2.new(1, 0, 1, 0)

    -- Wait 1 minute before restarting
    task.wait(60)

    -- Reset and restart loading
    uiElements.Bar.Size = UDim2.new(0, 0, 1, 0)
    uiElements.Title.Text = "LOADING SCRIPT PLEASE WAIT..."
    runLoading(uiElements)
end

-- Create UI initially
local uiElements = createLoadingUI()

-- Handle character respawn to make sure UI persists
player.CharacterAdded:Connect(function()
    uiElements = createLoadingUI()
end)

-- Start loading
runLoading(uiElements)
