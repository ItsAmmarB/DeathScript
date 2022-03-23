//========================================================================================================================
//                                                        COMMANDS
//------------------------------------------------------------------------------------------------------------------------
//                            MAKES SURE YOU KNOW WHAT YOU'RE DOING BEFORE YOU CHANGE ANYTHING 
//========================================================================================================================

/**
 * Nothing that you can change here, unless you know what to do
 */

if (Config.Commands.AdRev.Enabled) {
    RegisterCommand('adrev', (source, args) => {
        const Player = args[0] || source;
        if (ValidatePlayer(source, Player, 'AdRev')) {
            const Ped = GetPlayerPed(Player);
            if (GetEntityHealth(Ped) > 1) {
                if (Player === source) {
                    SendMessage(source, Config.Commands.AdRev.Messages.ToStaff.Usage)
                } else {
                    SendMessage(source, Config.Commands.AdRev.Messages.ToStaff.Alive)
                }
            } else {
                emitNet('DeathScript:Admin:Revive', Player, source, false);
                if (Player === source) {
                    SendMessage(source, Config.Commands.AdRev.Messages.ToStaff.Revived)
                } else {
                    SendMessage(source, Config.Commands.AdRev.Messages.ToStaff.Revived)
                    SendMessage(Player, Config.Commands.AdRev.Messages.ToPlayer.Revived)
                }
            }
        }
    }, Config.Commands.AdRev.PermissionReqired);
}

if (Config.Commands.AdRes.Enabled) {
    RegisterCommand('adres', (source, args) => {
        const Player = args[0] || source;
        if (ValidatePlayer(source, Player, 'AdRev')) {
            const Ped = GetPlayerPed(Player);
            if (GetEntityHealth(Ped) > 1) {
                if (Player === source) {
                    SendMessage(source, Config.Commands.AdRes.Messages.ToStaff.Usage)
                } else {
                    SendMessage(source, Config.Commands.AdRes.Messages.ToStaff.Alive)
                }
            } else {
                emitNet('DeathScript:Admin:Respawn', Player, source, false);
                if (Player === source) {
                    SendMessage(source, Config.Commands.AdRes.Messages.ToStaff.Respawned)
                } else {
                    SendMessage(source, Config.Commands.AdRes.Messages.ToStaff.Respawned)
                    SendMessage(Player, Config.Commands.AdRes.Messages.ToPlayer.Respawned)
                }
            }
        }
    }, Config.Commands.AdRes.PermissionReqired);
}

if (Config.Commands.AdRevAll.Enabled) {
    RegisterCommand('adrevall', source => {
        emitNet('DeathScript:Admin:Revive', -1, source, true);
        SendMessage(source, Config.Commands.AdRevAll.Messages.ToStaff.Revived)
    }, Config.Commands.AdRevAll.PermissionReqired);
}

if (Config.Commands.AdResAll.Enabled) {
    RegisterCommand('adresall', source => {
        emitNet('DeathScript:Admin:Respawn', -1, source, true);
        SendMessage(source, Config.Commands.AdResAll.Messages.ToStaff.Respawned)
    }, Config.Commands.AdResAll.PermissionReqired);
}

if (Config.Commands.ToggleDS.Enabled) {
    RegisterCommand('toggleds', () => {
        Config.Enabled = !Config.Enabled;
        SendMessage(-1, Config.Enabled ? Config.Commands.ToggleDS.Messages.ToggledOn : Config.Commands.ToggleDS.Messages.ToggledOff);
    }, Config.Commands.AdResAll.PermissionReqired);
}

//========================================================================================================================
//                                                        FUNCTIONS
//------------------------------------------------------------------------------------------------------------------------
//                            MAKES SURE YOU KNOW WHAT YOU'RE DOING BEFORE YOU CHANGE ANYTHING 
//========================================================================================================================

/**
 * @name ValidatePlayer 
 * @description Used to check whether the player is present in the server or not; and reply if not present or incorrect syntax was used
 * @returns {boolean} True/False
 * @example ValidatePlayer(StaffId, PlayerId, 'adrev')
 */
const ValidatePlayer = (Source, Player, Command) => {
    if (!isNaN(Player)) {
        if (GetPlayerEndpoint(Player)) {
            return true;
        } else {
            SendMessage(Source, Config.Commands[Command].Messages.ToStaff.NotFound);
        }
    } else {
        if (Player.toLowerCase() === 'all') {
            return true;
        } else {
            SendMessage(Source, Config.Commands[Command].Messages.ToStaff.IdNumber);
        }
    }
}

/**
 * @name SendMessage 
 * @description A shortcut function to emit a 'chat:addMessage' event to send a message to a specific player or all
 * @returns Returnless
 * @example SendMessage(StaffId, ['(INFO)', 'Incorrect ID!'])
 */
const SendMessage = (Recipient, MessageArgs) => Recipient === 0 ? console.log(MessageArgs.join(' ') + '^0') : emitNet('chat:addMessage', Recipient, { args: MessageArgs, multiline: true });

//========================================================================================================================
//                                                        EXPORTS
//------------------------------------------------------------------------------------------------------------------------
//                            MAKES SURE YOU KNOW WHAT YOU'RE DOING BEFORE YOU CHANGE ANYTHING 
//========================================================================================================================

exports('Revive', (PlayerId) => {
    if (!isNaN(Player)) {
        const Ped = GetPlayerPed(PlayerId);
        if (GetEntityHealth(Ped) <= 1) {
            emitNet('DeathScript:Admin:Revive', PlayerId, 0, false);
        }
    } else if (PlayerId.toLowerCase() === 'all') {
        emitNet('DeathScript:Admin:Revive', -1, 0, true);
    }
})

exports('Respawn', (PlayerId) => {
    if (!isNaN(Player)) {
        const Ped = GetPlayerPed(PlayerId);
        if (GetEntityHealth(Ped) <= 1) {
            emitNet('DeathScript:Admin:Respawn', PlayerId, 0, false);
        }
    } else if (PlayerId.toLowerCase() === 'all') {
        emitNet('DeathScript:Admin:Respawn', -1, 0, true);
    }
})