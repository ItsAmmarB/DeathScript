------ MADE BY AMMAR B.------
-----------------------------

--------------------------------------------------
----------------STOPS AUTO RESPAWN----------------
--------------------------------------------------

AddEventHandler('onClientMapStart', function()
	exports.spawnmanager:spawnPlayer()
	Citizen.Wait(3000)
	exports.spawnmanager:setAutoSpawn(false)
end)


--------------------------------------------------
----------------REGISTERING EVENTS----------------
--------------------------------------------------

RegisterNetEvent("DeathScript:Revive")
RegisterNetEvent("DeathScript:Respawn")
RegisterNetEvent("DeathScript:AdminRevive")
RegisterNetEvent("DeathScript:AdminRespawn")
RegisterNetEvent("DeathScript:SetReviveTime")
RegisterNetEvent("DeathScript:SetRespawnTime")
RegisterNetEvent("DeathScript:Toggle")
RegisterNetEvent("DeathScript:ShowNotification")
RegisterNetEvent("DeathScript:IsPlayerDead")



--------------------------------------------------
----------------DEFINING VARIABLES----------------
--------------------------------------------------

OriginalReviveTime = 240
OriginalRespawnTime = 120

ReviveTime = 240
RespawnTime = 120

ReviveAllowed = false
RespawnAllowed = false

DeathTime = nil

DeathScriptToggle = true

respawnCount = 0
spawnPoints = {}


--------------------------------------------------
--------------------Death Loop--------------------
--------------------------------------------------

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

	createSpawnPoint(-448, -448, -340, -329, 35.5, 0)    -- Mount Zonah
	createSpawnPoint(372, 375, -596, -594, 30.0, 0)      -- Pillbox Hill
	createSpawnPoint(335, 340, -1400, -1390, 34.0, 0)    -- Central Los Santos
	createSpawnPoint(1850, 1854, 3700, 3704, 35.0, 0)    -- Sandy Shores
	createSpawnPoint(-247, -245, 6328, 6332, 33.5, 0)    -- Paleto

    while true do
        Citizen.Wait(5000)
        local ped = PlayerPedId()

		if IsEntityDead( ped ) then

			if DeathScriptToggle then

                DeathTime = GetGameTimer()

                SetPlayerInvincible( ped, true )
				SetEntityHealth( ped, 1 )
				
				local reviveMessage = nil
				local respawnMessage = nil

				if ReviveTime > 0 then
					ReviveTime = ReviveTime - 5
					reviveMessage = '~r~Revive in ' .. ReviveTime .. ' seconds'
				else
					ReviveAllowed = true
					reviveMessage = '~g~Revive available | /revive'
				end

				if RespawnTime > 0 then
					RespawnTime = RespawnTime - 5
					respawnMessage = '~r~Respawn in ' .. RespawnTime .. ' seconds'
				else 
					RespawnAllowed = true
					respawnMessage = '~g~Respawn available | /respawn'
				end

				ShowNotification(  respawnMessage .. '\n' .. reviveMessage )

			else 
				respawnPed( ped, spawnPoints[math.random(1,#spawnPoints)]  )
			end	
		end
	end
end)


--------------------------------------------------
-----------------EVENT  HANDLERS------------------
--------------------------------------------------

AddEventHandler("DeathScript:Revive", function( adrev, admin, all)
	local ped = PlayerPedId()
	if adrev then ReviveAllowed = true end
	if all then
		revivePed( ped )
		resetTimers()
		ShowNotification("~g~You have been revived by an admin!")
		return;
	end
	if GetEntityHealth( ped ) <= 1 then --if you are dead
		if ReviveAllowed then -- if timer is complete allow revive --

			revivePed( ped )
			resetTimers()
			if adrev then
				ShowNotification("~g~You have been revived by an admin!")
				TriggerServerEvent('DeathScript:AdminReturn', '~g~Player have been revived', admin)
			end
		else
			ShowNotification("~r~" .. ReviveTime .. ' seconds remaining until revive!')
		end
	else
		if adrev then
			TriggerServerEvent('DeathScript:AdminReturn', '~r~Player is alive', admin)
		else
			ShowNotification("~g~You're alive!")
		end
	end
end)

AddEventHandler("DeathScript:Respawn", function( adres, admin, all)
	local ped = PlayerPedId()
	if adres then RespawnAllowed = true end
	if all then
		respawnPed( ped, spawnPoints[math.random(1,#spawnPoints)] )
		resetTimers()
		ShowNotification("~g~You have been respawned by an admin!")
		return;
	end
	if GetEntityHealth( ped ) <= 1 then --if you are dead
		if RespawnAllowed then -- if timer is complete allow revive --
			
			respawnPed( ped, spawnPoints[math.random(1,#spawnPoints)] )
			resetTimers()
			if adres then
				ShowNotification("~g~You have been respawned by an admin!")
				TriggerServerEvent('DeathScript:AdminReturn', '~g~Player have been respawned', admin)
			end
		else
			ShowNotification("~r~" .. RespawnTime .. ' seconds remaining until respawn!')
		end
	else
		if adres then
			TriggerServerEvent('DeathScript:AdminReturn', '~r~Player is alive', admin)
		else
			ShowNotification("~g~You're alive!")
		end
	end
end)

AddEventHandler('DeathScript:Toggle', function()
	DeathScriptToggle = not DeathScriptToggle
	if (DeathScriptToggle) then
		ShowNotification("~b~DeathScript was enabled")
	else
		ShowNotification("~r~DeathScript was disabled")
	end
end)

AddEventHandler('DeathScript:ShowNotification', function( str )
	ShowNotification( str )
end)


--------------------------------------------------
--------------------FUNCTIONS---------------------
--------------------------------------------------

function resetTimers()
	ReviveTime = OriginalReviveTime
	RespawnTime = OriginalRespawnTime
	ReviveAllowed = false
	RespawnAllowed = false
end


