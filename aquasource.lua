-- Aqua UI Library Module
local AquaUI = {}

-- Function to create UI
function AquaUI:CreateUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Settings for the UI size and spacing
    local buttonHeight = 36
    local buttonSpacing = 8
    local headerHeight = 36
    local padding = 16

    -- Main frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Parent = ScreenGui
    MainFrame.Size = UDim2.new(0, 160, 0, headerHeight + padding + 30)  -- Temporary size
    MainFrame.Position = UDim2.new(0.5, -80, 0.5, -frameHeight / 2)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 135, 190)
    MainFrame.BorderSizePixel = 0
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Active = true
    MainFrame.Draggable = true

    -- Add rounded corners
    local UICornerMain = Instance.new("UICorner")
    UICornerMain.Parent = MainFrame
    UICornerMain.CornerRadius = UDim.new(0, 12)

    -- Gradient background
    local UIGradient = Instance.new("UIGradient")
    UIGradient.Parent = MainFrame
    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.0, Color3.fromRGB(0, 185, 235)),
        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(0, 90, 140))
    }
    UIGradient.Rotation = 90

    -- Header
    local Header = Instance.new("TextLabel")
    Header.Parent = MainFrame
    Header.Size = UDim2.new(1, 0, 0, headerHeight)
    Header.BackgroundTransparency = 1
    Header.Text = "Aqua Hub"
    Header.TextColor3 = Color3.fromRGB(255, 255, 255)
    Header.Font = Enum.Font.GothamBold
    Header.TextSize = 18
    Header.TextXAlignment = Enum.TextXAlignment.Center

    -- Function to add button
    function AquaUI:AddButton(buttonText, callback)
        local button = Instance.new("TextButton")
        button.Parent = MainFrame
        button.Size = UDim2.new(0.9, 0, 0, buttonHeight)
        button.BackgroundColor3 = Color3.fromRGB(0, 135, 180)
        button.Text = buttonText
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.Gotham
        button.TextSize = 16
        button.Position = UDim2.new(0.05, 0, 0, headerHeight + padding)

        -- Add rounded corners to button
        local UICornerButton = Instance.new("UICorner")
        UICornerButton.Parent = button
        UICornerButton.CornerRadius = UDim.new(0, 10)

        -- Hover effect with scaling animation
        button.MouseEnter:Connect(function()
            button:TweenSize(UDim2.new(0.9, 0, 0, buttonHeight * 1.1), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.2, true)
        end)
        button.MouseLeave:Connect(function()
            button:TweenSize(UDim2.new(0.9, 0, 0, buttonHeight), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.2, true)
        end)

        button.MouseButton1Click:Connect(function()
            callback()
        end)
    end

    -- Function to add toggle
    function AquaUI:AddToggle(toggleText, callback)
        local isToggled = false
        local button = Instance.new("TextButton")
        button.Parent = MainFrame
        button.Size = UDim2.new(0.9, 0, 0, buttonHeight)
        button.BackgroundColor3 = Color3.fromRGB(0, 135, 180)
        button.Text = toggleText
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.Gotham
        button.TextSize = 16
        button.Position = UDim2.new(0.05, 0, 0, headerHeight + padding)

        -- Add rounded corners to button
        local UICornerButton = Instance.new("UICorner")
        UICornerButton.Parent = button
        UICornerButton.CornerRadius = UDim.new(0, 10)

        -- Toggle functionality with animation
        local ToggleSquare = Instance.new("Frame")
        ToggleSquare.Parent = button
        ToggleSquare.Size = UDim2.new(0, 16, 0, 16)
        ToggleSquare.Position = UDim2.new(1, -22, 0.5, -8)
        ToggleSquare.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ToggleSquare.BorderSizePixel = 0

        -- Rounded corners for toggle square
        local UICornerToggle = Instance.new("UICorner")
        UICornerToggle.Parent = ToggleSquare
        UICornerToggle.CornerRadius = UDim.new(0, 4)

        button.MouseButton1Click:Connect(function()
            isToggled = not isToggled
            ToggleSquare.BackgroundColor3 = isToggled and Color3.fromRGB(0, 160, 200) or Color3.fromRGB(255, 255, 255)
            button.BackgroundColor3 = isToggled and Color3.fromRGB(80, 185, 125) or Color3.fromRGB(0, 135, 180)
            callback(isToggled)
        end)
    end

    -- Function to add textbox
    function AquaUI:AddTextbox(placeholderText, callback)
        local textbox = Instance.new("TextBox")
        textbox.Parent = MainFrame
        textbox.Size = UDim2.new(0.9, 0, 0, buttonHeight)
        textbox.Position = UDim2.new(0.05, 0, 0, headerHeight + padding)
        textbox.BackgroundColor3 = Color3.fromRGB(0, 135, 180)
        textbox.Text = placeholderText
        textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
        textbox.Font = Enum.Font.Gotham
        textbox.TextSize = 16
        textbox.ClearTextOnFocus = true  -- Prevent clearing text when clicked

        -- Add rounded corners to TextBox
        local UICornerTextbox = Instance.new("UICorner")
        UICornerTextbox.Parent = textbox
        UICornerTextbox.CornerRadius = UDim.new(0, 10)

        -- Hover effect for TextBox
        textbox.MouseEnter:Connect(function()
            textbox.BackgroundColor3 = Color3.fromRGB(0, 135, 180)
        end)
        textbox.MouseLeave:Connect(function()
            textbox.BackgroundColor3 = Color3.fromRGB(0, 135, 180)
        end)

        textbox.FocusLost:Connect(function()
            callback(textbox.Text)
        end)
    end
    
    -- Credits label at the bottom
local Credits = Instance.new("TextLabel")
Credits.Parent = MainFrame
Credits.Size = UDim2.new(1, -10, 0, 18)
Credits.Position = UDim2.new(0.5, 0, 1, -8)
Credits.AnchorPoint = Vector2.new(0.5, 1)
Credits.BackgroundTransparency = 1
Credits.Text = "Made by @ExploitFin"
Credits.TextColor3 = Color3.fromRGB(180, 180, 180)
Credits.Font = Enum.Font.Gotham
Credits.TextSize = 12
Credits.TextXAlignment = Enum.TextXAlignment.Center
Credits.TextYAlignment = Enum.TextYAlignment.Bottom
Credits.TextTransparency = 0.35
table.insert(elements, Credits)  -- Add credits label to elements list

-- Minimize button click functionality with smooth transition
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        MinimizeButton.Text = "+"
        for _, element in ipairs(elements) do
            element.Visible = false  -- Hide all elements
        end
        Separator.Visible = false  -- Hide separator line

        -- Smooth animation for minimizing
        MainFrame:TweenSize(UDim2.new(0, 160, 0, headerHeight + 10), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
    else
        MinimizeButton.Text = "-"
        for _, element in ipairs(elements) do
            element.Visible = true  -- Show all elements
        end
        Separator.Visible = true  -- Show separator line

        -- Smooth animation for expanding
        MainFrame:TweenSize(UDim2.new(0, 160, 0, frameHeight), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
    end
end)

    return AquaUI
end

return AquaUI