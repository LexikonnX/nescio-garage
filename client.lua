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
local cars_in_garage = "Garáž"
local GarageBlipText = "Garáž"
local MyGarageBlipText = "Moje garáž"
local park_here = "Zaparkovat vozidlo do garáže"
local access_denied = "Sem ~r~nemáš prístup"
local vehicle_is_parked = "Vozidlo je ~g~zaparkováno~w~!"
local OpenGarageTitle = "Seznam zaparkovaných vozidel v garáži  "
local TakeTheVehicle = "Vzít vozidlo"
local vehicle = "Vozidlo "
local YouAreInVehicle = "Nesmíš být ve vozidle"
local BuyGarage = "Koupit garáž za $"
local CancelBuyGarage = "Zrušit"
local YouBoughtGarage = "~y~Koupil jsi garáž!"
local NoMoney = "Nemáš dostatek peněz!"
local ThisIsNotYourGarage = "Toto ~y~není ~w~tvá garáž!"
local SaleGarage = "Prodat garáž za $"
local GarageIsSaled = "Prodal jsi svou garáž"
local GarageIsFull = "Garáž je ~y~plná~w~!"
local limitVehText = "Max vozidel:"
local LockGarageText = "Zamknout garáž"
local UnlockGarageText = "Odemknout garáž"
local GarageIsLocked = "Garáž je ~y~zamknutá"
local GarageIsUnlocked = "Garáž je ~y~odemknutá"

