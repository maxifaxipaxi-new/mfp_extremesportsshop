Config = {}

-- Framework
Config.Framework = "auto" --[[
    Supported:
    -   qb-core
    -   esx
    -   custom
    -   auto
]]

-- Translations
Config.Locale = 'en' -- see folder: locales/*lua for all translations
-- Constribute on adding your own translation at: https://github.com/mfpscripts/TRANSLATIONS

-- Logging
Dicordlogging = false -- type true to enable it!
DiscordWebhook = {
    ['webhook'] = '',
}

-- Locations
Config.ShopLocations = {
    { ['x'] = -1351.53,  ['y'] = -1128.42,  ['z'] = 3.11} -- more possible
}
    
Config.Npc = { -- coords to add more npc's dealers you want
   { ['x'] = -1351.53, ['y'] = -1128.42, ['z'] = 3.11, ['h'] = 57.61}, -- more possible    
}

-- Prices
Config.sellPercentage = 0.8 -- 80% off price bought
Config.Prices = {
    parachute = 1000,
    divingmask = 300
}

-- Skinchanger
Config.SkinChangerScript = 'skinchanger' --[[
    Supported:
    -   skinchanger
    -   custom
]]
-- Custom
function customChangeClothing()
    -- add your own clothingscript here
end