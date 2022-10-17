# Basic Events
This module is made for ease of use for all sorts of development, making simple things like animations take less time.

This module is developed and designed for ROBLOX

# Installation
Place this module in a ModuleScript Instance in ServerScriptService in ROBLOX Studio

![image](https://user-images.githubusercontent.com/74668451/196124126-090de4c3-f1a9-415f-ad1c-6891881a2e35.png)

# Usage
You can reference the module using require:
```lua
local BasicEvents = require(game:GetService("ServerScriptService"):WaitForChild("BasicEvents", 5))
```

# Functions
```lua
BasicEvents["PlayAnimation"].Execute(Player, Character, Animation)
BasicEvents["StopAnimation"].Execute(Player, Character, Animation)
local CharacterPosition = BasicEvents["GetCharacterPosition"].Execute(Character)
local DistanceBetweenCharacters = BasicEvents["GetDistanceBetweenCharacters"].Execute(CharacterOne, CharacterTwo)
BasicEvents["TeleportCharacter"].Execute(Character, Vector3)
```
