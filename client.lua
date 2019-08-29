------ MADE BY MAX F. ------
--FOR JUSTICE COMMUNITY RP--

RegisterNetEvent('DeathScript:ShowNotification')
RegisterNetEvent('DeathScript:Revive')
RegisterNetEvent('DeathScript:Respawn')
RegisterNetEvent('DeathScript:AdRev')
RegisterNetEvent('DeathScript:AdRes')


local respawnTime = 5
local reviveTime = 5
local respawnAllowed = false
local reviveAllowed = false


AddEventHandler('onClientMapStart', function()
    exports.spawnmanager:spawnPlayer()
    Citizen.Wait(3000)
	exports.spawnmanager:setAutoSpawn( false )
end)

Citizen.CreateThread(function()
    spawnPoints = {}

    function createSpawnPoint(x1,x2,y1,y2,z,heading)
        local xValue = math.random(x1,x2) + 0.0001
        local yValue = math.random(y1,y2) + 0.0001
    
        local newObject = {
            x = xValue,
            y = yValue,
            z = z + 0.0001,
            heading = heading + 0.0001
        }
        table.insert(spawnPoints,newObject)
    end


    createSpawnPoint(-448, -448, -340, -329, 35.5, 0) -- Mount Zonah
    createSpawnPoint(372, 375, -596, -594, 30.0, 0)   -- Pillbox Hill
    createSpawnPoint(335, 340, -1400, -1390, 34.0, 0) -- Central Los Santos
    createSpawnPoint(1850, 1854, 3700, 3704, 35.0, 0) -- Sandy Shores
    createSpawnPoint(-247, -245, 6328, 6332, 33.5, 0) -- Paleto

	while true do
        Citizen.Wait(5000)
        ped = GetPlayerPed(-1)
        if IsEntityDead(ped) then
            SetPlayerInvincible(ped, true)
            SetEntityHealth(ped, 1)
            if respawnTime > 0 then 
                respawnTime = respawnTime - 5
                respawnTimerText = '~r~Respawn in ' .. respawnTime .. ' seconds!'
            else
               respawnTimerText = '~g~You can Respawn | /respawn!'
                respawnAllowed = true
            end
            if reviveTime > 0 then 
                reviveTime = reviveTime - 5
                reviveTimerText = '~r~Revive in ' .. reviveTime .. ' seconds!'
            else
                reviveTimerText = '~g~You can Revive | /revive!'
                reviveAllowed = true
            end
            ShowNotification(respawnTimerText .. '\n' .. reviveTimerText)
        end
    end
end)


-- Events handlers for the commands
AddEventHandler("DeathScript:Revive", function(source)
    local ped = GetPlayerPed( source )
    if IsEntityDead( ped ) then
        if reviveAllowed then
            NetworkResurrectLocalPlayer(GetEntityCoords(ped, true), true, true, false)
            SetPlayerInvincible(ped, false)
            ClearPedBloodDamage(ped)
            resetTimers()
        else
            ShowNotification("~r~You need to wait " .. reviveTime .. ' seconds')
        end
    else
        ShowNotification( '~r~You are alive' )
    end
end)

AddEventHandler("DeathScript:Respawn", function(source)
    local ped = GetPlayerPed( source )
    if IsEntityDead( ped ) then
        if respawnAllowed then
            respawnPed(ped, spawnPoints[math.random(1,#spawnPoints)])
            resetTimers()
        else
            ShowNotification("~r~You need to wait " .. respawnTime .. ' seconds')
        end
    else
        ShowNotification( '~r~You are alive' )
    end
end)

AddEventHandler("DeathScript:AdRev", function(src)
    local ped = GetPlayerPed( src )
    if IsEntityDead( ped ) then
        NetworkResurrectLocalPlayer(GetEntityCoords(ped, true), true, true, false)
        SetPlayerInvincible(ped, false)
        ClearPedBloodDamage(ped)
        resetTimers()
        ShowNotification( '~g~You were admin revived' )
    else
        ShowNotification( '~r~You are alive' )
    end
end)

AddEventHandler("DeathScript:AdRes", function(src)
    local ped = GetPlayerPed( src )
    if IsEntityDead( ped ) then
        respawnPed(ped, spawnPoints[math.random(1,#spawnPoints)])
        resetTimers()
        ShowNotification( '~g~You were admin respawned' )
    else
        ShowNotification( '~r~You are alive' )
    end
end)


-- Function under this line
function ShowNotification(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(true, false)
 end

function respawnPed(ped, coords)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, coords.heading, true, false) 

	SetPlayerInvincible(ped, false) 

	TriggerEvent('playerSpawned', coords.x, coords.y, coords.z, coords.heading)
	ClearPedBloodDamage(ped)
end

function Alert(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    DisplayHelpTextFromStringLable(0, 0, 1, -1)
 end

 function resetTimers()
    respawnAllowed = false
    respawnTime = 120
    reviveAllowed = false
    reviveTime = 240
 end

 AddEventHandler("DeathScript:ShowNotification", function(message)
    ShowNotification(message)
 end)