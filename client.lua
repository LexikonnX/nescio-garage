--
--  ####    ####   #####    ####    ####   #### 
-- #    #  #    #  #    #  #    #  #    #  #    
-- #       #    #  #    #  #    #  #       #     
-- #  ###  ######  ####    ######  #  ###  ###
-- #    #  #    #  #   #   #    #  #    #  #   
--  ####   #    #  #    #  #    #   ####   #### 
-- 
-- by 
--
-- #   ####  #   #  #  #  #   ##   #   #  #   #
-- #   #      # #   #  # #   #  #  ##  #  ##  #
-- #   ##      #    #  ##    #  #  # # #  # # #
-- #   #      # #   #  # #   #  #  #  ##  #  ##
-- ### ####  #   #  #  #  #   ##   #   #  #   #
--
--
--
-- Texts
local cars_in_garage = "Vehicles in the garage"
local GarageBlipText = "Garage"
local park_here = "Park the vehicle in the garage"
local access_denied = "You do not have access here"
local vehicle_is_parked = "The vehicle is parked!"
local OpenGarageTitle = "List of parked vehicles in the garage  "
local TakeTheVehicle = "Take the vehicleo"
local vehicle = "Vehicle "
local YouAreInVehicle = "You are in the vehicle"

-- All garages:
-- name = The name of the garage in the database
-- pos = Garage position
-- label = The displayed name of the garage
-- heading = Spawn heading
-- job = If the garage is public, write job=""
-- marker = Marker type (1 = cylinder, 20 = arrow, 21 = double arrow, 22 = triple arrow, 33 = plane, 34 = helicopter, 35 = boat, 36 = car, 37 = motorcycle, 38 = bike, 39 = tir) All markers: https://docs.fivem.net/docs/game-references/markers/
-- showMarker = If marker is visible
-- color = set RGB of marker
-- blip = If blip is visible
local allGarages = {
    {name = "lspd1", pos = vector3(463.5, -1015.2, 28.07), label = "LSPD", heading = 88.89, job = "police", marker = 36, showMarker = true, color = {r = 0, g = 0, b = 255}, blip = true},
    {name = "lspd2", pos = vector3(539.51, -41.87, 70.8), label = "LSPD", heading = 217.88, job = "police", marker = 36, showMarker = true, color = {r = 0, g = 0, b = 255}, blip = false},
    {name = "sanandreasave1", pos = vector3(-39.8225, -712.533, 32.05), label = "San Andreas Ave", heading = 156.46, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "sanandreasave1", pos = vector3(-24.09, -718.7090, 32.05), label = "San Andreas Ave", heading = 156.46, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false},
    {name = "sanandreasave1", pos = vector3(-9.305, -723.96, 32.05), label = "San Andreas Ave", heading = 156.46, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false},
    {name = "hospital", pos = vector3(340.38, -560.574, 28.743), label = "Nemocnice Strawberry Ave", heading = 349.105, job = "ambulance", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "hospital", pos = vector3(330.1947, -556.8505, 28.743), label = "Nemocnice Strawberry Ave", heading = 349.105, job = "ambulance", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false},
    {name = "hawickave1", pos = vector3(457.8745, -283.71, 48.66), label = "Hawick Ave", heading = 154.27, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "altast1", pos = vector3(22.2634, -210.94, 52.85), label = "Alta St", heading = 252.0, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "elginave", pos = vector3(502.32, -105.7, 62.32), label = "Elgin Ave", heading = 247.0, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "elginave", pos = vector3(505.11, -98.8, 62.57), label = "Elgin Ave", heading = 247.0, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false},
    {name = "army1", pos = vector3(-2426.97, 3309.222, 32.9777), label = "Great Ocean Hwy", heading = 232.15, job = "army", marker = 36, showMarker = true, color = {r = 100, g = 255, b = 255}, blip = true},
    {name = "army1", pos = vector3(-2429.4006, 3304.761, 32.97), label = "Great Ocean Hwy", heading = 232.15, job = "army", marker = 36, showMarker = true, color = {r = 100, g = 255, b = 255}, blip = false},
    {name = "vespucciblvd1", pos = vector3(-580.7171, -823.79, 26.36), label = "Vespucci Blvd", heading = 180.33, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "gingerst", pos = vector3(-575.2, -587.6, 25.3), label = "Ginger St", heading = 353.7, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "lsfreeway", pos = vector3(465.99, -578.76, 28.46), label = "LS Freeway", heading = 167.4, job = "busdriver", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "sanandreasave2", pos = vector3(-516.04, -622.3, 25.3), label = "San Andreas Ave", heading = 272.8, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "littlebighorn", pos = vector3(486.68, -916.3, 26.2), label = "Little Bighorn Ave", heading = 268.205, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "palomino1", pos = vector3(-618.7, -738.34, 27.7), label = "Palomino Ave", heading = 82.94, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "palomino1", pos = vector3(-618.7, -731.9, 27.7), label = "Palomino Ave", heading = 82.94, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false},
    {name = "calaisave", pos = vector3(-504.7, -739.8, 32.5), label = "Calais Ave", heading = 177.3, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "palominoave", pos = vector3(-663.1, -721.36, 27.1), label = "Palomino Ave", heading = 266.3, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "palominoave", pos = vector3(-670.8, -724.41, 26.9), label = "Palomino Ave", heading = 270.06, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false},
    {name = "vespucciblvd2", pos = vector3(-667.81, -853.41, 23.85), label = "Vespucci Blvd", heading = 0.9, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "vespucciblvd", pos = vector3(-786.6, -805.5, 20.6), label = "Vespucci Blvd", heading = 177.1, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "deckerst", pos = vector3(-816.1, -745.8, 23.4), label = "Decker St", heading = 180.7, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "gingerst", pos = vector3(-798.3, -983.3, 13.9), label = "Ginger St", heading = 215.33, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "southrockforddr", pos = vector3(-895.5, -985.2, 2.1), label = "South Rockford Dr", heading = 313.7, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "morningwood", pos = vector3(-1298.89, -383.39, 36.5), label = "Morningwood Blvd", heading = 302.0, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "morningwood", pos = vector3(-1301.89, -378.05, 36.5), label = "Morningwood Blvd", heading = 302.0, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false},
    {name = "equality", pos = vector3(-1609.74, -822.7, 10.04), label = "Equality Way", heading = 318.9, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "southrockforddr1", pos = vector3(-906.6, -967.2, 2.1 ), label = "South Rockford Dr", heading = 104.8, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "southrockforddr2", pos = vector3(-920.3, -950.9, 2.1), label = "South Rockford Dr", heading = 294.7, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "southrockforddr3", pos = vector3(-942.6, -912.3, 2.1), label = "South Rockford Dr", heading = 297.7, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "vespucciblvd3", pos = vector3(-949.6, -899.7, 2.1), label = "Vespucci Blvd", heading = 294.7, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "inventionct", pos = vector3(-936.7, -1076.6, 2.1), label = "Invention Ct", heading = 202.8, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "prosperityst", pos = vector3(-1022.9, -1132.5, 2.1), label = "Prosperity St", heading = 204.3, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "baycityave", pos = vector3(-1117.8, -1223.7, 2.5), label = "Bay City Ave", heading = 122.5, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "barbareno", pos = vector3(-3237.08, 1034.22, 11.27), label = "Barbareno Rd", heading = 264.012, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "greatoceanhwy", pos = vector3(-2214.90917, 4239.64208, 47.036), label = "Great Ocean Hwy", heading = 37.21, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "morningwoodblvd", pos = vector3(-1322.6, -238.5, 42.6), label = "Morningwood Blvd", heading = 301.9, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "boulevarddelperro", pos = vector3(-1224.9, -263.3, 38.5), label = "Boulevard Del Perro", heading = 298.03, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "duluoz", pos = vector3(-278.836, 6170.031, 31.08), label = "Duluoz Ave", heading = 291.3, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "magellanave", pos = vector3(-1126.5, -1471.1, 4.6), label = "Magellan Ave", heading = 215.4, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "sandcastleway", pos = vector3(-1438.4, -884.6, 10.7 ), label = "Sandcastle Way", heading = 158.9, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "westeclipseblvd", pos = vector3(-1818.01, -328.1, 43.2 ), label = "West Eclipse Blvd", heading = 325.7, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true},
    {name = "spanish", pos = vector3(-443.53, 140.38, 64.3), label = "Spanish Ave", heading = 177.94, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true}
}






