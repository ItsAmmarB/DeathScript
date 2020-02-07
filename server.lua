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
    if #args == 1 then
        if tonumber(args[1]) then
            local target = tonumber(args[1])
            if GetPlayerName(target) then
                TriggerClientEvent('DeathScript:Revive', target, true, source, false)
            else
                TriggerClientEvent("DeathScript:ShowNotification", source, "~r~Invalid ID~n~/adrev ID")
            end
        else
            TriggerClientEvent("DeathScript:ShowNotification", source, "~r~Player ID must be a number~n~/adrev ID")
        end
    else
        TriggerClientEvent('DeathScript:Revive', source, true) 
    end
 end, true)

 RegisterCommand('adrevall', function(source, args, rawCommand)
    TriggerClientEvent('DeathScript:Revive', -1, true, source, true)
 end, true)

RegisterCommand('adres', function(source, args, rawCommand)
    if #args == 1 then
        if tonumber(args[1]) then
            local target = tonumber(args[1])
            if GetPlayerName(target) then
                TriggerClientEvent('DeathScript:Respawn', target, true, source, false)
            else
                TriggerClientEvent("DeathScript:ShowNotification", source, "~r~Invalid ID~n~/adres ID")
            end
        else
            TriggerClientEvent("DeathScript:ShowNotification", source, "~r~Player ID must be a number~n~/adres ID")
        end
    else
        TriggerClientEvent('DeathScript:Respawn', source, true) 
    end
end, true)

RegisterCommand('adresall', function(source, args, rawCommand)
    TriggerClientEvent('DeathScript:Respawn', -1, true, source, true)
end, true)

RegisterCommand('deathtoggle', function(source, args, rawCommand)
    TriggerClientEvent('DeathScript:Toggle', -1, args[1])
end, true)


AddEventHandler('DeathScript:AdminReturn', function(msg, id)
    TriggerClientEvent("DeathScript:ShowNotification", source, msg)
end)