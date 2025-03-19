if Config.Framework ~= "custom" then
    return
end

function Notify(text, errType)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandThefeedPostTicker(true, true)
end

CreateThread(function()
    while not NetworkIsSessionStarted() do
        Wait(500)
    end

    Loaded = true
end)

--------------------------------------------
-- custom/client.lua

function getCurrentMoney(source)
    -- implement callback for your framework at server.lua getMoney Function
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