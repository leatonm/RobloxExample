# Custom player controller.
In this example, we're creating a simple platformer game. The code handles player input for movement (WASD or arrow keys) and jumping (spacebar). The player's character can move in the horizontal direction and jump when grounded.

The script retrieves the player's character and sets up input event handlers to detect key presses and releases. The jump function is responsible for initiating the jump when the player presses the jump key. The move function moves the character based on the input direction. The checkGrounded function checks if the character is touching the ground by performing a raycast downwards.

The script continuously checks if the character is grounded using a while loop with a small delay. This ensures that the character's grounded state is always up to date.

This example demonstrates more advanced concepts like input handling, character movement, and raycasting. You can further expand on this code to create more complex gameplay mechanics, add animations, or implement other features based on your specific requirements or skillset

# ChatGPT Integration Into Roblox
![image](https://github.com/leatonm/RobloxExample/assets/41974737/4aeb0e30-568a-48cd-b707-b3cf2bff28de)

In this example, We will make an AI ingame ChatGPT.

After receiving the response from ChatGPT, we find the AI bot character in the workspace using its name "aiBot". If the character is found, we display the chat response by calling displayChatBubble and passing the AI bot character and the response text.

The chat bubble is displayed for 5 seconds (you can adjust this duration as needed) before being automatically removed.

Make sure to replace "YOUR_API_KEY" with your actual ChatGPT API key, and ensure that the AI bot character is named "aiBot" or modify the code accordingly.

Feel free to customize the appearance of the chat bubble by modifying the BillboardGui and TextLabel properties in the createChatBubble function to match your desired visual style.

Remember to handle any potential errors or edge cases and adapt the code to fit your specific game and character setup.

#API Key?
![image](https://github.com/leatonm/RobloxExample/assets/41974737/ae7bc082-cdf0-4a44-99ca-938cda18a6ec)

To obtain a ChatGPT API key, you will need to sign up for an API key from OpenAI. Here's a step-by-step guide on how to get your ChatGPT API key:
Visit the OpenAI website at https://openai.com/.
Click on the "Get started" or "Sign up" button to create an account or log in if you already have one.
Once logged in, navigate to the OpenAI API page at https://openai.com/api/.
Read and understand the information about the API and its usage.
Click on the "Get started" or "Go to the playground" button to access the OpenAI API playground.
In the playground, you can test the API and experiment with the available models. However, to get your API key, you'll need to navigate to the "API Keys" section on the left side menu.
In the "API Keys" section, you'll have the option to create a new API key.
Follow the instructions to create a new API key. You may need to provide additional information and agree to the terms and conditions.
Once you've created your API key, you should see it listed in the "API Keys" section. The key will typically be a long alphanumeric string.

#Error: ChatGPT API request failed: Http requests are not enabled. Enable via game settings?
If you encounter the error message "ChatGPT API request failed: Http requests are not enabled. Enable via game settings," it means that HTTP requests are disabled in your Roblox game settings. To resolve this issue, you need to enable HTTP requests by following these steps:

In Roblox Studio, open the game that you want to enable HTTP requests for.
Click on the "Game Settings" tab located at the top of the Studio window.
Under the "Security" section, you'll find the "Allow HTTP Requests" option. By default, it is disabled.
Enable the "Allow HTTP Requests" checkbox to enable HTTP requests for your game.
Enabling HTTP requests will allow your game to make outbound HTTP requests to external APIs like the ChatGPT API.

Once you have enabled HTTP requests, you can re-run your code, and the "ChatGPT API request failed" error should no longer occur. Make sure to test your code thoroughly to ensure that it works as expected.

Note that enabling HTTP requests may introduce security risks, so it's essential to use caution and validate and sanitize any user-provided input before making requests to external APIs.
![image](https://github.com/leatonm/RobloxExample/assets/41974737/71f39a35-30a0-4b33-a2b6-1539c1ad3736)







