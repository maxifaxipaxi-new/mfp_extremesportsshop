if Config.Framework == "auto" then
    if GetResourceState("es_extended") ~= "missing" then
        Config.Framework = "esx"
        print("^3[INFO]^7: Loaded framework: es_extended")
    elseif GetResourceState("qb-core") ~= "missing" then
        Config.Framework = "qb-core"
		print("^3[INFO]^7: Loaded framework: qb-core")
    else
        print("^3[WARNING]^7: Failed to automatically set framework. Please set it manually in mfp_extremesportshop/config/config.lua.")
        Config.Framework = "custom"
    end
end
