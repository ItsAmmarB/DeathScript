------ MADE BY MAX F. ------
--FOR JUSTICE COMMUNITY RP--
----------------------------



--------------------------------------------------------------------
------------------CODE STARTS FROM UNDER THIS LINE------------------
--------------------------------------------------------------------
--VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV--


--------------------------------------------------
----------------REGISTERING EVENTS----------------
--------------------------------------------------

RegisterServerEvent('DeathScript:AdminReturn')


--------------------------------------------------
---------------REGISTERING  COMMAND---------------
--------------------------------------------------
----------------CIVILIAN  COMMANDS----------------
--------------------------------------------------

RegisterCommand('togds', function(source, args, rawCommand)
    TriggerClientEvent('DeathScript:Toggle', -1) 
end, true)

RegisterCommand('revive', function(source, args, rawCommand)
   TriggerClientEvent('DeathScript:Revive', source) 
end, false)

RegisterCommand('respawn', function(source, args, rawCommand)
    TriggerClientEvent('DeathScript:Respawn', source) 
end, false)


--------------------------------------------------
---------------REGISTERING  COMMAND---------------
--------------------------------------------------
------------------ADMIN COMMANDS------------------
--------------------------------------------------

RegisterCommand('adrev', function(source, args, rawCommand)
    local target = tonumber( args[1] )
    if target then
        TriggerClientEvent('DeathScript:Revive', target, true)
        TriggerClientEvent("DeathScript:ShowNotification", target, "~g~You were admin revived")
    else
        TriggerClientEvent('DeathScript:Revive', source, true) 
    end
 end, true)

RegisterCommand('adres', function(source, args, rawCommand)
local target = tonumber( args[1] )
if target then
    TriggerClientEvent('DeathScript:Respawn', target, true) 
    TriggerClientEvent("DeathScript:ShowNotification", target, "~g~You were admin respawned")
else
    TriggerClientEvent('DeathScript:Respawn', source, true) 
end
end, true)


RegisterCommand('setrespawntime', function(source, args, rawCommand)
    if args[1] then
        TriggerClientEvent('DeathScript:SetRespawnTime', -1, args[1])
    else
        TriggerClientEvent("DeathScript:ShowNotification", source, "~r~You need to specify the respawn time!")
    end
 end, true)

RegisterCommand('setrevivetime', function(source, args, rawCommand)
if args[1] then
    TriggerClientEvent('DeathScript:SetReviveime', -1, args[1])
else
    TriggerClientEvent("DeathScript:ShowNotification", source, "~r~You need to specify the revive time!")
end
end, true)

RegisterCommand('deathtoggle', function(source, args, rawCommand)
    TriggerClientEvent('DeathScript:Toggle', -1, args[1])
end, true)
