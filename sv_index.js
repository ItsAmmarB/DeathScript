/**
 * Soooo, few things to mention before you dive into the code:
 * fist; Yes, I know I'm not using the native way to check for ace permission, because I want the messages to be unified,
 * second; There could be some bugs, typos, or stupid and unnecessary code, just know I code at 3 am :p
 * third; if you find any bugs, typos, or stupid and unnecessary code; please do make an issue card or do a pull request if you're feeling generous
 */

// ========================================================================================================================
//                                                        COMMANDS
// ------------------------------------------------------------------------------------------------------------------------
//                            MAKES SURE YOU KNOW WHAT YOU'RE DOING BEFORE YOU CHANGE ANYTHING
// ========================================================================================================================

/**
 * Admin Revive Command
 */
if (Config.Commands.AdRev.Enabled) {
    RegisterCommand('adrev', (source, args) => {
        if (IsPlayerAceAllowed(source, 'DeathScript.AdRev')) {
            const Player = args[0] || source;
            if (ValidatePlayer(source, Player, 'AdRev')) {
                const Ped = GetPlayerPed(Player);
                if (GetEntityHealth(Ped) > 1) {
                    if (Player === source) {
                        SendMessage(source, Config.Commands.AdRev.Messages.ToStaff.Usage);
                    } else {
                        SendMessage(source, Config.Commands.AdRev.Messages.ToStaff.Alive);
                    }
                } else {
                    emitNet('DeathScript:Admin:Revive', Player, source, false);
                    if (Player === source) {
                        SendMessage(source, Config.Commands.AdRev.Messages.ToStaff.Revived);
                    } else {
                        SendMessage(source, Config.Commands.AdRev.Messages.ToStaff.Revived);
                        SendMessage(Player, Config.Commands.AdRev.Messages.ToPlayer.Revived);
                    }
                }
            }
        } else {
            SendMessage(source, Config.Commands.AdRev.Messages.ToStaff.NoPermission);
        }
    });
}

/**
 * Admin Respawn Command
 */
if (Config.Commands.AdRes.Enabled) {
    RegisterCommand('adres', (source, args) => {
        if (IsPlayerAceAllowed(source, 'DeathScript.AdRes')) {
            const Player = args[0] || source;
            if (ValidatePlayer(source, Player, 'AdRes')) {
                const Ped = GetPlayerPed(Player);
                if (GetEntityHealth(Ped) > 1) {
                    if (Player === source) {
                        SendMessage(source, Config.Commands.AdRes.Messages.ToStaff.Usage);
                    } else {
                        SendMessage(source, Config.Commands.AdRes.Messages.ToStaff.Alive);
                    }
                } else {
                    emitNet('DeathScript:Admin:Respawn', Player, source, false);
                    if (Player === source) {
                        SendMessage(source, Config.Commands.AdRes.Messages.ToStaff.Respawned);
                    } else {
                        SendMessage(source, Config.Commands.AdRes.Messages.ToStaff.Respawned);
                        SendMessage(Player, Config.Commands.AdRes.Messages.ToPlayer.Respawned);
                    }
                }
            }
        } else {
            SendMessage(source, Config.Commands.AdRes.Messages.ToStaff.NoPermission);
        }
    });
}

/**
 * Admin Revive All Command
 */
if (Config.Commands.AdRevAll.Enabled) {
    RegisterCommand('adrevall', source => {
        if (IsPlayerAceAllowed(source, 'DeathScript.AdRevAll')) {
            emitNet('DeathScript:Admin:Revive', -1, source, true);
            SendMessage(source, Config.Commands.AdRevAll.Messages.ToStaff.Revived);
        } else {
            SendMessage(source, Config.Commands.AdRevAll.Messages.ToStaff.NoPermission);
        }
    });
}

/**
 * Admin Respawn All Command
 */
if (Config.Commands.AdResAll.Enabled) {
    RegisterCommand('adresall', source => {
        if (IsPlayerAceAllowed(source, 'DeathScript.AdResAll')) {
            emitNet('DeathScript:Admin:Respawn', -1, source, true);
            SendMessage(source, Config.Commands.AdResAll.Messages.ToStaff.Respawned);
        } else {
            SendMessage(source, Config.Commands.AdResAll.Messages.ToStaff.NoPermission);
        }
    });
}

/**
 * Toggle Script Command
 */
