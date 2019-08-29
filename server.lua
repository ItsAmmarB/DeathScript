------ MADE BY MAX F. ------
--FOR JUSTICE COMMUNITY RP--

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
            TriggerClientEvent('DeathScript:AdRev', target, source) 
        else
            TriggerClientEvent('DeathScript:ShowNotification', source, '~r~Invalid Player')
        end
    else
        TriggerClientEvent('DeathScript:AdRev', source) 
    end 
end, true)

 RegisterCommand('adres', function(source, args, rawCommand)
    local target = tonumber( args[1] )
    if target then
        if GetPlayerGuid( target ) then
            TriggerClientEvent('DeathScript:AdRes', target, source) 
        else
            TriggerClientEvent('DeathScript:ShowNotification', source, '~r~Invalid Player')
        end
    else
        TriggerClientEvent('DeathScript:AdRes', source) 
    end
 end, true)
