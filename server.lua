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

-- RegisterCommand('adrev', function(source, args, rawCommand)
--     local target = tonumber( args[1] )
--     if target then
--         if GetPlayerGuid( target ) then
--             TriggerClientEvent('DeathScript:AdminRevive', target) 
--         else
--             TriggerClientEvent('DeathScript:ShowNotification', source, '~r~Invalid Player')
--         end
--     else
--         TriggerClientEvent('DeathScript:AdminRevive', source) 
--     end 
-- end, true)

-- RegisterCommand('adres', function(source, args, rawCommand)
--     local target = tonumber( args[1] )
--     if target then
--         if GetPlayerGuid( target ) then
--             TriggerClientEvent('DeathScript:AdminRespawn', target) 
--         else
--             TriggerClientEvent('DeathScript:ShowNotification', source, '~r~Invalid Player')
--         end
--     else
--         TriggerClientEvent('DeathScript:AdminRespawn', source) 
--     end
-- end, true)
