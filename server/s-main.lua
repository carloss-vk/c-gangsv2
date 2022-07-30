ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('c-gangs:buyWeapon', function(weapon, price, weaponhash)
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = price
    local weaponhash = weaponhash
    local weapon = weapon
    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        xPlayer.addWeapon(weapon, 250)
        TriggerClientEvent('esx:showNotification', source, 'Has comprado una ~g~' .. weapon .. '~s~ por ~g~$' .. price .. '~s~')
    else
        TriggerClientEvent('esx:showNotification', source, '~r~No tienes suficiente dinero~s~')
    end
end)

RegisterServerEvent('c-gangs:buyMissionWeapons', function(mweapon, mprice, weaponhash)
    local xPlayer = ESX.GetPlayerFromId(source)
    local mprice = mprice
    local weaponhash = weaponhash
    local mweapon = mweapon
    if xPlayer.getMoney() >= mprice then
        xPlayer.removeMoney(mprice)
        xPlayer.addWeapon(mweapon, 250)
        TriggerClientEvent('esx:showNotification', source, 'Has comprado una ~g~' .. mweapon .. '~s~ por ~g~$' .. mprice .. '~s~')
    else
        TriggerClientEvent('esx:showNotification', source, '~r~No tienes suficiente dinero~s~')
    end
end)

RegisterServerEvent('c-gangs:buyItem', function(item, price, itemhash)
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = price
    local itemhash = itemhash
    local item = item
    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, 'Has comprado un ~g~' .. item .. '~s~ por ~g~$' .. price .. '~s~')
    else
        TriggerClientEvent('esx:showNotification', source, '~r~No tienes suficiente dinero~s~')
    end
end)