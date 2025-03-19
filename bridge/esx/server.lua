if Config.Framework ~= "esx" then
    return
end

local export, ESX = pcall(function()
    return exports.es_extended:getSharedObject()
end)

if not export then
    TriggerEvent("esx:getSharedObject", function(obj)
        ESX = obj
    end)
end

function GetIdentifier(source)
    return ESX.GetPlayerFromId(source)?.identifier
end

function GetSourceFromIdentifier(identifier)
    return ESX.GetPlayerFromIdentifier(identifier)?.source
end

function GetIngameName(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local firstName, lastName
    if xPlayer?.get and xPlayer.get("firstName") and xPlayer.get("lastName") then
        firstName = xPlayer.get("firstName")
        lastName = xPlayer.get("lastName")
    else
        local name = MySQL.Sync.fetchAll("SELECT `firstname`, `lastname` FROM `users` WHERE `identifier`=@identifier", {
            ["@identifier"] = GetIdentifier(source)
        })
        firstName, lastName = name[1]?.firstname or GetPlayerName(source), name[1]?.lastname or ""
    end

    return ("%s %s"):format(firstName, lastName)
end

-------------------------------------------------------
-- esx/server.lua

-- Callbacks
ESX.RegisterServerCallback('mfp_extremesportshops:getMoney', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getMoney()
    
    cb(money)
end)

-- item-register
ESX.RegisterUsableItem('nurek', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('mfp_extremesportshops:usedivingmask', source)
end)

-- Data-Handling
function getPlayer(source)
    return ESX.GetPlayerFromId(source)
end

function hasMoney(xPlayer, amount)
    return xPlayer.getMoney() >= amount
end

function removeMoney(xPlayer, amount)
    xPlayer.removeMoney(amount)
end

function addMoney(xPlayer, amount)
    xPlayer.addMoney(amount)
end

function hasItem(xPlayer, item)
    return xPlayer.getInventoryItem(item).count >= 1
end

function addItem(xPlayer, item, count)
    xPlayer.addInventoryItem(item, count)
end

function removeItem(xPlayer, item, count)
    xPlayer.removeInventoryItem(item, count)
end

function hasWeapon(xPlayer, weapon)
    return xPlayer.hasWeapon(weapon)
end

function addWeapon(xPlayer, weapon)
    xPlayer.addWeapon(weapon, 1)
end

function removeWeapon(xPlayer, weapon)
    xPlayer.removeWeapon(weapon)
end

function notifyClient(xPlayer, title, subtitle, message, icon, type)
    TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, title, subtitle, message, icon, type)
end

function logToDiscord(title, player, action, item, price)
    if Dicordlogging then
        local message = string.format('__**mfp_extremesportshops**__\n\n**[Player]**: %s\n**[Identifier]**: %s\n**[Manner]**: %s\n**[Item]**: %s\n**[Price]**: $%s',
            player.name, player.identifier, action, item, price)
        TriggerEvent('mfp_extremesportshops:discordlog', message, DiscordWebhook['webhook'])
    end
end
