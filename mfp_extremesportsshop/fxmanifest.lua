fx_version 'bodacious'
game 'gta5'
  
description 'mfp_extremesportsshop | Native UI'
author 'MFPSCRIPTS'
version 'OPENSOURCE - 1.2.1'
lua54 'yes'

escrow_ignore {
	'config.lua',
	'client.lua',
	'server.lua',
  'server_opensource'
}  
client_scripts {
  '@NativeUI/NativeUI.lua', -- enable if you're using NativeUI
  --'@NativeUILua_Reloaded/src/NativeUIReloaded.lua', -- enable if you're using NativeUI Reloaded
  'config.lua',
  'client.lua'
}

server_scripts {
  'config.lua',
  'server.lua',
   'server_opensource.lua'
}

-- visit mfpscripts.com for more! --