local function loadTranslation(locale)
    local file = ('locales/%s.lua'):format(locale)
    local translation = LoadResourceFile(GetCurrentResourceName(), file)

    if translation then
        local func, err = load(translation)
        if func then
            print("^3[INFO]^7: Loaded langauge: "..locale)
            return func()
        else
            print("^1[ERROR] Failed to load locale '" .. locale .. "': " .. err .. "^0")
        end
    else
        print("^1[ERROR] Locale '" .. locale .. "' not found! Default: English loaded.^0")
    end

    -- Lade Fallback-Sprache
    local fallbackFile = 'locales/en.lua'
    local fallbackTranslation = LoadResourceFile(GetCurrentResourceName(), fallbackFile)

    if fallbackTranslation then
        local fallbackFunc, fallbackErr = load(fallbackTranslation)
        if fallbackFunc then
            return fallbackFunc()
        else
            print("^1[ERROR] Failed to load default locale: " .. fallbackErr .. "^0")
        end
    else
        print("^1[ERROR] Default locale file missing! Check your locales folder.^0")
    end

    return {} -- Falls alles fehlschlägt, gib eine leere Tabelle zurück
end

Translation = loadTranslation(Config.Locale)
