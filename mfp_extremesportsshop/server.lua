ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('mfp_extremesportshops:givedivingmask') -- GADGET_PARACHUTE
AddEventHandler('mfp_extremesportshops:givedivingmask', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Price['divingmask_price']  
	local item = 'nurek'
	local itemlabel = Translation[Config.Locale]['divingmask']
    local xMoney = xPlayer.getMoney()

    
    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem(item, 1)
		TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['dealer'], Translation[Config.Locale]['buy'], (Translation[Config.Locale]['buy_true']):format(itemlabel,price), 'CHAR_JOSEF', 9 )
		if Dicordlogging then
		TriggerEvent('mfp_extremesportshops:discordlog', '__**mfp_extremesportshops**__\n\n**[Player]**: '..xPlayer.name..'\n**[Identifier]**: '..xPlayer.identifier..'\n**[Manner]**: Bought it\n**[Item]**: '..itemlabel..'\n**[Price]**: $'..price..'', DiscordWebhook['webhook'])
        end
    else
		 TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['dealer'], Translation[Config.Locale]['buy'], (Translation[Config.Locale]['buy_false']):format(price), 'CHAR_JOSEF', 7 )
    end
end)

RegisterNetEvent('mfp_extremesportshops:selldivingmask')
AddEventHandler('mfp_extremesportshops:selldivingmask', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local sellprice = Price['divingmask_sellprice'] 
	local item = 'nurek'
	local itemlabel = Translation[Config.Locale]['divingmask']
    local xMoney = xPlayer.getMoney()

    if xPlayer.getInventoryItem(item).count >= 1 then
		xPlayer.addMoney(sellprice)
        xPlayer.removeInventoryItem(item, 1)
		TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['dealer'], Translation[Config.Locale]['sell'], (Translation[Config.Locale]['sell_true']):format(itemlabel,sellprice), 'CHAR_JOSEF', 7 )
		if Dicordlogging then
		TriggerEvent('mfp_extremesportshops:discordlog', '__**mfp_extremesportshops**__\n\n**[Player]**: '..xPlayer.name..'\n**[Identifier]**: '..xPlayer.identifier..'\n**[Manner]**: Sold it\n**[Item]**: '..itemlabel..'\n**[Price]**: $'..sellprice..'', DiscordWebhook['webhook'])
        end
	else
    TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['dealer'], Translation[Config.Locale]['sell'], (Translation[Config.Locale]['sell_false']):format(itemlabel), 'CHAR_JOSEF', 7 )
    end
end)

ESX.RegisterUsableItem('nurek', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('mfp_extremesportshops:usedivingmask', source)
end)
-----------------------------------------------------------
------------- parachute ----------

RegisterNetEvent('mfp_extremesportshops:buyparachute')
AddEventHandler('mfp_extremesportshops:buyparachute', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Price['parachute_price']
	local weapon = 'GADGET_PARACHUTE'
	local weaponlabel = Translation[Config.Locale]['parachute']
    local xMoney = xPlayer.getMoney()

	if xPlayer.hasWeapon(weapon) then
		TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['dealer'], Translation[Config.Locale]['buy'], (Translation[Config.Locale]['already_has_it_fail']):format(weaponlabel), 'CHAR_JOSEF', 7 )
	else
    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addWeapon(weapon, 1)
		TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['dealer'], Translation[Config.Locale]['buy'], (Translation[Config.Locale]['buy_true']):format(weaponlabel,price), 'CHAR_JOSEF', 9 )
		if Dicordlogging then
		TriggerEvent('mfp_extremesportshops:discordlog', '__**mfp_extremesportshops**__\n\n**[Player]**: '..xPlayer.name..'\n**[Identifier]**: '..xPlayer.identifier..'\n**[Manner]**: Sold it\n**[Weapon]**: '..weaponlabel..'\n**[Price]**: $'..price..'', DiscordWebhook['webhook'])
        end
    else
		TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['dealer'], Translation[Config.Locale]['buy'], (Translation[Config.Locale]['buy_false']):format(price), 'CHAR_JOSEF', 7 )
    end
    end
end)

RegisterNetEvent('mfp_extremesportshops:sellparachute')
AddEventHandler('mfp_extremesportshops:sellparachute', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Price['parachute_sellprice']
	local weapon = 'GADGET_PARACHUTE'
	local weaponlabel = Translation[Config.Locale]['parachute']
    local xMoney = xPlayer.getMoney()

	if xPlayer.hasWeapon(weapon) then
        xPlayer.addMoney(price)
        xPlayer.removeWeapon(weapon)
		TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['dealer'], Translation[Config.Locale]['buy'], (Translation[Config.Locale]['sell_true']):format(weaponlabel,price), 'CHAR_JOSEF', 9 )
		if Dicordlogging then
		TriggerEvent('mfp_extremesportshops:discordlog', '__**mfp_extremesportshops**__\n\n**[Player]**: '..xPlayer.name..'\n**[Identifier]**: '..xPlayer.identifier..'\n**[Manner]**: Sold it\n**[Weapon]**: '..weaponlabel..'\n**[Price]**: $'..price..'', DiscordWebhook['webhook'])
        end
	else
		TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['dealer'], Translation[Config.Locale]['buy'], (Translation[Config.Locale]['sell_false']):format(weaponlabel), 'CHAR_JOSEF', 7 )
    end
end)

