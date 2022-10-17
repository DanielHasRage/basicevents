--[[

██████╗░░█████╗░░██████╗██╗░█████╗░███████╗██╗░░░██╗███████╗███╗░░██╗████████╗░██████╗
██╔══██╗██╔══██╗██╔════╝██║██╔══██╗██╔════╝██║░░░██║██╔════╝████╗░██║╚══██╔══╝██╔════╝
██████╦╝███████║╚█████╗░██║██║░░╚═╝█████╗░░╚██╗░██╔╝█████╗░░██╔██╗██║░░░██║░░░╚█████╗░
██╔══██╗██╔══██║░╚═══██╗██║██║░░██╗██╔══╝░░░╚████╔╝░██╔══╝░░██║╚████║░░░██║░░░░╚═══██╗
██████╦╝██║░░██║██████╔╝██║╚█████╔╝███████╗░░╚██╔╝░░███████╗██║░╚███║░░░██║░░░██████╔╝
╚═════╝░╚═╝░░╚═╝╚═════╝░╚═╝░╚════╝░╚══════╝░░░╚═╝░░░╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚═════╝░

This module is made for ease of use for all sorts of development, making simple things like animations take less time.


██╗██╗██╗
██║██║██║
██║██║██║
╚═╝╚═╝╚═╝
██╗██╗██╗
╚═╝╚═╝╚═╝

Edit this module at your own risk!

]]--

