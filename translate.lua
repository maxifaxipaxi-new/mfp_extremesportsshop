local function loadTranslation(locale)
    local file = ('locales/%s.lua'):format(locale)
    local translation = LoadResourceFile(GetCurrentResourceName(), file)
    
    if translation then
        local func = load(translation)
        if func then
            return func()
        end
    end

    print("^1[ERROR] Locale '" .. locale .. "' not found! Default: Englisch loaded.^0")
    return loadfile('locales/en.lua')()
end

Translation = loadTranslation(Config.Locale)
