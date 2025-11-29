-- Ensure this script is in StarterPlayerScripts as a LocalScript
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Delete old GUIs if they exist
if playerGui:FindFirstChild("IntroLoadingGui") then
    playerGui.IntroLoadingGui:Destroy()
end

-- Create loading screen
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
LoadingFrame.BorderColor3 = Color3.fromRGB(255, 255, 255) -- PURE WHITE

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
LoadingTitle.TextColor3 = Color3.fromRGB(255, 255, 255) -- PURE WHITE TEXT
LoadingTitle.TextScaled = true

local LoadingBarBackground = Instance.new("Frame")
LoadingBarBackground.Parent = LoadingFrame
LoadingBarBackground.Size = UDim2.new(0.8, 0, 0.1, 0)
LoadingBarBackground.Position = UDim2.new(0.1, 0, 0.7, 0)
LoadingBarBackground.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local LoadingBar = Instance.new("Frame")
LoadingBar.Parent = LoadingBarBackground
LoadingBar.Size = UDim2.new(0, 0, 1, 0)
LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- PURE WHITE BAR

-- SUPER SLOW LOADING (60 SECONDS)
local steps = 100
local delayTime = 60 / steps  -- 60 seconds total loading

for i = 1, steps do
    LoadingBar.Size = UDim2.new(i / steps, 0, 1, 0)
    task.wait(delayTime)
end

-- STAY AT 100% — NO FADE, NO DESTROY
LoadingTitle.Text = "LOADING COMPLETE PLEASE WAIT"
LoadingTitle.TextColor3 = Color3.fromRGB(255, 255, 255) -- PURE WHITE
