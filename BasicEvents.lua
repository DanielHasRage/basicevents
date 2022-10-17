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
			else
				if Character:IsA("Model") and Character:FindFirstChild("Humanoid") then
					local A_1 = Character.Humanoid:LoadAnimation(AnimationInstance)
					A_1:Play(); spawn(function()
						A_1.Stopped:Wait()
						game.Debris:AddItem(A_1, 1)
					end)
				end
			end
		end,
		["Description"] = "An easy way to play animations with minimal code!"
	},
	
	["StopAnimation"] = {
		["Execute"] = function (Player, Character, AnimationInstance, ...)
			if not Player or not Character or not AnimationInstance then
				warn("Error (StopAnimation): Required arguments were missing or nil, aborting")
			else
				if Character:IsA("Model") and Character:FindFirstChild("Humanoid") then
					local A_1 = Character.Humanoid:GetPlayingAnimationTracks()
					for _,v in pairs(A_1) do
						if AnimationInstance.Name == v.Name then
							v:Stop(); game.Debris:AddItem(v, 1)
						end
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
			else
				if Character:IsA("Model") and Character:FindFirstChild("HumanoidRootPart") then
					local A_1 = Character.HumanoidRootPart.Position; valueToReturn = A_1
				end
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
			else
				if Part:IsA("Part") then
					local A_1 = Part.Position; valueToReturn = A_1
				end
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
			else
				if TargetCharacterOne:IsA("Model") and TargetCharacterOne:FindFirstChild("HumanoidRootPart") and TargetCharacterTwo:IsA("Model") and TargetCharacterTwo:FindFirstChild("HumanoidRootPart") then
					local A_1 = (TargetCharacterOne.HumanoidRootPart.Position - TargetCharacterTwo.HumanoidRootPart.Position).Magnitude; valueToReturn = A_1
				end
			end
			return valueToReturn
		end,
		["Description"] = "Use this to get the distance in magnitude between two Characters!"
	},
	
	["TeleportCharacter"] = {
		["Execute"] = function (Character, Position, ...)
			if not Character or not Position then
				warn("Error (TeleportCharacter): Required arguments were missing or nil, aborting")
			else
				if Character:IsA("Model") and Character:FindFirstChild("HumanoidRootPart") then
					Character:MoveTo(Position)
				end
			end
		end,
		["Description"] = "Use this to teleport a Character to a specified Vector3!"
	}
}

return BasicEvents
