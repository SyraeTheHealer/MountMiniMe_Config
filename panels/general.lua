--[[


	general.lua


		A gui for general addon configuration settings


--]]

local AddonName, Addon = ...
local ParentAddonName, ParentAddon = GetAddOnDependencies(AddonName)
local ParentAddon = _G[ParentAddonName]
local L = LibStub('AceLocale-3.0'):GetLocale(ParentAddonName .. '-Config')

local GeneralPanel = Addon.AddonOptions:NewPanel(L.General)
do
	--[[ General Settings ]]--

	local showMinimapButtonToggle = GeneralPanel:Add('CheckButton', {
		name = L.ShowMinimapButton,
		get = function() return ParentAddon:ShowingMinimap() end,
		set = function(_, enable) ParentAddon:SetShowMinimap(enable) end
	})
	showMinimapButtonToggle:SetPoint('TOPLEFT', 0, -2)

	--Stealth options
	local dismissStealthButtonToggle = GeneralPanel:Add('CheckButton', {
		name = L.DismissStealthButton,
		get = function() return ParentAddon:IsDismissOnStealth() end,
		set = function(_, enable) ParentAddon:SetDismissOnStealth(enable) end
	})
	dismissStealthButtonToggle:SetPoint('TOP', showMinimapButtonToggle, 'BOTTOM', 0, -10)

	--Dismount options
	local dismountTypeDropdown = GeneralPanel:Add('Dropdown', {
		name = L.DismountOperation,

		get = function()
			return ParentAddon:GetDismountOperation()
		end,

		set = function(_, value)
			ParentAddon:SetDismountOperation(value or nil)
		end,

		items = {
			{text = L.DismountOperation_Dismiss, value = 'dismiss'},
			{text = L.DismountOperation_Summon, value = 'summon'},
		}
	});

	local detectDismountButtonToggle = GeneralPanel:Add('CheckButton', {
		name = L.DetectDismountButton,
		get = function()
			return ParentAddon:IsDetectDismount();
		end,
		set = function(_, enable)
			if enable then
				dismountTypeDropdown:Show();
			else
				dismountTypeDropdown:Hide();
			end
			ParentAddon:SetDetectDismount(enable);
		end
	})
	detectDismountButtonToggle:SetPoint('TOP', dismissStealthButtonToggle, 'BOTTOM', 0, -10)

	dismountTypeDropdown:SetPoint('LEFT', detectDismountButtonToggle, 'RIGHT', 200, 0);
	dismountTypeDropdown:SetPoint('RIGHT')
	if ParentAddon:IsDetectDismount() then
		dismountTypeDropdown:Show();
	else
		dismountTypeDropdown:Hide();
	end


	--Hunter mode options
	local hunterModeTypeDropdown = GeneralPanel:Add('Dropdown', {
		name = L.HunterModeOperation,

		get = function()
			return ParentAddon:GetHunterModeOperation()
		end,

		set = function(_, value)
			ParentAddon:SetHunterModeOperation(value or nil)
		end,

		items = {
			{text = L.HunterModeOperation_UseMount, value = 'summon'},
			{text = L.HunterModeOperation_Keep, value = 'keep'},
		}
	});

	local hunterModeButtonToggle = GeneralPanel:Add('CheckButton', {
		name = L.HunterModeButton,
		get = function()
			return ParentAddon:IsHunterMode();
		end,
		set = function(_, enable)
			if enable then
				hunterModeTypeDropdown:Show();
			else
				hunterModeTypeDropdown:Hide();
			end
			ParentAddon:SetHunterMode(enable);
		end,
		tooltip = L.HunterModeButtonTooltip
	})
	hunterModeButtonToggle:SetPoint('TOP', detectDismountButtonToggle, 'BOTTOM', 0, -10)

	hunterModeTypeDropdown:SetPoint('LEFT', hunterModeButtonToggle, 'RIGHT', 200, 0);
	hunterModeTypeDropdown:SetPoint('RIGHT')
	if ParentAddon:IsHunterMode() then
		hunterModeTypeDropdown:Show();
	else
		hunterModeTypeDropdown:Hide();
	end
	
	--Per-character options
	local perCharButtonToggle = GeneralPanel:Add('CheckButton', {
		name = L.PerCharDismountButton,
		get = function() return ParentAddon:IsPerCharDismount() end,
		set = function(_, enable) ParentAddon:SetPerCharDismount(enable) end
	})
	perCharButtonToggle:SetPoint('TOP', hunterModeButtonToggle, 'BOTTOM', 0, -10)
	
end
