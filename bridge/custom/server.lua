if Config.Framework ~= "custom" then
    return
end

function GetIdentifier(source)
    return GetPlayerIdentifierByType(source, "license")
end

function GetSourceFromIdentifier(identifier)
    local players = GetPlayers()
    for i = 1, #players do
        local source = players[i]
        if GetIdentifier(source) == identifier then
            return source
        end
    end
end

function GetIngameName(source)
    return GetPlayerName(source) .. " | " .. source
end

---------------------------------------------------
-- Callbacks
-- TODO: add own item callback with getMoney function like listed below
-- name: mfp_extremesportshops:getMoney

--[[ESX.RegisterServerCallback('mfp_extremesportshops:getMoney', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getMoney()
    
    cb(money)
end)]]

-- item-register
-- TODO: add own item register with clientevent like listed below
-- item-name: nurek

-- Example:
--[[ESX.RegisterUsableItem('nurek', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('mfp_extremesportshops:usedivingmask', source)
end)]]

-- Data-Handling

function getCurrentClientMoney(callback)
    --QBCore.Functions.TriggerCallback('mfp_extremesportshops:getMoney', function(money)
    -- add your callback like the qb example up here
        if callback then
            callback(money)
        end
    --end)
end

function getPlayer(source)
    return nil -- add own getPlayer
end

function hasMoney(xPlayer, amount)
    return 0 -- add own hasMoney
end

function removeMoney(xPlayer, amount)
    -- add own removeMoney
end

function addMoney(xPlayer, amount)
    -- add own addMoney
end

function hasItem(player, item)
    if player and player.Functions then
        local inventoryItem = nil -- add your getItembyName function
        return inventoryItem and inventoryItem.amount >= 1 or false
    else
        print("ERROR: player is nil")
        return false
    end
end

function addItem(xPlayer, item, count)
    -- add own addItem
end

function removeItem(xPlayer, item, count)
    -- add own removeItem
end

function hasWeapon(xPlayer, weapon)
    -- add own hasWeapon
end

function addWeapon(xPlayer, weapon)
    -- add own addWeapon
end

function removeWeapon(xPlayer, weapon)
    -- add own removeWeapon
end

function notifyClient(xPlayer, title, subtitle, message, icon, type)
    -- add own notify
    -- TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, title, subtitle, message, icon, type)
end

function logToDiscord(title, player, action, item, price)
    if Dicordlogging then
        local message = string.format('__**mfp_extremesportshops**__\n\n**[Player]**: %s\n**[Identifier]**: %s\n**[Manner]**: %s\n**[Item]**: %s\n**[Price]**: $%s',
            player.name, player.identifier, action, item, price)
        TriggerEvent('mfp_extremesportshops:discordlog', message, DiscordWebhook['webhook'])
    end
end
