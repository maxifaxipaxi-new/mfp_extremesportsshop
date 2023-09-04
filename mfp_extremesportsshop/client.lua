--ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-----------------------------------
_menuPool = NativeUI.CreatePool()
local mainMenu
local fallschirmMenu
local tauchermaskenMenu

Citizen.CreateThread(function()
    while true do

        _menuPool:ProcessMenus()

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
		for k,v in pairs(Config.ShopLocations) do
			if GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true) < 1.5 then
		ShowInputNotification(Translation[Config.Locale]['open_menu']) end
        if IsControlJustReleased(0, 38) then
		if GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true) < 1.5 then
            
                openMenu()
            else

            end
        end end

        Citizen.Wait(1)

    end
	
end)

function openMenu()
    mainMenu = NativeUI.CreateMenu(Translation[Config.Locale]['dealer'], Translation[Config.Locale]['dealer_subtitle'])
    _menuPool:Add(mainMenu)
	
	local moneyshow = NativeUI.CreateItem(Translation[Config.Locale]['money_in_cash'], '')
    mainMenu:AddItem(moneyshow)
	
	local empty = NativeUI.CreateItem('-----------', '')
    mainMenu:AddItem(empty)

    local falschirmkauf3 = NativeUI.CreateItem(Translation[Config.Locale]['parachute'], Translation[Config.Locale]['parachute_subtitle']) -- 'Fallschirm', 'Kaufen Sie einen ~o~Fallschirm~s~ und heben Sie ab.'
    mainMenu:AddItem(falschirmkauf3)
	
	local tauchermaskenkauf3 = NativeUI.CreateItem(Translation[Config.Locale]['divingmask'], Translation[Config.Locale]['divingmask_subtitle']) -- 'Tauchermaske', 'Kaufen Sie eine ~b~Tauchermaske~s~ und erkunden Sie Gewässer.'
    mainMenu:AddItem(tauchermaskenkauf3)
	
    ESX.TriggerServerCallback('mfp_extremesportshops:getMoney', function(money)
	   moneyshow:RightLabel('~g~$' .. money .. ',00')
	end)
	
    falschirmkauf3:RightLabel('→')
	tauchermaskenkauf3:RightLabel('→')


    falschirmkauf3.Activated = function(sender, index)
        
		mainMenu:Visible(false)
		openFallschirm()
		
		
    end
	tauchermaskenkauf3.Activated = function(sender, index)
        
		mainMenu:Visible(false)
		openTauchermasken()
		
		
    end
	

    mainMenu:Visible(true)

    _menuPool:MouseEdgeEnabled(false)
end

function openFallschirm()
    fallschirmMenu = NativeUI.CreateMenu(Translation[Config.Locale]['parachute'], Translation[Config.Locale]['buyorsell'])
    _menuPool:Add(fallschirmMenu)

    local falschirmkauf = NativeUI.CreateItem(Translation[Config.Locale]['buy'], '')
    fallschirmMenu:AddItem(falschirmkauf)
	
	local falschirmkauf2 = NativeUI.CreateItem(Translation[Config.Locale]['sell'], '')
    fallschirmMenu:AddItem(falschirmkauf2)
	
    local price = Price['parachute_price']
	local sellprice = Price['parachute_sellprice']
    falschirmkauf:RightLabel(('~g~%s$'):format(price))
	falschirmkauf2:RightLabel(('~r~%s$'):format(sellprice))


    falschirmkauf.Activated = function(sender, index)
        
		TriggerServerEvent('mfp_extremesportshops:buyparachute')
		
		
    end
	falschirmkauf2.Activated = function(sender, index)
        
		TriggerServerEvent('mfp_extremesportshops:sellparachute')
		
		
		
    end
	

    fallschirmMenu:Visible(true)

    _menuPool:MouseEdgeEnabled(false)
end


function openTauchermasken()
    tauchermaskenMenu = NativeUI.CreateMenu(Translation[Config.Locale]['divingmask'], Translation[Config.Locale]['buyorsell'])
    _menuPool:Add(tauchermaskenMenu)
	
    local tauchermaskenkauf2 = NativeUI.CreateItem(Translation[Config.Locale]['buy'], '')
    tauchermaskenMenu:AddItem(tauchermaskenkauf2)
	
	local tauchermaskenkauf = NativeUI.CreateItem(Translation[Config.Locale]['sell'], '')
    tauchermaskenMenu:AddItem(tauchermaskenkauf)
	
    local price = Price['divingmask_price']
	local sellprice = Price['divingmask_sellprice']
    tauchermaskenkauf2:RightLabel(('~g~%s$'):format(price))
	tauchermaskenkauf:RightLabel(('~r~%s$'):format(sellprice))


    tauchermaskenkauf2.Activated = function(sender, index)
        
		TriggerServerEvent('mfp_extremesportshops:givedivingmask')
		
		
    end
	tauchermaskenkauf.Activated = function(sender, index)
        
		TriggerServerEvent('mfp_extremesportshops:selldivingmask')
		
		
		
    end
	

    tauchermaskenMenu:Visible(true)

    _menuPool:MouseEdgeEnabled(false)
end



function ShowInputNotification(text)
	SetTextComponentFormat('STRING')
	AddTextComponentString(text)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end

Citizen.CreateThread(function()
    for k in pairs(Config.Npc) do
       RequestModel(GetHashKey("a_m_y_surfer_01"))
       while not HasModelLoaded(GetHashKey("a_m_y_surfer_01")) do
         Citizen.Wait(1)
       end
       local ped =  CreatePed(4, GetHashKey("a_m_y_surfer_01"), Config.Npc[k].x, Config.Npc[k].y, Config.Npc[k].z, Config.Npc[k].h, false, true)
       TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, 1)
       FreezeEntityPosition(ped, true)
       SetEntityHeading(ped, Config.Npc[k].h, true)
       SetEntityInvincible(ped, true)
       SetBlockingOfNonTemporaryEvents(ped, true)
    end
end)

RegisterNetEvent('mfp_extremesportshops:usedivingmask')
AddEventHandler('mfp_extremesportshops:usedivingmask', function(source)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.mask_1 == 0 then 

		local clothesSkin = {
		['glasses_1'] = 26, ['glasses_2'] = 0,
		['mask_1'] = 36, ['mask_2'] = 0 
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		ESX.ShowHelpNotification(Translation[Config.Locale]['eqiuped_divingmask'])

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

end)