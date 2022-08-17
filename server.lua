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

ESX.RegisterServerCallback("nescio-garage:buy", function(source, cb, garage, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        MySQL.Async.execute("INSERT INTO nesciogarage (identifier, garage) VALUES (@idf, @garage)", {
            ["@idf"] = xPlayer.identifier,
            ["@garage"] = garage
        })
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent("nescio-garage:sell")
AddEventHandler("nescio-garage:sell", function(garage, price)
    --local xPlayer = ESX.GetPlayerFromId(source)
    --xPlayer.addMoney(price)
    MySQL.Async.execute("DELETE FROM nesciogarage WHERE garage = @garage", {
        ["@garage"] = garage
    })
end)

ESX.RegisterServerCallback("nescio-garage:sell", function(source, cb, garage, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = price/2
    xPlayer.addMoney(money)
    MySQL.Async.execute("DELETE FROM nesciogarage WHERE garage = @garage", {
        ["@garage"] = garage
    })
    cb(1)
end)

ESX.RegisterServerCallback("nescio-garage:owner", function(source, cb, garage)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll("SELECT * FROM nesciogarage WHERE garage = @garage", {
        ["@garage"] = garage
    }, function(idf)
        if idf[1] ~= nil then
            local id = idf[1].identifier
          if xPlayer.identifier == id then
              cb(1)
          else
              cb(0)
          end
        else
            cb(2)
        end
    end)
end)

ESX.RegisterServerCallback("nescio-garage:lock", function(source, cb, garage, lock)
    MySQL.Async.execute("UPDATE nesciogarage SET locked = @lock WHERE garage = @garage", {
        ["@garage"] = garage,
        ["@lock"] = lock
    })
    if lock == 1 then
        cb(true)
    elseif lock == 0 then
        cb(false)
    end
end)

ESX.RegisterServerCallback("nescio-garage:islocked", function(source, cb, garage)
    MySQL.Async.fetchAll("SELECT * FROM nesciogarage WHERE garage = @garage", {
        ["@garage"] = garage
    }, function(lres)
        if lres[1].locked == 1 then
            cb(true)
        elseif lres[1].locked == 0 then
            cb(false)
        end
    end)
end)

ESX.RegisterServerCallback("nescio-garage:limit", function(source, cb, garage)
    MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE ngarage = @garage", {
        ["@garage"] = garage
    }, function(vehs)
    cb(#vehs)
        --if #vehs == limit then
        --    cb(false)
        --else
        --    cb(true)
        --end
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
