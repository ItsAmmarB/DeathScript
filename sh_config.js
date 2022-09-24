// eslint-disable-next-line no-unused-vars
const Config = {
    Enabled: true, // Weather is the resource enabled by default or has to be toggle on manually using the "ToggleDS" command.
    Commands: {
        Revive: {
            Enabled: true, // Weather is the command enabled, cannot be toggle from in-game
            Keybind: {
                Enabled: true, // Weather the command's keybind is enabled or not, cannot be toggle from in-game
                DefaultKeybind: '' // The default keybind, every play can customize it to their own preference
            },
            WaitTime: 240, // The default wait time the player has to wait before they can use the command // TIME IN SECONDS \\
            Messages: { // The messages use in the command, I don't think you have to touch anything, but; you do you
                Revive: ['^1(INFO)^0', ' ^4You were revived.^0'],
                Alive: ['^1(INFO)^0', ' ^1You are alive.^0']
            },
            Suggestion: { // The suggestion or the text box that shows when you type the command, it will help people who aren't familiar with the command's usage, and I doubt you'd need to change anything here
                name: '/revive', help: 'Revive yourself after revive timer is out.'
            }
        },
        Respawn: {
            Enabled: true, // Weather is the command enabled, cannot be toggle from in-game
            Keybind: {
                Enabled: true, // Weather the command's keybind is enabled or not, cannot be toggle from in-game
                DefaultKeybind: '' // The default keybind, every play can customize it to their own preference
            },
            WaitTime: 120, // The default wait time the player has to wait before they can use the command // TIME IN SECONDS \\
            AutoRespawnTimer: 10, // this will be the wait time for auto respawn when the script is toggled off using the "/toggleds" command
            Messages: { // The messages use in the command, I don't think you have to touch anything, but; you do you
                Respawn: ['^1(INFO)^0', ' ^4You respawned.^0'],
                Alive: ['^1(INFO)^0', ' ^1You are alive.^0']
            },
            Suggestion: { // The suggestion or the text box that shows when you type the command, it will help people who aren't familiar with the command's usage, and I doubt you'd need to change anything here
                name: '/respawn', help: 'Respawn yourself after respawn timer is out.'
            }
        },
        AdRev: {
            Enabled: true, // Weather is the command enabled, cannot be toggle from in-game
            PermissionReqired: true, // self-explanatory, AcePermissions by default, permission node is "DeathScript.AdRev"
            Keybind: {
                Enabled: true, // Weather the command's keybind is enabled or not, cannot be toggle from in-game
                DefaultKeybind: '' // The default keybind, every play can customize it to their own preference
            },
            Messages: { // The messages use in the command, I don't think you have to touch anything, but; you do you
                ToPlayer: { // The messages directed to the player targeted by the staff member or the player who is using the command
                    Revived: ['^1(INFO)^0', ' ^4You have been revived by a staff member.^0']
                },
                ToStaff: { // The messages directed to the staff or the player who is using the command
                    Revived: ['^1(INFO)^0', ' ^4Player has been revived.^0'],
                    Alive: ['^1(INFO)^0', '  ^0Player is alive.^0'],
                    YouAlive: ['^1(INFO)^0', '  ^0You are alive!^0'],
                    NotFound: ['^1(INFO)^0', ' ^1Player was not found.^0'],
                    IdNumber: ['^1(INFO)^0', ' ^1Player ID must be a number.^0'],
                    NoPermission: ['^1(INFO)^0', ' ^1Insufficient  permissions^0'],
                    Cooldown: ['^1(INFO)^0', '^0A little too fast over there!^0'],
                    Usage: ['^1(INFO)^0', ' ^0Usage: /adrev [PLAYER ID]^0']
                }
            },
            Suggestion: { // The suggestion or the text box that shows when you type the command, it will help people who aren't familiar with the command's usage, and I doubt you'd need to change anything here
                name: '/adrev', help: 'Admin revive someone instantly.',
                Params: [
                    { name: 'ID', help: 'Player ID or leave blank to revive yourself' }
                ]
            }
        },
        AdRes: {
            Enabled: true, // Weather is the command enabled, cannot be toggle from in-game
            PermissionReqired: true, // self-explanatory, AcePermissions by default, permission node is "DeathScript.AdRes"
            Keybind: {
                Enabled: true, // Weather the command's keybind is enabled or not, cannot be toggle from in-game
                DefaultKeybind: '' // The default keybind, every play can customize it to their own preference
            },
            Messages: { // The messages use in the command, I don't think you have to touch anything, but; you do you
                ToPlayer: { // The messages directed to the player targeted by the staff member or the player who is using the command
                    Respawned: ['^1(INFO)^0', ' ^4You have been respawned by a staff member.^0']
                },
                ToStaff: { // The messages directed to the staff or the player who is using the command
                    Respawned: ['^1(INFO)^0', ' ^4Player  has been respawned.^0'],
                    Alive: ['^1(INFO)^0', ' ^0Player is alive.^0'],
                    YouAlive: ['^1(INFO)^0', ' ^0You are alive!^0'],
                    NotFound: ['^1(INFO)^0', ' ^1Player was not found.^0'],
                    IdNumber: ['^1(INFO)^0', ' ^1Player ID must be a number.^0'],
                    NoPermission: ['^1(INFO)^0', ' ^1Insufficient  permissions^0'],
                    Cooldown: ['^1(INFO)^0', '^0A little too fast over there!^0'],
                    Usage: ['^1(INFO)^0', ' ^0Usage: /adres [PLAYER ID]^0']
                }
            },
            Suggestion: { // The suggestion or the text box that shows when you type the command, it will help people who aren't familiar with the command's usage, and I doubt you'd need to change anything here
                name: '/adres', help: 'Admin respawn someone instantly.',
                Params: [
                    { name: 'ID', help: 'Player ID or leave blank to respawn yourself' }
                ]
            }
        },
        AdRevAll: {
            Enabled: true, // Weather is the command enabled, cannot be toggle from in-game
            PermissionReqired: true, // self-explanatory, AcePermissions by default, permission node is "DeathScript.AdRevAll"
            Messages: { // The messages use in the command, I don't think you have to touch anything, but; you do you
                ToPlayer: { // The messages directed to the player targeted by the staff member or the player who is using the command
                    Revived: ['^1(INFO)^0', ' ^4You have been revived by a staff member.^0']
                },
                ToStaff: { // The messages directed to the staff or the player who is using the command
                    NoPermission: ['^1(INFO)^0', ' ^1Insufficient  permissions^0'],
                    Revived: ['^1(INFO)^0', ' ^4All dead players were revived.^0']
                }
            },
            Suggestion: { // The suggestion or the text box that shows when you type the command, it will help people who aren't familiar with the command's usage, and I doubt you'd need to change anything here
                name: '/adrevall', help: 'Admin revive everyone instantly.'
            }
        },
        AdResAll: {
            Enabled: true, // Weather is the command enabled, cannot be toggle from in-game
            PermissionReqired: true, // self-explanatory, AcePermissions by default, permission node is "DeathScript.AdResAll"
            Messages: { // The messages use in the command, I don't think you have to touch anything, but; you do you
                ToPlayer: { // The messages directed to the player targeted by the staff member or the player who is using the command
                    Respawned: ['^1(INFO)^0', ' ^4You have been respawned by a staff member.^0']
                },
                ToStaff: { // The messages directed to the staff or the player who is using the command
                    NoPermission: ['^1(INFO)^0', ' ^1Insufficient  permissions^0'],
                    Respawned: ['^1(INFO)^0', ' ^4All dead players were respawned.^0']
                }
            },
            Suggestion: { // The suggestion or the text box that shows when you type the command, it will help people who aren't familiar with the command's usage, and I doubt you'd need to change anything here
                name: '/adresall', help: 'Admin respawn everyone instantly.'
            }
        },
        ToggleDS: {
            Enabled: true, // Weather is the command enabled, cannot be toggle from in-game
            PermissionReqired: true, // self-explanatory, AcePermissions by default, permission node is "DeathScript.ToggleDS"
            Messages: { // The messages use in the command, I don't think you have to touch anything, but; you do you
                NoPermission: ['^1(INFO)^0', ' ^1Insufficient  permissions^0'],
                ToggledOn: ['^1(INFO)^0', ' ^0DeathScript has been toggle on!^0'],
                ToggledOff: ['^1(INFO)^0', ' ^0DeathScript has been toggle off!^0']
            },
            Suggestion: { // The suggestion or the text box that shows when you type the command, it will help people who aren't familiar with the command's usage, and I doubt you'd need to change anything here
                name: '/toggleds', help: 'Toggles DeathScript on/off.'
            }
        }
    },


    GoToClouds: true, // Weather when the player respawn by either "/Respawn" or "/AdRes" they get send to the sky then back, no performance impacts, just a pure visual improvement
    /**
     * The hospitals recognized by default, this will be used when a player is respawned, they will be teleported to the nearest one to them
     * you can add more hospitals using this format: [X, Y, Z, Heading]
     */
    Hospitals: [
        { X: 296.21, Y: -1447.39, Z: 30.4, Heading: 320.02, Name: 'Central LS Medical Center' },
        { X: 298.38, Y: -584.36, Z: 44, Heading: 74.56, Name: 'Pillbox Hill Medical Center' },
        { X: -449.01, Y: -340.66, Z: 35, Heading: 79.78, Name: 'Mount Zonah Medical Center' },
        { X: 1839.03, Y: 3672.32, Z: 35, Heading: 208.24, Name: 'Sandy Shores Medical Center' },
        { X: -247.07, Y: 6330.2, Z: 33, Heading: 227.3, Name: 'Paleto Bay Medical Center' }
    ],
    Sounds: { // The sounds used in this resource, please no touchy touchy
        Warning: [-1, 'HACKING_CLICK', 0, 1]
    }
};