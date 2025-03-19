-- Functions
function sendLogs (message,webhook)
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ content = message }), { ['Content-Type'] = 'application/json' })
end

function buyItem(source, item, price, itemLabel)
    local xPlayer = getPlayer(source)
    if not xPlayer then return end

    if hasMoney(xPlayer, price) then
        removeMoney(xPlayer, price)
        addItem(xPlayer, item, 1)
        notifyClient(xPlayer, Translation['dealer'], Translation['buy'], (Translation['buy_true']):format(itemLabel, price), 'CHAR_JOSEF', 9)
        logToDiscord("Kauf", xPlayer, "Gekauft", itemLabel, price)
    else
        notifyClient(xPlayer, Translation['dealer'], Translation['buy'], (Translation['buy_false']):format(price), 'CHAR_JOSEF', 7)
    end
end

function sellItem(source, item, price, itemLabel)
    local xPlayer = getPlayer(source)
    if not xPlayer then return end

    if hasItem(xPlayer, item) then
        addMoney(xPlayer, price)
        removeItem(xPlayer, item, 1)
        notifyClient(xPlayer, Translation['dealer'], Translation['sell'], (Translation['sell_true']):format(itemLabel, price), 'CHAR_JOSEF', 7)
        logToDiscord("Verkauf", xPlayer, "Verkauft", itemLabel, price)
    else
        notifyClient(xPlayer, Translation['dealer'], Translation['sell'], (Translation['sell_false']):format(itemLabel), 'CHAR_JOSEF', 7)
    end
end

function buyWeapon(source, weapon, price, weaponLabel)
    local xPlayer = getPlayer(source)
    if not xPlayer then return end

    if hasWeapon(xPlayer, weapon) then
        notifyClient(xPlayer, Translation['dealer'], Translation['buy'], (Translation['already_has_it_fail']):format(weaponLabel), 'CHAR_JOSEF', 7)
    else
        if hasMoney(xPlayer, price) then
            removeMoney(xPlayer, price)
            addWeapon(xPlayer, weapon)
            notifyClient(xPlayer, Translation['dealer'], Translation['buy'], (Translation['buy_true']):format(weaponLabel, price), 'CHAR_JOSEF', 9)
            logToDiscord("Kauf", xPlayer, "Gekauft", weaponLabel, price)
        else
            notifyClient(xPlayer, Translation['dealer'], Translation['buy'], (Translation['buy_false']):format(price), 'CHAR_JOSEF', 7)
        end
    end
end

function sellWeapon(source, weapon, price, weaponLabel)
    local xPlayer = getPlayer(source)
    if not xPlayer then return end

    if hasWeapon(xPlayer, weapon) then
        addMoney(xPlayer, price)
        removeWeapon(xPlayer, weapon)
        notifyClient(xPlayer, Translation['dealer'], Translation['sell'], (Translation['sell_true']):format(weaponLabel, price), 'CHAR_JOSEF', 9)
        logToDiscord("Verkauf", xPlayer, "Verkauft", weaponLabel, price)
    else
        notifyClient(xPlayer, Translation['dealer'], Translation['sell'], (Translation['sell_false']):format(weaponLabel), 'CHAR_JOSEF', 7)
    end
end