local blipcolor = 44 -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
local myblipcolor = 2 -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
local blipsprite = 326 -- https://docs.fivem.net/docs/game-references/blips/#blips

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
-- public = If the garage is public or not - 1 public, 0 for sale
-- price = Price of the garage if public is 0 (Garage is for sale)
-- limit = Max vehicles in one garage (0 = unlimited)
local allGarages = {
    {name = "lspd1", pos = vector3(463.5, -1015.2, 28.07), label = "LSPD", heading = 88.89, job = "police", marker = 36, showMarker = true, color = {r = 0, g = 0, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "lspd2", pos = vector3(539.51, -41.87, 70.8), label = "LSPD", heading = 217.88, job = "police", marker = 36, showMarker = true, color = {r = 0, g = 0, b = 255}, blip = false, public = 1, price = 0, limit = 0},
    {name = "sanandreasave1", pos = vector3(-39.8225, -712.533, 32.05), label = "San Andreas Ave", heading = 156.46, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "sanandreasave1", pos = vector3(-24.09, -718.7090, 32.05), label = "San Andreas Ave", heading = 156.46, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 1, price = 0, limit = 0},
    {name = "sanandreasave1", pos = vector3(-9.305, -723.96, 32.05), label = "San Andreas Ave", heading = 156.46, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 1, price = 0, limit = 0},
    {name = "sanandreasave1", pos = vector3(-37.01, -702.53, 31.84), label = "San Andreas Ave", heading = 343.68, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 1, price = 0, limit = 0},
    {name = "sanandreasave1", pos = vector3(-21.29, -708.56, 31.84), label = "San Andreas Ave", heading = 343.68, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 1, price = 0, limit = 0},
    {name = "sanandreasave1", pos = vector3(-5.47, -714.56, 31.84), label = "San Andreas Ave", heading = 343.68, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 1, price = 0, limit = 0},
    {name = "hospital", pos = vector3(340.38, -560.574, 28.743), label = "Nemocnice Strawberry Ave", heading = 349.105, job = "ambulance", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "hospital", pos = vector3(330.1947, -556.8505, 28.743), label = "Nemocnice Strawberry Ave", heading = 349.105, job = "ambulance", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 1, price = 0, limit = 0},
    {name = "hawickave1", pos = vector3(457.8745, -283.71, 48.66), label = "Hawick Ave", heading = 154.27, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 50000, limit = 20},
    {name = "altast1", pos = vector3(22.2634, -210.94, 52.85), label = "Alta St", heading = 252.0, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 7000, limit = 4},
    {name = "elginave", pos = vector3(502.32, -105.7, 62.32), label = "Elgin Ave", heading = 247.0, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "elginave", pos = vector3(505.11, -98.8, 62.57), label = "Elgin Ave", heading = 247.0, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 1, price = 0, limit = 0},
    {name = "army1", pos = vector3(-2426.97, 3309.222, 32.9777), label = "Great Ocean Hwy", heading = 232.15, job = "army", marker = 36, showMarker = true, color = {r = 100, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "army1", pos = vector3(-2429.4006, 3304.761, 32.97), label = "Great Ocean Hwy", heading = 232.15, job = "army", marker = 36, showMarker = true, color = {r = 100, g = 255, b = 255}, blip = false, public = 1, price = 0, limit = 0},
    {name = "vespucciblvd1", pos = vector3(-580.7171, -823.79, 26.36), label = "Vespucci Blvd", heading = 180.33, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 13000, limit = 5},
    {name = "gingerst", pos = vector3(-575.2, -587.6, 25.3), label = "Ginger St", heading = 353.7, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "lsfreeway", pos = vector3(465.99, -578.76, 28.46), label = "LS Freeway", heading = 167.4, job = "busdriver", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "sanandreasave2", pos = vector3(-516.04, -622.3, 25.3), label = "San Andreas Ave", heading = 272.8, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "littlebighorn", pos = vector3(486.68, -916.3, 26.2), label = "Little Bighorn Ave", heading = 268.205, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 7000, limit = 2},
    {name = "palomino1", pos = vector3(-618.7, -738.34, 27.7), label = "Palomino Ave", heading = 82.94, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "palomino1", pos = vector3(-618.7, -731.9, 27.7), label = "Palomino Ave", heading = 82.94, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 1, price = 0, limit = 0},
    {name = "calaisave", pos = vector3(-504.7, -739.8, 32.5), label = "Calais Ave", heading = 177.3, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 6000, limit = 2},
    {name = "palominoave", pos = vector3(-663.1, -721.36, 27.1), label = "Palomino Ave", heading = 266.3, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 5000, limit = 2},
    {name = "palominoave1", pos = vector3(-670.8, -724.41, 26.9), label = "Palomino Ave", heading = 270.06, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 0, price = 5000, limit = 2},
    {name = "vespucciblvd2", pos = vector3(-667.81, -853.41, 23.85), label = "Vespucci Blvd", heading = 0.9, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "vespucciblvd", pos = vector3(-786.6, -805.5, 20.6), label = "Vespucci Blvd", heading = 177.1, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "deckerst", pos = vector3(-816.1, -745.8, 23.4), label = "Decker St", heading = 180.7, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "gingerst", pos = vector3(-798.3, -983.3, 13.9), label = "Ginger St", heading = 215.33, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 15000, limit = 5},
    {name = "southrockforddr", pos = vector3(-895.5, -985.2, 2.1), label = "South Rockford Dr", heading = 313.7, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 10000, limit = 4},
    {name = "morningwood", pos = vector3(-1298.89, -383.39, 36.5), label = "Morningwood Blvd", heading = 302.0, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 15000, limit = 8},
    {name = "morningwood", pos = vector3(-1301.89, -378.05, 36.5), label = "Morningwood Blvd", heading = 302.0, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 0, price = 15000, limit = 8},
    {name = "equality", pos = vector3(-1609.74, -822.7, 10.04), label = "Equality Way", heading = 318.9, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 25000, limit = 10},
    {name = "southrockforddr1", pos = vector3(-906.6, -967.2, 2.1 ), label = "South Rockford Dr", heading = 104.8, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 10000, limit = 2},
    {name = "southrockforddr2", pos = vector3(-920.3, -950.9, 2.1), label = "South Rockford Dr", heading = 294.7, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 10000, limit = 2},
    {name = "southrockforddr3", pos = vector3(-942.6, -912.3, 2.1), label = "South Rockford Dr", heading = 297.7, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 10000, limit = 2},
    {name = "vespucciblvd3", pos = vector3(-949.6, -899.7, 2.1), label = "Vespucci Blvd", heading = 294.7, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 12000, limit = 4},
    {name = "inventionct", pos = vector3(-936.7, -1076.6, 2.1), label = "Invention Ct", heading = 202.8, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 8000, limit = 2},
    {name = "prosperityst", pos = vector3(-1022.9, -1132.5, 2.1), label = "Prosperity St", heading = 204.3, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 9000, limit = 3},
    {name = "baycityave", pos = vector3(-1117.8, -1223.7, 2.5), label = "Bay City Ave", heading = 122.5, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 8000, limit = 2},
    {name = "barbareno", pos = vector3(-3237.08, 1034.22, 11.27), label = "Barbareno Rd", heading = 264.012, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 12000, limit = 3},
    {name = "greatoceanhwy", pos = vector3(-2214.90917, 4239.64208, 47.036), label = "Great Ocean Hwy", heading = 37.21, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 15000, limit = 9},
    {name = "morningwoodblvd", pos = vector3(-1322.6, -238.5, 42.6), label = "Morningwood Blvd", heading = 301.9, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 6000, limit = 1},
    {name = "boulevarddelperro", pos = vector3(-1224.9, -263.3, 38.5), label = "Boulevard Del Perro", heading = 298.03, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "duluoz", pos = vector3(-278.836, 6170.031, 31.08), label = "Duluoz Ave", heading = 291.3, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 7000, limit = 5},
    {name = "magellanave", pos = vector3(-1126.5, -1471.1, 4.6), label = "Magellan Ave", heading = 215.4, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 10000, limit = 3},
    {name = "sandcastleway", pos = vector3(-1438.4, -884.6, 10.7), label = "Sandcastle Way", heading = 158.9, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 12000, limit = 4},
    {name = "westeclipseblvd", pos = vector3(-1818.01, -328.1, 43.2), label = "West Eclipse Blvd", heading = 325.7, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "spanish", pos = vector3(-443.53, 140.38, 64.3), label = "Spanish Ave", heading = 177.94, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "delperro", pos = vector3(-143.94, -576.7, 31.93), label = "Del Perro Fwy", heading = 161.33, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "atleest", pos = vector3(333.34, -997.53, 28.75), label = "Atlee St", heading = 177.97, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 11000, limit = 4},
    {name = "inno", pos = vector3(-137.3, -1397.06, 29.3), label = "Innocence Blvd", heading = 32.85, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 10000, limit = 4},
    {name = "forumdr", pos = vector3(6.9, -1452.7, 30.01), label = "Forum Dr", heading = 169.773, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 5000, limit = 1},
    {name = "grovest", pos = vector3(-69.5618, -1824.116, 26.45), label = "Grove St", heading = 223.136, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "grovest2", pos = vector3(115.96, -1948.52, 20.19), label = "Grove St", heading = 46.5, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 5000, limit = 1},
    {name = "integrity", pos = vector3(322.021, -683.92, 28.8), label = "Integrity Way", heading = 245.5, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "littlebighorn1", pos = vector3(492.993, -932.54, 26.19), label = "Little Bighorn Ave", heading = 269.3, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 10000, limit = 3},
    {name = "buenvinoro", pos = vector3(-2593.69, 1930.31, 166.62), label = "Buen Vino Rd", heading = 308.78, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 50000, limit = 20},
    {name = "buenvinoro1", pos = vector3(-2598.84, 1922.18, 172.69), label = "Buen Vino Rd", heading = 98.53, job = "", marker = 34, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 80000, limit = 4},
    {name = "banhamcanyondr", pos = vector3(-2785.911, 1432.29, 100.504), label = "Banham Canyon Dr", heading = 233.59, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 30000, limit = 6},
    {name = "madwayne", pos = vector3(-1297.76, 456.75, 96.98), label = "Mad Wayne Thunder Dr", heading = 343.9, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 0, price = 25000, limit = 6},
    {name = "eclipse", pos = vector3(-791.89, 332.59, 85.7), label = "Eclipse Towers", heading = 175.32, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 1, price = 0, limit = 0},
    {name = "eclipse", pos = vector3(-800.85, 332.45, 85.70), label = "Eclipse Towers", heading = 187.47, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "tinsel", pos = vector3(-620.34, 53.17, 43.24), label = "Eclipse Towers", heading = 70.71, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 1, price = 0, limit = 0},
    {name = "tinsel", pos = vector3(-621.91, 59.31, 43.24), label = "Eclipse Towers", heading = 104.48, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "hillcrestave2862", pos = vector3(-684.14, 603.4, 143.17), label = "Hillcrest Ave 2862", heading = 42.48, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 0, price = 50000, limit = 8},
    {name = "hillcrestave2868", pos = vector3(-753.23, 628.8, 142.06), label = "Hillcrest Ave 2868", heading = 289.48, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 0, price = 50000, limit = 8},
    {name = "hillcrestave2874", pos = vector3(-863.96, 699.3, 148.54), label = "Hillcrest Ave 2874", heading = 326.9, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 0, price = 50000, limit = 8},
    {name = "wildoastdr3655", pos = vector3(-188.98, 502.2, 134.05), label = "Wild Oast Dr 3655", heading = 12.86, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 0, price = 40000, limit = 6},
    {name = "whispymounddr3677", pos = vector3(131.67, 568.42, 183.08), label = "Whispymound Dr 3677", heading = 1.19, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 0, price = 21000, limit = 4},
    {name = "northconkerave2044", pos = vector3(353.57, 436.84, 146.35), label = "North Conker Ave 2044", heading = 289.43, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 0, price = 21000, limit = 6},
    {name = "northconkerave2046", pos = vector3(391.97, 430.49, 143.05), label = "North Conker Ave 2046", heading = 348.73, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 0, price = 21000, limit = 6},
    {name = "powerst1162", pos = vector3(282.63, -147.52, 64.55), label = "Power St 1162", heading = 348.73, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = false, public = 0, price = 12000, limit = 4},
    {name = "integrityway", pos = vector3(-37.22, -617.54, 34.66), label = "Integrity Way", heading = 188.73, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0},
    {name = "weazelplaza", pos = vector3(-827.05, -395.20, 30.90), label = "Weazel Plaza", heading = 188.73, job = "", marker = 36, showMarker = true, color = {r = 0, g = 255, b = 255}, blip = true, public = 1, price = 0, limit = 0}
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
            SetBlipSprite(blip, blipsprite)
            SetBlipScale(blip, 0.9)
            SetBlipColour(blip, blipcolor)
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
                                    OpenGarage(allGarages[i].name, allGarages[i].pos, allGarages[i].heading, allGarages[i].label, allGarages[i].price)
                                else
                                    ESX.ShowNotification(access_denied)
                                end
                            else
                                if allGarages[i].public == 1 then
                                    OpenGarage(allGarages[i].name, allGarages[i].pos, allGarages[i].heading, allGarages[i].label, allGarages[i].price, allGarages[i].public)
                                elseif allGarages[i].public == 0 then
                                    ESX.TriggerServerCallback("nescio-garage:owner", function(p)
                                        if p == 1 then
                                            OpenGarage(allGarages[i].name, allGarages[i].pos, allGarages[i].heading, allGarages[i].label, allGarages[i].price, allGarages[i].public)
                                        elseif p == 0 then
                                            ESX.ShowNotification(ThisIsNotYourGarage)
                                        elseif p == 2 then
                                            OpenBuyMenu(allGarages[i].name, allGarages[i].price, allGarages[i].limit, allGarages[i].label)
                                        end
                                    end, allGarages[i].name)
                                end
                            end
                        end
                    else
                        ESX.ShowHelpNotification("~INPUT_CONTEXT~ "..park_here.." "..allGarages[i].label)
                        if IsControlJustReleased(0, 38) then
                            if allGarages[i].job ~= "" then
                                if PlayerData.job.name == allGarages[i].job then
                                    DoScreenFadeOut(500)
                                    TriggerServerEvent("nescio-garage:park", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId())), allGarages[i].name)
                                    ESX.ShowNotification(vehicle_is_parked)
                                    Citizen.Wait(1000)
                                    DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                                    DoScreenFadeIn(500)
                                else
                                    ESX.ShowNotification(access_denied)
                                end
                            else
                                if allGarages[i].limit ~= 0 then
                                   ESX.TriggerServerCallback("nescio-garage:limit", function(l)
                                        if l >= allGarages[i].limit then
                                            ESX.ShowNotification(GarageIsFull)
                                        else
                                            OwnerCheck(allGarages[i].name, allGarages[i].price, allGarages[i].public, allGarages[i].limit, allGarages[i].label)
                                        end
                                    end, allGarages[i].name)
                                else
                                    OwnerCheck(allGarages[i].name, allGarages[i].price, allGarages[i].public, allGarages[i].limit, allGarages[i].label)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

function OwnerCheck(gname, ogprice, oPublic, limited, glabel)
    if oPublic == 1 then
        DoScreenFadeOut(500)
        TriggerServerEvent("nescio-garage:park", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId())), gname)
        ESX.ShowNotification(vehicle_is_parked)
        Citizen.Wait(1000)
        DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
        DoScreenFadeIn(500)
    elseif oPublic == 0 then
        ESX.TriggerServerCallback("nescio-garage:owner", function(p)
        if p == 1 then
            DoScreenFadeOut(500)
            TriggerServerEvent("nescio-garage:park", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId())), gname)
            ESX.ShowNotification(vehicle_is_parked)
            Citizen.Wait(1000)
            DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
            DoScreenFadeIn(500)
        elseif p == 0 then
            ESX.ShowNotification(ThisIsNotYourGarage)
        elseif p == 2 then
            OpenBuyMenu(gname, ogprice, limited, glabel)
        end
    end, gname)
    end