local BasicEvents = {
	["PlayAnimation"] = {
		["Execute"] = function (Player, Character, AnimationInstance, ...)
			if not Player or not Character or not AnimationInstance then
				warn("Error (PlayAnimation): Required arguments were missing or nil, aborting")
			elseif Character:IsA("Model") and Character:FindFirstChild("Humanoid") then
				local A_1 = Character.Humanoid:LoadAnimation(AnimationInstance)
				A_1:Play(); task.spawn(function()
					A_1.Stopped:Wait()
					game.Debris:AddItem(A_1, 1)
				end)
			end
		end,
		["Description"] = "An easy way to play animations with minimal code!"
	},
	
	["StopAnimation"] = {
		["Execute"] = function (Player, Character, AnimationInstance, ...)
			if not Player or not Character or not AnimationInstance then
				warn("Error (StopAnimation): Required arguments were missing or nil, aborting")
			elseif Character:IsA("Model") and Character:FindFirstChild("Humanoid") then
				local A_1 = Character.Humanoid:GetPlayingAnimationTracks()
				for _,v in pairs(A_1) do
					if AnimationInstance.Name == v.Name then
						v:Stop(); game.Debris:AddItem(v, 1)
					end
				end
			end
		end,
		["Description"] = "Use this to stop a specified animation from playing on a specific humanoid!"
	},
	
	["GetCharacterPosition"] = {
		["Execute"] = function (Character, ...)
			local valueToReturn
			if not Character then
				warn("Error (GetCharacterPosition): Required arguments were missing or nil, aborting")
			elseif Character:IsA("Model") and Character:FindFirstChild("HumanoidRootPart") then
				local A_1 = Character.HumanoidRootPart.Position; valueToReturn = A_1
			end
			return valueToReturn
		end,
		["Description"] = "Use this to get the current position of any passed Character!"
	},
	
	["GetPartPosition"] = {
		["Execute"] = function (Part, ...)
			local valueToReturn
			if not Part then
				warn("Error (GetPartPosition): Required arguments were missing or nil, aborting")
			elseif Part:IsA("Part") then
				local A_1 = Part.Position; valueToReturn = A_1
			end
			return valueToReturn
		end,
		["Description"] = "Use this to get a parts position, pretty pointless but here to be fancy!"
	},
	
	["GetDistanceBetweenCharacters"] = {
		["Execute"] = function (TargetCharacterOne, TargetCharacterTwo, ...)
			local valueToReturn
			if not TargetCharacterOne or not TargetCharacterTwo then
				warn("Error (GetDistanceBetweenCharacters): Required arguments were missing or nil, aborting")
			elseif TargetCharacterOne:IsA("Model") and TargetCharacterOne:FindFirstChild("HumanoidRootPart") and TargetCharacterTwo:IsA("Model") and TargetCharacterTwo:FindFirstChild("HumanoidRootPart") then
				local A_1 = (TargetCharacterOne.HumanoidRootPart.Position - TargetCharacterTwo.HumanoidRootPart.Position).Magnitude; valueToReturn = A_1
			end
			return valueToReturn
		end,
		["Description"] = "Use this to get the distance in magnitude between two Characters!"
	},
	
	["TeleportCharacter"] = {
		["Execute"] = function (Character, Position, ...)
			if not Character or not Position then
				warn("Error (TeleportCharacter): Required arguments were missing or nil, aborting")
			elseif Character:IsA("Model") and Character:FindFirstChild("HumanoidRootPart") then
				Character:MoveTo(Position)
			end
		end,
		["Description"] = "Use this to teleport a Character to a specified Vector3!"
	},
	
	["WalkToCharacterPosition"] = {
		["Execute"] = function (Character, TargetCharacter, ...)
			if not Character or not TargetCharacter then
				warn("Error (WalkToCharacterPosition): Required arguments were missing or nil, aborting")
			elseif Character:IsA("Model") and Character:FindFirstChild("Humanoid") and TargetCharacter:IsA("Model") and TargetCharacter:FindFirstChild("HumanoidRootPart") then
				task.spawn(function()
					Character.Humanoid:MoveTo(TargetCharacter.HumanoidRootPart.Position)
					Character.Humanoid.MoveToFinished:Wait()
				end)
			end
		end,
		["Description"] = "Use this to have one Character walk to another Character!"
	},
	
	["MakeCharacterChat"] = {
		["Execute"] = function (Character, Message, ...)
			if not Character or not Message then
				warn("Error (MakeCharacterChat): Required arguments were missing or nil, aborting")
			elseif Character:IsA("Model") and Character:FindFirstChild("Head") then
				local ChatService = game:GetService("Chat"); ChatService.BubbleChatEnabled = true
				local Adornee = Character.Head; ChatService:Chat(Adornee, Message)
			end
		end,
		["Description"] = "Use this to make a Character have a ChatBubble appear above their head with your custom message!"
	},
	
	["CreateCurrencyForPlayer"] = {
		["Execute"] = function (Player, CurrencyName, Amount, ...)
			local valueToReturn
			if not Player or not CurrencyName or not Amount then
				warn("Error (CreateCurrencyForPlayer): Required arguments were missing or nil, aborting")
			elseif not Player:FindFirstChild("leaderstats") then
				local A_1 = Instance.new("Folder", Player); A_1.Name = "leaderstats"
				local A_2 = Instance.new("NumberValue", A_1); A_2.Name = CurrencyName; A_2.Value = Amount; valueToReturn = A_2
			else
				local A_2 = Instance.new("NumberValue", Player.leaderstats); A_2.Name = CurrencyName; A_2.Value = Amount; valueToReturn = A_2
			end
			return valueToReturn
		end,
		["Description"] = "Create a leaderstat currency for a specified player with a specified amount, this will return the instance if it needs to be modified or stored!"
	},
	
	["AddToCurrencyForPlayer"] = {
		["Execute"] = function (Player, CurrencyName, Amount, ...)
			if not Player or not CurrencyName or not Amount then
				warn("Error (AddToCurrencyForPlayer): Required arguments were missing or nil, aborting")
			elseif Player:FindFirstChild("leaderstats") and Player.leaderstats:FindFirstChild(CurrencyName) then
				Player.leaderstats[CurrencyName].Value += Amount
			end
		end,
		["Description"] = "Add to an existing leaderstat in a specified player by indexing it's name, and add a certain amount!"
	},
	
	["SubtractFromCurrencyForPlayer"] = {
		["Execute"] = function (Player, CurrencyName, Amount, ...)
			if not Player or not CurrencyName or not Amount then
				warn("Error (SubtractFromCurrencyForPlayer): Required arguments were missing or nil, aborting")
			elseif Player:FindFirstChild("leaderstats") and Player.leaderstats:FindFirstChild(CurrencyName) then
				Player.leaderstats[CurrencyName].Value -= Amount
			end
		end,
		["Description"] = "Subtract from an existing leaderstat in a specified player by indexing it's name, and subtract a certain amount!"
	},
	
	["CreatePlayerTitle"] = {
		["Execute"] = function (Player, TitleName, ...)
			local valueToReturn
			if not Player or not TitleName then
				warn("Error (CreatePlayerTitle): Required arguments were missing or nil, aborting")
			elseif not Player:FindFirstChild("leaderstats") then
				local A_1 = Instance.new("Folder", Player); A_1.Name = "leaderstats"
				local A_2 = Instance.new("StringValue", A_1); A_2.Name = "Title"; A_2.Value = TitleName; valueToReturn = A_2
			else
				local A_2 = Instance.new("StringValue", Player.leaderstats); A_2.Name = "Title"; A_2.Value = TitleName; valueToReturn = A_2
			end
			return valueToReturn
		end,
		["Description"] = "Give a specific Player a Title in leaderstats, and return the Instance in case it needs to be modified or stored!"
	},
	
	["EditPlayerTitle"] = {
		["Execute"] = function (Player, TitleName, ...)
			if not Player or not TitleName then
				warn("Error (CreatePlayerTitle): Required arguments were missing or nil, aborting")
			elseif Player:FindFirstChild("leaderstats") and Player.leaderstats:FindFirstChild("Title") then
				Player.leaderstats.Title.Value = TitleName
			end
		end,
		["Description"] = "Change a players already existing Title in leaderstats!"
	}
}

return BasicEvents
