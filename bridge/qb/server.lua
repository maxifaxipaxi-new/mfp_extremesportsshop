if Config.Framework ~= "qb-core" then
    return
end

local QB = exports["qb-core"]:GetCoreObject()

function GetIdentifier(source)
    return QB.Functions.GetPlayer(source)?.PlayerData.citizenid
end

function GetSourceFromIdentifier(identifier)
    return QB.Functions.GetPlayerByCitizenId(identifier)?.PlayerData.source
end

function GetIngameName(source)
    local charinfo = QB.Functions.GetPlayer(source)?.PlayerData.charinfo
    if not charinfo then
        return GetPlayerName(source) .. " | " .. source
    end

    return charinfo.firstname .. " " .. charinfo.lastname
end

------------------------------------------------------------------------
-- qb/server.lua

QBCore.Functions.CreateCallback('mfp_extremesportshops:getMoney', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local money = Player.Functions.GetMoney("cash") -- Nur Bargeld
        cb(money)
    else
        cb(0) -- Falls kein Spieler gefunden wurde
    end
end)

-- item-register
QBCore.Functions.CreateUseableItem("nurek", function(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('mfp_extremesportshops:usedivingmask', source)
end)


-- Data-Handling
local function getPlayer(source)
    return QBCore.Functions.GetPlayer(source)
end

local function hasMoney(xPlayer, amount)
    return xPlayer.Functions.GetMoney("cash") >= amount
end

local function removeMoney(xPlayer, amount)
    xPlayer.Functions.RemoveMoney("cash", amount)
end

local function addMoney(xPlayer, amount)
    xPlayer.Functions.AddMoney("cash", amount)
end

local function hasItem(xPlayer, item)
    return xPlayer.Functions.GetItemByName(item) ~= nil
end

local function addItem(xPlayer, item, count)
    xPlayer.Functions.AddItem(item, count)
end

local function removeItem(xPlayer, item, count)
    xPlayer.Functions.RemoveItem(item, count)
end

local function hasWeapon(xPlayer, weapon)
    return xPlayer.Functions.GetItemByName(weapon) ~= nil
end

local function addWeapon(xPlayer, weapon)
    xPlayer.Functions.AddItem(weapon, 1)
end

local function removeWeapon(xPlayer, weapon)
    xPlayer.Functions.RemoveItem(weapon, 1)
end

local function notifyClient(xPlayer, title, subtitle, message, icon, type)
    TriggerEvent('QBCore:Notify', (Translation['buy_true']):format(itemLabel, price), 'success', 5000)

end

local function logToDiscord(title, player, action, item, price)
    if Dicordlogging then
        local message = string.format('__**mfp_extremesportshops**__\n\n**[Player]**: %s\n**[Identifier]**: %s\n**[Manner]**: %s\n**[Item]**: %s\n**[Price]**: $%s',
            player.name, player.identifier, action, item, price)
        TriggerEvent('mfp_extremesportshops:discordlog', message, DiscordWebhook['webhook'])
    end
end