end

function OpenBuyMenu(garageName, garagePrice, limitVeh, garageLabel)
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "ListGarage", {
            title = garageLabel.." | "..limitVehText.." "..limitVeh,
            align = "right",
            elements = {
                {label = BuyGarage..garagePrice, value = 'yes'},
                {label = CancelBuyGarage, value = 'no'}
            }
        }, function(data, menu)
        if data.current.value == 'yes' then
            ESX.TriggerServerCallback("nescio-garage:buy", function(res)
                if res == true then
                    ESX.ShowNotification(YouBoughtGarage)
                else
                    ESX.ShowNotification(NoMoney)
                end
            end, garageName, garagePrice)
            menu.close()
        else
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end

function OpenGarage(garageName, garagePos, h, garageLabel, garagePrice, public)
    local IsGarageLocked = 1
    local elements = {}
    ESX.TriggerServerCallback("nescio-garage:islocked", function(IsGarageLocked1)
        if IsGarageLocked1 == false then
            IsGarageLocked = 0
        end
    end, garageName)
    ESX.TriggerServerCallback("nescio-garage:list", function(vehList)
        for k,v in pairs(vehList) do
            local vehHash = v.vehicle.model
            local vehName = GetDisplayNameFromVehicleModel(vehHash)
            local vehLabel = GetLabelText(vehName)
            table.insert(elements, { label = v.plate, name = vehName, value = v, plate = v.plate, vehicle = v.vehicle })
        end
        local gPrice = garagePrice/2
        if public == 0 then
            table.insert(elements, { label = SaleGarage..gPrice, value='sell' })
            if IsGarageLocked == 1 then
                table.insert(elements, { label = UnlockGarageText, value='unlock' })
            elseif IsGarageLocked == 0 then
                table.insert(elements, { label = LockGarageText, value='lock' })
            end
        end
        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "ListGarage", {
            title = OpenGarageTitle..garageLabel,
            align = "right",
            elements = elements
        }, function(data, menu)
            if data.current.value ~= 'sell' and  data.current.value ~= 'lock' and  data.current.value ~= 'unlock' then
                OpenVehicleInfoDisplay(data.current, garagePos, h)
            elseif data.current.value == 'sell' then
                SellGarage(garageName, garagePrice)
            elseif data.current.value == 'lock' then
                LockGarage(garageName, 1)
            elseif data.current.value == 'unlock' then
                LockGarage(garageName, 0)
            end
            menu.close()
        end, function(data, menu)
            menu.close()
        end)
    end, garageName)
