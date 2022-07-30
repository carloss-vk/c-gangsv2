Config = {}

Config.DrawDistance = 3

Config.ZoneSize     = {x = 1.0, y = 1.0, z = 0.5}
Config.MarkerColor  = {r = 255, g = 66, b = 51}

Config.Triggers = {
    OpenBossMenu = 'esx_society:openBossMenu'
}

Config.Routes = {
    [1] = vec3(-66.250549, 891.771423, 235.555298),
    [2] = vec3(-391.213196, 1189.503296, 325.634399),
    [3] = vec3(-3056.149414, 446.835175, 6.347290),
    [4] = vec3(669.336243, 1277.973633, 360.294434),
    [5] = vec3(1452.923096, -1683.191162, 65.995605)
}

Config.EnabledGangMissions = true

Config.Gangs = {
    {

        Society_Name = 'police',

        GangName = 'Prueba',
        JobName = 'police',
        GangOwner = 'Carloss',
        WashMoney = false,

        VehicleSpawnColor = {
            r = 189,
            g = 0,
            b = 255
        },

        GarageMenu = {
            {label = 'Furia', model = 'furia'},
            {label = 'BF400', model = 'bf400'},
        },

        Garage = vec3(-1151.248291, -1519.661499, 3.359009),
        MissionCarSpawn = vec3(-1154.400024, -1550.518677, 4.257935),
        SpawnVehicle = vec3(-1159.608765, -1513.516479, 4.207275),
        Heading = 34.015747,
        PlateText = 'Test',

        DeleteVehicle = vec3(-1157.129639, -1518.000000, 3.359009),

        Armory = vec3(-1157.103271, -1517.762695, 9.627075),
        Shop = vec3(-1154.215332, -1520.452759, 9.627075),
        
        GangInfo = vec3(-1158.329712, -1524.949463, 9.627075),

        BossActions = vec3(-1146.290161, -1515.389038, 9.627075),

        GangMission = vec3(-1162.378052, -1552.865967, 3.342163),

        GangMissionMenu = {
            {label = 'Traficar', value = 'traficar'},
        },

        ArmoryMenu = {
            {label = 'Pistola 100$', weapon = 'weapon_pistol', price = 50000},
            {label = 'Machine Pistol 200000$', weapon = 'weapon_machinepistol', price = 200000},
            {label = 'Double Action Revolver 225000$', weapon = 'weapon_doubleaction', price = 225000},
        },

        MissionWeapons = {
            {label = 'Carabina 450000$', mweapon = 'weapon_carbinerifle', mprice = 450000},
            {label = 'Assault Rifle 575000$', mweapon = 'weapon_assaultrifle', mprice = 575000},
            {label = 'Sniper Rifle 600000$', mweapon = 'weapon_sniperrifle', mprice = 600000},
            {label = 'Assault SMG 750000$', mweapon = 'weapon_assaultsmg', mprice = 750000},
        },

        ShopMenu = {
            {label = 'Pan 5$', item = 'bread', price = 5},
            {label = 'Agua 3$', item = 'water', price = 3}
        }
    }
}