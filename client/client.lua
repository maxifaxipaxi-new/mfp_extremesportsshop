-- Functions

RegisterNetEvent('mfp_extremesportshops:usedivingmask')
AddEventHandler('mfp_extremesportshops:usedivingmask', function(source)
    changeClothing()
end)

-- Menu
_menuPool = NativeUI.CreatePool()
local mainMenu
local fallschirmMenu
local tauchermaskenMenu
local debug = false

Citizen.CreateThread(function()
    while true do
        _menuPool:ProcessMenus()
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        for k, shopCoords in pairs(Config.ShopLocations) do
            local dist = #(playerCoords - shopCoords)
            if dist < 1.5 then
                ShowInputNotification(Translation['open_menu'])
                if IsControlJustReleased(0, 38) then
                    openMenu()
                end
            end
        end

        Citizen.Wait(1)
    end
end)

function openMenu()
    mainMenu = NativeUI.CreateMenu(Translation['dealer'], Translation['dealer_subtitle'])
    _menuPool:Add(mainMenu)

    local moneyshow = NativeUI.CreateItem(Translation['money_in_cash'], '')
    mainMenu:AddItem(moneyshow)

    local empty = NativeUI.CreateItem('-----------', '')
    mainMenu:AddItem(empty)

    local falschirmkauf3 = NativeUI.CreateItem(Translation['parachute'], Translation['parachute_subtitle'])
    mainMenu:AddItem(falschirmkauf3)

    local tauchermaskenkauf3 = NativeUI.CreateItem(Translation['divingmask'], Translation['divingmask_subtitle'])
    mainMenu:AddItem(tauchermaskenkauf3)

    moneyshow:RightLabel('~g~Loading...')

    getCurrentClientMoney(function(money)
        money = math.floor(money)
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
    fallschirmMenu = NativeUI.CreateMenu(Translation['parachute'], Translation['buyorsell'])
    _menuPool:Add(fallschirmMenu)

    local falschirmkauf = NativeUI.CreateItem(Translation['buy'], '')
    fallschirmMenu:AddItem(falschirmkauf)
	
	local falschirmkauf2 = NativeUI.CreateItem(Translation['sell'], '')
    fallschirmMenu:AddItem(falschirmkauf2)
	
    falschirmkauf:RightLabel(('~g~%s$'):format(Config.Prices.parachute))
	falschirmkauf2:RightLabel(('~r~%s$'):format(Config.Prices.parachute * Config.sellPercentage))

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
    tauchermaskenMenu = NativeUI.CreateMenu(Translation['divingmask'], Translation['buyorsell'])
    _menuPool:Add(tauchermaskenMenu)
	
    local tauchermaskenkauf2 = NativeUI.CreateItem(Translation['buy'], '')
    tauchermaskenMenu:AddItem(tauchermaskenkauf2)
	
	local tauchermaskenkauf = NativeUI.CreateItem(Translation['sell'], '')
    tauchermaskenMenu:AddItem(tauchermaskenkauf)
	
    tauchermaskenkauf2:RightLabel(('~g~%s$'):format(Config.Prices.divingmask))
	tauchermaskenkauf:RightLabel(('~r~%s$'):format(Config.Prices.divingmask * Config.sellPercentage))

    tauchermaskenkauf2.Activated = function(sender, index) 
		TriggerServerEvent('mfp_extremesportshops:givedivingmask')
    end
	tauchermaskenkauf.Activated = function(sender, index) 
		TriggerServerEvent('mfp_extremesportshops:selldivingmask')	
    end

    tauchermaskenMenu:Visible(true)
    _menuPool:MouseEdgeEnabled(false)
end

-- Notification
function ShowInputNotification(text)
	SetTextComponentFormat('STRING')
	AddTextComponentString(text)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end

-- NPCs
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