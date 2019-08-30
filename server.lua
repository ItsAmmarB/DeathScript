------ MADE BY MAX F. ------
--FOR JUSTICE COMMUNITY RP--

RegisterServerEvent('DeathScript:AdminReturn')

AddEventHandler('DeathScript:AdminReturn', function(msg)
    TriggerClientEvent("DeathScript:ShowNotification", -1, "~g~" .. msg)
end)

-- Commands
RegisterCommand('revive', function(source, args, rawCommand)
   TriggerClientEvent('DeathScript:Revive', source) 
end, false)

RegisterCommand('respawn', function(source, args, rawCommand)
    TriggerClientEvent('DeathScript:Respawn', source) 
end, false)

RegisterCommand('adrev', function(source, args, rawCommand)
    local target = tonumber( args[1] )
    if target then
        if GetPlayerGuid( target ) then
            TriggerClientEvent('DeathScript:AdminRevive', target) 
        else
            TriggerClientEvent('DeathScript:ShowNotification', source, '~r~Invalid Player')
        end
    else
        TriggerClientEvent('DeathScript:AdminRevive', source) 
    end 
end, true)

RegisterCommand('adres', function(source, args, rawCommand)
    local target = tonumber( args[1] )
    if target then
        if GetPlayerGuid( target ) then
            TriggerClientEvent('DeathScript:AdminRespawn', target) 
        else
            TriggerClientEvent('DeathScript:ShowNotification', source, '~r~Invalid Player')
        end
    else
        TriggerClientEvent('DeathScript:AdminRespawn', source) 
    end
end, true)