if (Config.Commands.ToggleDS.Enabled) {
    RegisterCommand('toggleds', (source) => {
        if (IsPlayerAceAllowed(source, 'DeathScript.ToggleDS')) {
            Config.Enabled = !Config.Enabled;
            emitNet('DeathScript:Toggle', -1, Config.Enabled);
            SendMessage(-1, Config.Enabled ? Config.Commands.ToggleDS.Messages.ToggledOn : Config.Commands.ToggleDS.Messages.ToggledOff);
        } else {
            SendMessage(source, Config.Commands.ToggleDS.Messages.NoPermission);
        }
    });
}


// ========================================================================================================================
//                                                        EVENTS
// ------------------------------------------------------------------------------------------------------------------------
//                            MAKES SURE YOU KNOW WHAT YOU'RE DOING BEFORE YOU CHANGE ANYTHING
// ========================================================================================================================

onNet('DeathScript:Admin:CheckAce', (Moderator, Command) => {
    if (IsPlayerAceAllowed(Moderator, `DeathScript.${Command.toLowerCase()}`)) {
        emitNet('DeathScript:Admin:CheckAce:Return', Moderator, Moderator, Command, true);
    } else {
        emitNet('DeathScript:Admin:CheckAce:Return', Moderator, Moderator, Command, false);
    }
});

onNet('DeathScript:Admin:ValidatePlayer', (Moderator, Player, Command) => {
    if (ValidatePlayer(Moderator, Player, Command)) {
        const Ped = GetPlayerPed(Player);
        if (GetEntityHealth(Ped) > 1) {
            if (parseInt(Player) === Moderator) {
                SendMessage(Moderator, Config.Commands[Command].Messages.ToStaff.YouAlive);
            } else {
                SendMessage(Moderator, Config.Commands[Command].Messages.ToStaff.Alive);
            }
        } else {
            if (Command === 'AdRev') {
                emitNet('DeathScript:Admin:Revive', Player, Moderator, false);
            } else {
                emitNet('DeathScript:Admin:Respawn', Player, Moderator, false);
            }
            if (parseInt(Player) === Moderator) {
                SendMessage(Moderator, Config.Commands[Command].Messages.ToStaff[Command === 'AdRev' ? 'Revived' : 'Respawned']);
            } else {
                SendMessage(Moderator, Config.Commands[Command].Messages.ToStaff[Command === 'AdRev' ? 'Revived' : 'Respawned']);
                SendMessage(Player, Config.Commands[Command].Messages.ToPlayer[Command === 'AdRev' ? 'Revived' : 'Respawned']);
            }
        }
    }
});

// ========================================================================================================================
//                                                        FUNCTIONS
// ------------------------------------------------------------------------------------------------------------------------
//                            MAKES SURE YOU KNOW WHAT YOU'RE DOING BEFORE YOU CHANGE ANYTHING
// ========================================================================================================================

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
    } else if (Player.toLowerCase() === 'all') {
        return true;
    } else {
        SendMessage(Source, Config.Commands[Command].Messages.ToStaff.IdNumber);
    }
};

/**
 * @name SendMessage
 * @description A shortcut function to emit a 'chat:addMessage' event to send a message to a specific player or all
 * @returns Returnless
 * @example SendMessage(StaffId, ['(INFO)', 'Incorrect ID!'])
 */
const SendMessage = (Recipient, MessageArgs) => Recipient === 0 ? console.log(MessageArgs.join(' ') + '^0') : emitNet('chat:addMessage', Recipient, { args: MessageArgs, multiline: true });

// ========================================================================================================================
//                                                        EXPORTS
// ------------------------------------------------------------------------------------------------------------------------
//                            MAKES SURE YOU KNOW WHAT YOU'RE DOING BEFORE YOU CHANGE ANYTHING
// ========================================================================================================================

exports('Revive', (PlayerId) => {
    if (!isNaN(Player)) {
        const Ped = GetPlayerPed(PlayerId);
        if (GetEntityHealth(Ped) <= 1) {
            emitNet('DeathScript:Admin:Revive', PlayerId, 0, false);
        }
    } else if (PlayerId.toLowerCase() === 'all') {
        emitNet('DeathScript:Admin:Revive', -1, 0, true);
    }
});

exports('Respawn', (PlayerId) => {
    if (!isNaN(Player)) {
        const Ped = GetPlayerPed(PlayerId);
        if (GetEntityHealth(Ped) <= 1) {
            emitNet('DeathScript:Admin:Respawn', PlayerId, 0, false);
        }
    } else if (PlayerId.toLowerCase() === 'all') {
        emitNet('DeathScript:Admin:Respawn', -1, 0, true);
    }
});