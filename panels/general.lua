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

end
