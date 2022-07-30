ESX = exports['es_extended']:getSharedObject()

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(0)
    end

    Wait(1000)

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    Thread()
end)

RegisterNetEvent('onResourceStart', function(xRes)
    if xRes == GetCurrentResourceName() then
        ESX.PlayerData = ESX.GetPlayerData()
        Thread()
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function()
    ESX.PlayerData = ESX.GetPlayerData()
end)

Thread = function()
    while true do
        Wait(0)

        local found = true

        if ESX.PlayerData.job ~= nil then
            
            for k,v in pairs(Config.Gangs) do

                if ESX.PlayerData.job.name == v.JobName then

                    local coords = GetEntityCoords(PlayerPedId())

                    local ped = PlayerPedId()

                    if #(coords - v.Garage) < Config.DrawDistance then 
                        found = false
                        DrawMarker(1, v.Garage, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                        DrawTxt(v.Garage+vec3(0,0,1), "Garage \n ~b~Two models available~s~", 0.8, 0)
                        if IsControlJustPressed(0, 38) then
                            
                            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'garage_', {
                                title = 'Garage',
                                align = 'bottom-right',
                                elements = v.GarageMenu

                            }, function(data, menu)
                                menu.close()

                                if ESX.Game.IsSpawnPointClear(v.SpawnVehicle, 5) then

                                    ESX.Game.SpawnVehicle(data.current.model, v.SpawnVehicle, v.Heading, function(veh)
                                        SetVehicleCustomPrimaryColour(veh, v.VehicleSpawnColor.r, v.VehicleSpawnColor.g, v.VehicleSpawnColor.b)
                                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                                        SetVehicleNumberPlateText(veh, v.PlateText)
                                        SetVehicleDirtLevel(veh, 0.0)
                                        ESX.ShowNotification('You have taken out a ~g~'..data.current.model..'~s~ of the ~g~garage')
                                    end)
                                else
                                    ESX.ShowNotification('~r~A car is blocking the exit')
                                end
                            end, function(data, menu)
                                menu.close()
                            end)
                        end
                    end

                    if #(coords - v.DeleteVehicle) < Config.DrawDistance and IsPedInAnyVehicle(ped) then 
                        found = false
                        DrawMarker(1, v.DeleteVehicle, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                        DrawTxt(v.DeleteVehicle+vec3(0,0,1), 'Delete vehicle', 0.8, 0)
                        if IsControlJustPressed(0, 38) then
                            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                            if veh ~= nil then
                                ESX.ShowNotification('You have deleted a ~g~'..GetDisplayNameFromVehicleModel(GetEntityModel(veh))..'~s~')
                                SetEntityAsMissionEntity(veh, true, true)
                                DeleteVehicle(veh)
                            else
                                ESX.ShowNotification('You are not in a vehicle')
                            end
                        end
                    end

                    if #(coords - v.Armory) < Config.DrawDistance then
                        found = false
                        DrawMarker(1, v.Armory, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                        DrawTxt(v.Armory+vec3(0,0,1), 'Armory', 0.8, 0)
                        if IsControlJustPressed(0, 38) then
                            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_', {
                                title = 'Armory',
                                align = 'bottom-right',
                                elements = v.ArmoryMenu
                            }, function(data, menu)
                                menu.close()

                                TriggerServerEvent('c-gangs:buyWeapon', data.current.weapon, data.current.price)
                            end, function(data, menu)
                                menu.close()
                            end)
                        end
                    end

                    if #(coords - v.Shop) < Config.DrawDistance then
                        found = false
                        DrawMarker(1, v.Shop, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                        DrawTxt(v.Shop+vec3(0,0,1), 'Shop', 0.8, 0)
                        if IsControlJustPressed(0, 38) then
                            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_', {
                                title = 'Shop',
                                align = 'bottom-right',
                                elements = v.ShopMenu
                            }, function(data, menu)
                                menu.close()

                                TriggerServerEvent('c-gangs:buyItem', data.current.item, data.current.price)
                            end, function(data, menu)
                                menu.close()
                            end)
                        end
                    end

                    if #(coords - v.GangInfo) < Config.DrawDistance then
                        found = false
                        DrawMarker(1, v.GangInfo, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                        DrawTxt(v.GangInfo+vec3(0,0,1), 'Gang info', 0.8, 0)
                        if IsControlJustPressed(0, 38) then

                            local elements = {}
                            
                            table.insert(elements, {label = 'Gang name: '..v.GangName, value = 'gang_name'})
                            table.insert(elements, {label = 'Gang owner: '..v.GangOwner, value = 'gang_owner'})
                            

                            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_', {
                                title = 'Gang info',
                                align = 'bottom-right',
                                elements = elements
                            }, function(data, menu)
                                menu.close()
                            end, function(data, menu)
                                menu.close()
                            end)
                        end
                    end

                    if #(coords - v.BossActions) < Config.DrawDistance then
                        found = false
                        DrawMarker(1, v.BossActions, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                        DrawTxt(v.BossActions+vec3(0,0,1), 'Boss menu', 0.8, 0)
                        if IsControlJustPressed(0, 38) then
                            TriggerEvent(Config.Triggers.OpenBossMenu, v.Society_Name, function(data, menu)
                                menu.close()
                            end, {wash = v.WashMoney})
                        end
                    end
                    
                    if Config.EnabledGangMissions then
                        if #(coords - v.GangMission) < Config.DrawDistance then
                            found = false
                            DrawMarker(1, v.GangMission, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                            DrawTxt(v.GangMission+vec3(0,0,1), 'Gang mission', 0.8, 0)
                            if IsControlJustPressed(0, 38) then
                                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_mission_', {
                                    title = 'Gang mission',
                                    align = 'bottom-right',
                                    elements = v.GangMissionMenu
                                }, function(data, menu)
                                    menu.close()

                                    if data.current.value == 'traficar' then
                                        if ESX.Game.IsSpawnPointClear(v.MissionCarSpawn, 5) then
                                            ESX.Game.SpawnVehicle('burrito', v.MissionCarSpawn, 303.30, function(veh)
                                                ESX.ShowNotification('Welcome, go to the route.')
                                                SetVehicleNumberPlateText(veh, Config.PlateText)
                                            end)
                                            GangMission()
                                        else
                                            ESX.ShowNotification('~r~El punto de spawn está bloqueado')
                                        end
                                    end
                                end, function(data, menu)
                                    menu.close()
                                end)
                            end
                        end
                    end
                end
            end
        end
        if found then Wait(1000) end
    end
end