--------------------- DON'T EDIT THIS IF YOU DON'T KNOW WHAT YOU'RE DOING -------------------------
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(0)
    for i=1,#allGarages do
        if allGarages[i].blip == true then
            blip = AddBlipForCoord(allGarages[i].pos.x, allGarages[i].pos.y, allGarages[i].pos.z)
            SetBlipSprite(blip, 326)
            SetBlipScale(blip, 0.9)
            SetBlipColour(blip, 44)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(GarageBlipText)
            EndTextCommandSetBlipName(blip)
        end
    end
end)

CreateThread(function()
    while true do
        PlayerData = ESX.GetPlayerData()
        LSPDGarage = vector3(463.5, -1015.2, 28.07)
        coords = GetEntityCoords(PlayerPedId())
        onFoot = IsPedOnFoot(PlayerPedId())
        Citizen.Wait(0)
    end
end)

CreateThread(function()
    while true do   
        Citizen.Wait(0)
        for i=1,#allGarages do
            local distance = #(coords-allGarages[i].pos)
            if distance <= 20 then
                if allGarages[i].showMarker == true then
                    DrawMarker(allGarages[i].marker, allGarages[i].pos.x, allGarages[i].pos.y, allGarages[i].pos.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, allGarages[i].color.r, allGarages[i].color.g, allGarages[i].color.b, 100, false, true, 0, false)
                end
                if distance <= 1.5 then
                    if onFoot then
                        ESX.ShowHelpNotification("~INPUT_CONTEXT~ "..cars_in_garage.." "..allGarages[i].label)
                        if IsControlJustReleased(0, 38) then
                            if allGarages[i].job ~= "" then
                                if PlayerData.job.name == allGarages[i].job then
                                    OpenGarage(allGarages[i].name, allGarages[i].pos, allGarages[i].heading, allGarages[i].label)
                                else
                                    ESX.ShowNotification(access_denied)
                                end
                            else
                                OpenGarage(allGarages[i].name, allGarages[i].pos, allGarages[i].heading, allGarages[i].label)
                            end
                        end
                    else
                        ESX.ShowHelpNotification("~INPUT_CONTEXT~ "..park_here.." "..allGarages[i].label)
                        if IsControlJustReleased(0, 38) then
                            if allGarages[i].job ~= "" then
                                if PlayerData.job.name == allGarages[i].job then
                                    TriggerServerEvent("nescio-garage:park", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId())), allGarages[i].name)
                                    ESX.ShowNotification(vehicle_is_parked)
                                    Citizen.Wait(100)
                                    DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                                else
                                    ESX.ShowNotification(access_denied)
                                end
                            else
                                TriggerServerEvent("nescio-garage:park", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId())), allGarages[i].name)
                                ESX.ShowNotification(vehicle_is_parked)
                                Citizen.Wait(100)
                                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            end
                        end
                    end
                end
            end
        end
    end
