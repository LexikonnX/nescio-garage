ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("nescio-garage:list", function(source, cb, garage)
    local xPlayer = ESX.GetPlayerFromId(source)
    local vehList = {}

    MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner = @idf AND impound = 3 AND ngarage = @garage", {
        ["@idf"] = xPlayer.identifier,
        ["@garage"] = garage
    }, function(results)
        for k,v in pairs(results) do
            local vehicle = json.decode(v.vehicle)
            table.insert(vehList, { vehicle = vehicle, plate = v.plate })
        end
        cb(vehList)
    end)
end)

RegisterServerEvent("nescio-garage:parkout")
AddEventHandler("nescio-garage:parkout", function(plate)
    local plt = plate:upper()
    MySQL.Async.execute("UPDATE owned_vehicles SET impound = 0, ngarage = null WHERE plate = @plate", {
        ["@plate"] = plt
    })
end)

RegisterServerEvent("nescio-garage:park")
AddEventHandler("nescio-garage:park", function(plate, garage)
    local plt = plate:upper()
    MySQL.Async.execute("UPDATE owned_vehicles SET impound = 3, ngarage = @garage WHERE plate = @plate", {
        ["@plate"] = plt,
        ["@garage"] = garage
    })
end)
