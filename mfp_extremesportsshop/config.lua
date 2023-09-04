Config = {}
Translation = {}
Price = {}


Config.Locale = 'en' -- 'en' for english, 'de' for german

Dicordlogging = false -- type true to enable it!
DiscordWebhook = {
        ['webhook'] = '',
    }

Config.ShopLocations = {
{ ['x'] = -1351.53,  ['y'] = -1128.42,  ['z'] = 3.11} -- more possible
}

Config.Npc = { -- coords to add more npc's dealers you want
   { ['x'] = -1351.53, ['y'] = -1128.42, ['z'] = 3.11, ['h'] = 57.61}, -- more possible

}

Price = {

        ['parachute_price'] = 1000,
		['parachute_sellprice'] = 500,
		['divingmask_price'] = 300,
		['divingmask_sellprice'] = 120
    }
	
Translation = {
    ['de'] = {
        ['open_menu'] = 'Drücke ~o~E~s~ um mit dem Händler zu reden',
		['weapon_menu_item_label'] = '~g~Kaufen ~s~oder ~r~Verkaufen~s~ Sie diese Ware.',
		--- HAUPTMENU
		['dealer'] = 'Händler',
		['dealer_subtitle'] = 'Dealer des Vertrauens',
		['parachute'] = 'Fallschirm',
		['parachute_subtitle'] = 'Kaufen oder Verkaufen Sie ~o~Drogen~s~.',
	    ['divingmask'] = 'Tauchermaske',
	    ['divingmask_subtitle'] = 'Kaufen oder Verkaufen Sie ~o~Schießeisen~s~.',
		--------------------------------------
		['buy'] = 'Kaufen',
		['sell'] = 'Verkaufen',
		['money_in_cash'] = '~g~Bargeld',
		----------------------------------------
		['eqiuped_divingmask'] = 'Tauchermaske wurde aufgesetzt und passt wie angegossen!',
		['already_has_it_fail'] = 'Du hast bereits einen ~b~%s~s~ bei mir gekauft!',
		['sell_true'] = 'Du verkaufst ~b~%s~s~ an mich wieder für ~o~$%s,00~s~',
		['buy_true'] = 'Du kaufst ~b~%s~s~ für ~g~$%s,00~s~',
		['sell_false'] = '~r~Du kannst keine/-n %s verkaufen, wenn du keine hast!',
		['buy_false'] = 'Du kannst dir dies ~r~nicht~s~ leisten. Es werden ~r~$%s,00~s~ benötigt!',
    },

    ['en'] = {
        ['open_menu'] = 'Press ~o~E~s~, to talk with the dealer',
		['weapon_menu_item_label'] = '~g~Buy~s~ or ~r~sell ~s~this ware.',
		--- MAIN MENU
		['dealer'] = 'Dealer',
		['dealer_subtitle'] = 'Dealer of extremesport things',
		['parachute'] = 'Parachute',
		['parachute_subtitle'] = 'Buy or sell ~o~Parachutes~s~.',
	    ['divingmask'] = 'Divingmask',
	    ['divingmask_subtitle'] = 'Buy or sell ~b~Divingmasks~s~.',
		--------------------
		['buy'] = 'Buy',
		['sell'] = 'Sell',
		['buyorsell'] = 'Buy or sell this ware!',
		['money_in_cash'] = '~g~Cash',
		------------------------
		['eqiuped_divingmask'] = 'Successfully equiped your divingmask!',
		['already_has_it_fail'] = 'You already bought an ~b~%s~s~ at me!',
		['sell_true'] = 'You sell ~b~%s~s~ to me for ~o~$%s,00~s~',
		['buy_true'] = 'You buy ~b~%s~s~ for ~g~$%s,00~s~',
		['sell_false'] = '~r~You can not sell %s if you do not have any!',
		['buy_false'] = 'You can ~r~not~s~ afford this. ~r~$%s,00~s~ are needed!',
    },
}