------ MADE BY MAX F. ------
--FOR JUSTICE COMMUNITY RP--

RegisterNetEvent('DeathScript:ShowNotification')
RegisterNetEvent('DeathScript:Revive')
RegisterNetEvent('DeathScript:Respawn')
RegisterNetEvent('DeathScript:AdminRevive')
RegisterNetEvent('DeathScript:AdminRespawn')
RegisterNetEvent('DeathScript:Toggle')



local respawnTime = 120
local reviveTime = 240
local respawnAllowed = false
local reviveAllowed = false

spawnPoints = {}
deathToggle = true

AddEventHandler('onClientMapStart', function()
    exports.spawnmanager:spawnPlayer()
    Citizen.Wait(3000)
	exports.spawnmanager:setAutoSpawn( false )
end)

Citizen.CreateThread(function()

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
        local ped = GetPlayerPed(-1)
        if IsEntityDead(ped) then
            if deathToggle then
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
            else
                respawnPed(ped, spawnPoints[math.random(1,#spawnPoints)])
            end
        else 
            resetTimers()
        end
    end
end)

-- Events handlers for the commands.
AddEventHandler("DeathScript:Revive", function( src )
    local ped = GetPlayerPed( src )
    if IsEntityDead( ped ) then
        if reviveAllowed then
            revivePed(ped)
        else
            ShowNotification("~r~You need to wait " .. reviveTime .. ' seconds')
        end
    else
        ShowNotification( '~r~You are alive' )
    end
end)

AddEventHandler("DeathScript:Respawn", function( src )
    local ped = GetPlayerPed( src )
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

AddEventHandler("DeathScript:AdminRevive", function( target )
    local ped = GetPlayerPed( target )
    if IsEntityDead( ped ) then
        revivePed(ped)
        ShowNotification( '~g~You were admin revived' )
        TriggerServerEvent("DeathScript:AdminReturn", GetPlayerName(target) .. " was admin revived!")
    else
        ShowNotification( '~r~Player is alive' )
    end
end)

AddEventHandler("DeathScript:AdminRespawn", function( target )
    local ped = GetPlayerPed( target )
    if IsEntityDead( ped ) then
        revivePed(ped)
        ShowNotification( '~g~You were admin respawned' )
        TriggerServerEvent("DeathScript:AdminReturn", GetPlayerName( target ) .. " was admin respawned!")
    else
        ShowNotification( '~r~Player is alive' )
    end
end)

AddEventHandler("DeathScript:Toggle", function()
    if toggleDeath then
        ShowNotification("~r~ DeathScript was disabled")
    else
        ShowNotification("~r~ DeathScript was enabled")
    end
    toggleDeath()
end)

AddEventHandler("DeathScript:ShowNotification", function( message )
    ShowNotification(message)
 end)

 -- Resets the timers for Respawn and Revive
 function resetTimers()
    respawnAllowed = false
    respawnTime = 120
    reviveAllowed = false
    reviveTime = 240
end

function toggleDeath()
    deathToggle = not deathToggle
end