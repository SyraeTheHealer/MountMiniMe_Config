--[[
	Localization.lua
		Translations for MountMiniMe

	English: Default language
--]]

local L = LibStub('AceLocale-3.0'):NewLocale('MountMiniMe-Config', 'enUS', true)

L.Set = 'Set'
L.Save = 'Save'
L.Copy = 'Copy'
L.Delete = 'Delete'
L.EnterName = 'Enter Name'
L.Profiles = 'Profiles'
L.ProfilesPanelDesc = 'Allows you to manage saved MountMiniMe layouts'



--general settings panel
L.General = 'General'
L.ShowMinimapButton = 'Show Minimap Button'
L.DetectDismountButton = 'Detect dismount'
L.DismissStealthButton = 'Dismiss pet when stealthed'
L.HunterModeButton = 'Hunter mode'
L.HunterModeButtonTooltip = 'When on foot and you have a hunter pet summoned, <Left Click> will attach a mini-me to your hunter pet'
L.ShapeshiftModeButton = 'Shapeshift mode'
L.ShapeshiftModeButtonTooltip = 'When you are shapeshifted, <Left Click> will attach a mini-me to your current shapeshift form'
L.PerCharDismountButton = 'Save dismount pet per-character'
L.PerSpecDismountButton = 'Save dismount pet per-talent specialisation'

L.DismountOperation = "Action to take on dismount"
L.DismountOperation_Dismiss = "Dismiss pet"
L.DismountOperation_Summon = "Summon pet"

L.HunterModeOperation = "Mounting in hunter mode will"
L.HunterModeOperation_UseMount = "Use mount pet"
L.HunterModeOperation_Keep = "Keep hunter pet"

L.ShapeshiftModeOperation = "Mounting in shapeshift mode will"
L.ShapeshiftModeOperation_UseMount = "Use mount pet"
L.ShapeshiftModeOperation_Keep = "Keep shapeshift pet"

--profile settings panel
L.CreateProfile = 'Create Profile...'
L.ResetProfile = 'Reset Profile...'
L.CopyProfile = 'Copy Profile...'
L.ConfirmResetProfile = 'Are you sure you want to reset your profile?'
L.ConfirmCopyProfile = 'Copy contents from %s into the current profile?'
L.ConfirmDeleteProfile = 'Delete profile %s?'
