------ MADE BY MAX F. ------
--FOR JUSTICE COMMUNITY RP--
----------------------------

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
    resetTimers()
end

function revivePed(ped)
    NetworkResurrectLocalPlayer(GetEntityCoords(ped, true), true, true, false)
    SetPlayerInvincible(ped, false)
    ClearPedBloodDamage(ped)
    resetTimers()
end

function Alert(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    DisplayHelpTextFromStringLable(0, 0, 1, -1)
end

