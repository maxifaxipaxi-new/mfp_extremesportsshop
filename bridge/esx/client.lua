if Config.Framework ~= "esx" then
    return
end

local export, ESX = pcall(function()
    return exports.es_extended:getSharedObject()
end)

if not export then
    while not ESX do
        TriggerEvent("esx:getSharedObject", function(obj)
            ESX = obj
        end)

        Wait(500)
    end
end

RegisterNetEvent("esx:playerLoaded", function(playerData)
    ESX.PlayerData = playerData
    ESX.PlayerLoaded = true
end)

function Notify(text, errType)
    ESX.ShowNotification(text, errType)
end

while not ESX.PlayerLoaded do
    Wait(500)
end

Loaded = true
---------------------------------------------

-- esx/client.lua

function getCurrentMoney(source)
    ESX.TriggerServerCallback('mfp_extremesportshops:getMoney', function(money)
        return money
    end)
    
    return 0
end

-- added to bridge if for custom script is framework needed
function changeClothing()
    if Config.SkinChangerScript == 'skinchanger' then
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin.mask_1 == 0 then 
                local clothesSkin = {
                    ['glasses_1'] = 26, ['glasses_2'] = 0,
                    ['mask_1'] = 36, ['mask_2'] = 0 
                }

                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                ShowInputNotification(Translation['eqiuped_divingmask'])
                SetPedMaxTimeUnderwater(GetPlayerPed(-1), 150.00) 
            else
    
                local clothesSkin = {
                    ['glasses_1'] = 0, ['glasses_2'] = 0,
                    ['mask_1'] = 0, ['mask_2'] = 0  
                }
                SetPedMaxTimeUnderwater(GetPlayerPed(-1), 10.00) 
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
            end
        end)
    else
        customChangeClothing()
    end
end