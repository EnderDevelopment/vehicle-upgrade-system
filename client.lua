local QBCore = exports['qb-core']:GetCoreObject()

local function isHoodOpen(vehicle)
    return GetVehicleDoorAngleRatio(vehicle, 4) > 0.5
end

local function applyPhysicsModifications(vehicle, upgrades)
    local performance = 1.0
    for component, variant in pairs(upgrades) do
        performance = performance * Config.Components[component].variants[variant + 1].performance
    end
    
    SetVehicleEnginePowerMultiplier(vehicle, performance)
    SetVehicleEngineTorqueMultiplier(vehicle, performance)
    SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveForce', performance)
    SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fDriveInertia', performance)
end

local function upgradeComponent(vehicle, component, variant)
    local plate = GetVehicleNumberPlateText(vehicle)
    local upgrades = {}
    
    for k, v in pairs(Config.Components) do
        upgrades[k] = 0
    end
    
    MySQL.query('SELECT component, variant FROM vehicle_upgrades WHERE plate = ?', {plate}, function(result)
        for _, row in ipairs(result) do
            upgrades[row.component] = row.variant
        end
        
        upgrades[component] = variant
        
        MySQL.update('INSERT INTO vehicle_upgrades (plate, component, variant) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE variant = ?', {plate, component, variant, variant}, function()
            applyPhysicsModifications(vehicle, upgrades)
        end)
    end)
end

local function setupTargetZones()
    for component, data in pairs(Config.Components) do
        for i, variant in ipairs(data.variants) do
            exports['qb-target']:AddTargetModel(GetHashKey('prop_mech_01'), {
                options = {
                    {
                        event = 'mechanicupgradesystem:upgrade',
                        icon = 'fas fa-wrench',
                        label = 'Upgrade ' .. component .. ' to ' .. variant.name,
                        component = component,
                        variant = i - 1
                    }
                },
                distance = 2.5
            })
        end
    end
end

RegisterNetEvent('mechanicupgradesystem:upgrade', function(data)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    
    if vehicle == 0 or not isHoodOpen(vehicle) then
        QBCore.Functions.Notify('You need to be in a vehicle with the hood open!', 'error')
        return
    end
    
    local plate = GetVehicleNumberPlateText(vehicle)
    MySQL.query('SELECT COUNT(*) as count FROM vehicle_upgrades WHERE plate = ? AND component = ?', {plate, data.component}, function(result)
        if result[1].count >= Config.AntiExploit.max_upgrades then
            QBCore.Functions.Notify('You have reached the maximum number of upgrades for this component!', 'error')
            return
        end
        
        upgradeComponent(vehicle, data.component, data.variant)
        QBCore.Functions.Notify('Upgraded ' .. data.component .. ' to ' .. Config.Components[data.component].variants[data.variant + 1].name, 'success')
    end)
end)

Citizen.CreateThread(function()
    setupTargetZones()
end)