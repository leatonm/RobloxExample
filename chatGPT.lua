local HttpService = game:GetService("HttpService")

local function createChatBubble(parent, text)
	local bubble = Instance.new("BillboardGui")
	bubble.Name = "ChatBubble"
	bubble.AlwaysOnTop = true
	bubble.Enabled = true
	bubble.Size = UDim2.new(0, 200, 0, 50)
	bubble.Adornee = parent

	local label = Instance.new("TextLabel")
	label.Name = "ChatText"
	label.Parent = bubble
	label.BackgroundTransparency = 1
	label.Position = UDim2.new(0, 0, 0, 0)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.Font = Enum.Font.SourceSansBold
	label.FontSize = Enum.FontSize.Size18
	label.Text = text
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextScaled = true

	bubble.Parent = parent
	return bubble
end

local function displayChatBubble(character, text)
	local chatBubble = character:FindFirstChild("ChatBubble")
	if not chatBubble then
		chatBubble = createChatBubble(character.Head, text)
	else
		chatBubble.ChatText.Text = text
	end

	spawn(function()
		wait(5)
		chatBubble:Destroy()
	end)
end

local function processUserInput(player, userInput)
	-- Send user input to ChatGPT API endpoint
	local apiUrl = "https://api.openai.com/v1/chat/completions"
	local apiKey = "YOUR_API_KEY" -- Replace with your ChatGPT API key
	local _model = "gpt-3.5-turbo"  -- Specify the model you want to use

	local headers = {
		["Content-Type"] = "application/json",
		["Authorization"] = "Bearer " .. apiKey
	}

	local requestBody = {
		messages = {
			{
				role = "system",
				content = "Player: " .. userInput
			}
		},
		model = _model
	}

	local success, result = pcall(function()
		return HttpService:RequestAsync({
			Url = apiUrl,
			Method = "POST",
			Headers = headers,
			Body = HttpService:JSONEncode(requestBody)
		})
	end)

	if success and result.Success and result.StatusCode == 200 then
		local responseData = HttpService:JSONDecode(result.Body)
		local chatResponse = responseData.choices[1].message.content

		-- Get or create the AI bot character
		local aiBot = workspace:FindFirstChild("aiBot")
		if aiBot then
			displayChatBubble(aiBot, chatResponse)
		end
	else
		warn("ChatGPT API request failed:", result)
		-- Handle error or show an error message to the player
		-- ...
	end
end

-- Example usage: handle player input and send it to ChatGPT
game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(userInput)
		processUserInput(player, userInput)
	end)
end)