end

function LockGarage(lgarage, lk)
    ESX.TriggerServerCallback("nescio-garage:lock", function(lockres)
        if lockres == true then
            ESX.ShowNotification(GarageIsLocked)
        else
            ESX.ShowNotification(GarageIsUnlocked)
        end
    end, lgarage, lk)
end

function SellGarage(sgarageName, sgPrice)
    ESX.TriggerServerCallback("nescio-garage:sell", function(sres)
        if sres == 1 then
            ESX.ShowNotification(GarageIsSaled)
        else
            ESX.ShowNotification("Error! Please contact developer Lexikonn#2590")
        end
        ESX.UI.Menu.CloseAll()
    end, sgarageName, sgPrice)
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
    end)
end

function SpawnSelVeh(vehicle, spawnPoint, he)
    DoScreenFadeOut(500)
    Citizen.Wait(1000)
    ESX.Game.SpawnVehicle(vehicle.vehicle.model, vector3(spawnPoint.x, spawnPoint.y, spawnPoint.z), he, function(car)
        ESX.Game.SetVehicleProperties(car, vehicle.vehicle)
        TaskWarpPedIntoVehicle(PlayerPedId(), car, -1)
        TriggerServerEvent("nescio-garage:parkout", vehicle.vehicle.plate)
        ESX.UI.Menu.CloseAll()
        DoScreenFadeIn(500)
    end)
end