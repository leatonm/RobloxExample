-- Script to create a simple platformer game

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local jumpPower = 50
local moveSpeed = 16

local isJumping = false
local isGrounded = false

-- Check if the character is grounded
local function checkGrounded()
    local ray = Ray.new(rootPart.Position, Vector3.new(0, -1, 0) * 3)
    local part, position = workspace:FindPartOnRay(ray, character, false, true)

    if part then
        isGrounded = true
    else
        isGrounded = false
    end
end

-- Handle jumping
local function jump()
    if isGrounded and not isJumping then
        isJumping = true
        humanoid.Jump = true
        humanoid.JumpPower = jumpPower
    end
end

-- Handle movement
local function move(direction)
    if isGrounded then
        rootPart.Velocity = direction * moveSpeed
    end
end

-- Connect input events
game:GetService("UserInputService").JumpRequest:Connect(jump)
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.Up then
        move(Vector3.new(0, 0, -1))
    elseif input.KeyCode == Enum.KeyCode.S or input.KeyCode == Enum.KeyCode.Down then
        move(Vector3.new(0, 0, 1))
    elseif input.KeyCode == Enum.KeyCode.A or input.KeyCode == Enum.KeyCode.Left then
        move(Vector3.new(-1, 0, 0))
    elseif input.KeyCode == Enum.KeyCode.D or input.KeyCode == Enum.KeyCode.Right then
        move(Vector3.new(1, 0, 0))
    end
end)
game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.Up or
       input.KeyCode == Enum.KeyCode.S or input.KeyCode == Enum.KeyCode.Down or
       input.KeyCode == Enum.KeyCode.A or input.KeyCode == Enum.KeyCode.Left or
       input.KeyCode == Enum.KeyCode.D or input.KeyCode == Enum.KeyCode.Right then
        move(Vector3.new(0, 0, 0))
    end
end)

-- Check if the character is grounded periodically
while wait(0.1) do
    checkGrounded()
end
