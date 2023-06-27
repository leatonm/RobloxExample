local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local speaking = false

-- Fetch the JSON data from the provided URL
local url = "https://raw.githubusercontent.com/mshwery/dad-jokes-api/master/jokes.json"
local jokesData = HttpService:GetAsync(url)
local jokes = HttpService:JSONDecode(jokesData)

local function pickRandomJoke()
	-- Randomly select a joke from the JSON data
	local randomIndex = math.random(1, #jokes)
	local randomJoke = jokes[randomIndex]

	local joke = randomJoke.joke

	return joke
end

local function sayJoke(dadModel, joke)
	-- Get the head position of the dad model
	local headPosition = dadModel.Head.Position

	-- Calculate the position for the chat bubble above the dad model's head
	local bubblePosition = headPosition + Vector3.new(0, 2, 0)

	-- Display the joke in a chat bubble above the dad model's head
	local chatBubble = Instance.new("BillboardGui")
	chatBubble.Adornee = dadModel.Head
	chatBubble.Size = UDim2.new(0, 200, 0, 50)
	chatBubble.StudsOffset = bubblePosition
	chatBubble.AlwaysOnTop = true
	chatBubble.Parent = dadModel.Head

	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 1, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextStrokeTransparency = 0
	textLabel.TextSize = 25
	textLabel.Font = Enum.Font.SourceSansBold
	textLabel.Text = joke
	textLabel.Parent = chatBubble

	wait(8) -- Wait for 8 seconds

	-- Remove the chat bubble after displaying the joke
	chatBubble:Destroy()
end

-- Handle the player touching the dad model
local function onPlayerTouch(part)
	local player = Players:GetPlayerFromCharacter(part.Parent)
	if player then
		if speaking == false then
			speaking = true
			local dadModel = game.Workspace.Dad

			-- Pick a random joke
			local joke = pickRandomJoke()

			-- Display the joke as a chat bubble above the dad model's head
			sayJoke(dadModel, joke)

			speaking = false
		end
	end
end

-- Detect when a player touches the dad model
game.Workspace.Dad.Torso.Touched:Connect(onPlayerTouch)
