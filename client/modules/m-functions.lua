function DrawTxt(coords, text, size, font)
    local coords = vector3(coords.x, coords.y, coords.z)

    local camCoords = GetGameplayCamCoords()
    local distance = #(coords - camCoords)

    if not size then size = 1 end
    if not font then font = 0 end

    local scale = (size / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov

    SetTextScale(0.0 * scale, 0.55 * scale)
    SetTextFont(font)
    SetTextColour(255, 255, 255, 215)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(true)

    SetDrawOrigin(coords, 0)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

function GangMission()
    for k,v in pairs(Config.Gangs) do
        random = math.random(1, #Config.Routes)
        SetNewWaypoint(Config.Routes[random].x, Config.Routes[random].y)
        while true do
            Wait(0)
            local letSleep = true
            local _pid = PlayerPedId()
            local _coords = GetEntityCoords(_pid)
            local _dist = #(_coords - Config.Routes[random]) < 3

            if _dist then
                letSleep = false
                DrawTxt(Config.Routes[random], '~b~ROUTE~s~\nPress ~b~E~s~ to view available routes', 0.8)
                if IsControlJustPressed(0, 38) then
                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mission_weapons', {
                        title = 'Heavy weapons',
                        align = 'bottom-right',
                        elements = v.MissionWeapons
                    }, function(data, menu)
                        menu.close()

                        TriggerServerEvent('c-gangs:buyMissionWeapons', data.current.mweapon, data.current.mprice)
                    end, function(data, menu)
                        menu.close()
                    end)
                end
                if letSleep then Wait(1000) end
            end
        end
    end
end