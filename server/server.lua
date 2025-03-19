-- Logging
RegisterServerEvent('mfp_extremesportshops:discordlog')
AddEventHandler('mfp_extremesportshops:discordlog', function(message, webhook)
sendLogs(message , webhook)
end)

-- Events
RegisterNetEvent('mfp_extremesportshops:givedivingmask', function()
    buyItem(source, 'nurek', Config.Prices.divingmask, Translation['divingmask'])
end)

RegisterNetEvent('mfp_extremesportshops:selldivingmask', function()
    sellItem(source, 'nurek', Config.Prices.divingmask * Config.sellPercentage, Translation['divingmask'])
end)

RegisterNetEvent('mfp_extremesportshops:buyparachute', function()
    buyWeapon(source, 'GADGET_PARACHUTE', Config.Prices.parachute, Translation['parachute'])
end)

RegisterNetEvent('mfp_extremesportshops:sellparachute', function()
    sellWeapon(source, 'GADGET_PARACHUTE', Config.Prices.parachute * Config.sellPercentage, Translation['parachute'])
end)