end)

function OpenGarage(garageName, garagePos, h, garageLabel)
    local elements = {}
    ESX.TriggerServerCallback("nescio-garage:list", function(vehList)
        for k,v in pairs(vehList) do
            local vehHash = v.vehicle.model
            local vehName = GetDisplayNameFromVehicleModel(vehHash)
            local vehLabel = GetLabelText(vehName)
            table.insert(elements, { label = v.plate, name = vehName, value = v, plate = v.plate, vehicle = v.vehicle })
        end
        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "ListGarage", {
            title = OpenGarageTitle..garageLabel,
            align = "right",
            elements = elements
        }, function(data, menu)
            OpenVehicleInfoDisplay(data.current, garagePos, h)
            menu.close()
        end, function(data, menu)
            menu.close()
        end)
    end, garageName)
end

function OpenVehicleInfoDisplay(info, pos, head)
    local elements = {
        {label = TakeTheVehicle, value = info.value}
    }

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "towListGarageSpawn", {
        title = vehicle..info.plate,
        align = "right",
        elements = elements
    }, function(data, menu)
        if data.current.value ~= nil then
            if not IsPedInAnyVehicle(PlayerPedId(), false) then
                SpawnSelVeh(data.current.value, pos, head)
            else
                ESX.ShowNotification(YouAreInVehicle)
            end
        end
    end, function(data, menu)
        menu.close()
        OpenGarage()
    end)
end

function SpawnSelVeh(vehicle, spawnPoint, he)
    ESX.Game.SpawnVehicle(vehicle.vehicle.model, vector3(spawnPoint.x, spawnPoint.y, spawnPoint.z), he, function(car)
        ESX.Game.SetVehicleProperties(car, vehicle.vehicle)
        TaskWarpPedIntoVehicle(PlayerPedId(), car, -1)
        Citizen.Wait(10)
        TriggerServerEvent("nescio-garage:parkout", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId())))
        ESX.UI.Menu.CloseAll()
    end)
end