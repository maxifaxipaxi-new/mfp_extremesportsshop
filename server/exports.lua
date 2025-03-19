-- GetSourceFromIdentifier(identifier)
exports("GetSourceFromIdentifier", GetSourceFromIdentifier) -- handled via bridge

-- GetIdentifier(source)
exports("GetIdentifier", GetIdentifier) -- handled via bridge


-- Branding (can be removed)
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print(" _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ ")
    print("|     |   __|  _  |   __|     | __  |     |  _  |_   _|   __|")
    print("| | | |   __|   __|__   |   --|    -|-   -|   __| | | |__   |")
    print("|_|_|_|__|  |__|  |_____|_____|__|__|_____|__|    |_| |_____|")
    print("The resource " .. resourceName .. " has been started")
  end)