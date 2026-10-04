local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('mechanicupgradesystem:getUpgrades', function(source, cb, plate)
    MySQL.query('SELECT component, variant FROM vehicle_upgrades WHERE plate = ?', {plate}, function(result)
        local upgrades = {}
        for _, row in ipairs(result) do
            upgrades[row.component] = row.variant
        end
        cb(upgrades)
    end)
end)

QBCore.Functions.CreateUseableItem('mechanic_toolkit', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent('mechanicupgradesystem:useToolkit', source)
    end
end)