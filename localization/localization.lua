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

L.DismountOperation = "Action to take on dismount"
L.DismountOperation_Dismiss = "Dismiss pet"
L.DismountOperation_Summon = "Summon pet"

--profile settings panel
L.CreateProfile = 'Create Profile...'
L.ResetProfile = 'Reset Profile...'
L.CopyProfile = 'Copy Profile...'
L.ConfirmResetProfile = 'Are you sure you want to reset your profile?'
L.ConfirmCopyProfile = 'Copy contents from %s into the current profile?'
L.ConfirmDeleteProfile = 'Delete profile %s?'
