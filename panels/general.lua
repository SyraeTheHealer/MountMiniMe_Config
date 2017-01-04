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
--      {text = NONE_KEY, value = 'NONE'},
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

-- local dropdown = CreateFrame("Frame", "Test_DropDown", GeneralPanel, "UIDropDownMenuTemplate");
-- UIDropDownMenu_Initialize(dropdown, Test1_DropDown_Initialize); --, "MENU"
-- GeneralPanel:A

  dismountTypeDropdown:SetPoint('LEFT', detectDismountButtonToggle, 'RIGHT', 200, 0);
  dismountTypeDropdown:SetPoint('RIGHT')
  if ParentAddon:IsDetectDismount() then
    dismountTypeDropdown:Show();
  else
    dismountTypeDropdown:Hide();
  end
  
  
  --Stealth options
  local hunterModeButtonToggle = GeneralPanel:Add('CheckButton', {
    name = L.HunterModeButton,
    get = function() return ParentAddon:IsHunterMode() end,
    set = function(_, enable) ParentAddon:SetHunterMode(enable) end,
    tooltip = L.HunterModeButtonTooltip
  })
  hunterModeButtonToggle:SetPoint('TOP', detectDismountButtonToggle, 'BOTTOM', 0, -10)
end
