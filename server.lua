------ MADE BY AMMAR B. ------
------------------------------


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
        TriggerClientEvent("DeathScript:ShowNotification", target, "~g~You have been revived by an admin")
    else
        TriggerClientEvent('DeathScript:Revive', source, true) 
    end
 end, true)

 RegisterCommand('adrevall', function(source, args, rawCommand)
    TriggerClientEvent('DeathScript:Revive', -1, true)
    TriggerClientEvent("DeathScript:ShowNotification", -1, "~g~You have been revived by an admin")
 end, true)

RegisterCommand('adres', function(source, args, rawCommand)
local target = tonumber( args[1] )
if target then
    TriggerClientEvent('DeathScript:Respawn', target, true) 
    TriggerClientEvent("DeathScript:ShowNotification", target, "~g~You have respawned by an admin")
else
    TriggerClientEvent('DeathScript:Respawn', source, true) 
end
end, true)

RegisterCommand('adresall', function(source, args, rawCommand)
    TriggerClientEvent('DeathScript:Respawn', -1, true) 
    TriggerClientEvent("DeathScript:ShowNotification", -1, "~g~You have respawned by an admin")
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
