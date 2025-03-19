fx_version "cerulean"
game "gta5"
lua54 "yes"
use_experimental_fxv2_oal "yes"

name "MFP_EXTREMESPORTSHOP"
author "MFPSCRIPTS"
description "Sportshop for FiveM, works with ESX, QBCore or Custom Framework."
version "2.0.0"

shared_script {
    "config/*.lua",
    "bridge/frameworks.lua",
    "translate.lua"
}

client_script {
    "@NativeUI/NativeUI.lua",
    --"@NativeUILua_Reloaded/src/NativeUIReloaded.lua", -- enable if you're using NativeUI Reloaded
    "bridge/**/client.lua",
    "client/*.lua"
}

server_script {
    "@mysql-async/lib/MySQL.lua",
    "bridge/**/server.lua",
    "server/*.lua"
}

files {
    "locales/*.lua"
}

escrow_ignore {
    "bridge/**/*.lua",
    "config/**/*.lua"
}
