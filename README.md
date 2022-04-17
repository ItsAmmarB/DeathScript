# [FiveM] DeathScript 
A lightweight script that helps aid player with their roleplay by providing more roleplaying opportunities and providing staff a handful of very useful command 

---

### Contributors
- [eurofra1d](https://github.com/eurofra1d)
- [ItsAmmarB](https://github.com/ItsAmmarB)

---

### Features
- Disables auto spawn while enable.
- lightweight and quick
- Mappable keys for a quick self-revive or self-respawn. [Revive & Respawn]
- Commands to revive and respawn everyone.
- Standalone and compatible with most resources.
- Exports for external use. 

---

 ### Installation
Download the latest [release](https://github.com/ItsAmmarB/DeathScript/releases), extract the resource from the `.zip`, put the resource in the resources folder and remove the version number from the name, then add `start DeathScript` to your `server.cfg`

---

### Controls & Commands
- Revive 
    - Command: `/revive`
    - Keybind: `unbinded`
    - Wait Time: `240 seconds`    
    - AcePermission: `Unrestricted`
- Respawn 
    - Command: `/respawn`
    - Keybind: `unbinded`
    - Wait Time: `120 seconds`
    - AcePermission: `Unrestricted`
- Admin Revive 
    - Command: `/adrev [ID?]`
    - Keybind: `unbinded`
    - AcePermission: `DeathScript.AdRev`
- Admin Respawn 
    - Command: `/adres [ID?]`
    - Keybind: `unbinded`
    - AcePermission: `DeathScript.AdRes`
- Admin Revive All 
    - Command: `/adrevall`
    - AcePermission: `DeathScript.AdRevAll`
- Admin Respawn All 
    - Command: `/adresall`
    - AcePermission: `DeathScript.AdResAll`
- Toggle DeathScript 
    - Command: `/toggleds`
    - AcePermission: `DeathScript.ToggleDS`

Any player can set their own keybind by going to the `pause menu > setting > keybinds > FiveM`

---

# Timers:
If you wish to change the waiting time, go to the `sh_config.js` file and you can find a variable called `WaitTime` under both the `Revive` & `Respawn` commands:
- line 11 for the revive waiting time.
```javascript
  WaitTime: 240, // The default wait time the player has to wait before they can use the command // TIME IN SECONDS \\
``` 
- line 26 for the respawn waiting time.
```javascript
  WaitTime: 120, // The default wait time the player has to wait before they can use the command // TIME IN SECONDS \\
``` 
- line 27 for the auto respawn waiting time. _(when the script is toggled off)_
```javascript
  AutoRespawnTimer: 10, // this will be the wait time for auto respawn when the script is toggled off using the command or in line No.2
``` 
keep in mind, setting a lower number could decrease the effectiveness of its purpose, and setting a higher number could make players bored.

---

### Exports
```js
// Client Side

  // Ex; exports.DeathScript.Revive()
    exports('Revive', () => RevivePed(PlayerPedId())) 
  // Ex; exports.DeathScript.Respawn()
    exports('Respawn', () => RespawnPed(PlayerPedId())) 
```


```js
// Server Side

    // Ex; exports.DeathScript.Revive(2) /|\ exports.DeathScript.Revive('All')
    exports('Revive', (PlayerId) => {
        if (!isNaN(Player)) {
            const Ped = GetPlayerPed(PlayerId);
            if(GetEntityHealth(Ped) <= 1) {
                emitNet('DeathScript:Admin:Revive', PlayerId, 0, false);
            }
        } else if (PlayerId.toLowerCase() === 'all') {
            emitNet('DeathScript:Admin:Revive', -1, 0, true);
        }
    })
    
    // Ex; exports.DeathScript.Respawn(2) /|\ exports.DeathScript.Respawn('All')
    exports('Respawn', (PlayerId) => {
        if (!isNaN(Player)) {
            const Ped = GetPlayerPed(PlayerId);
            if(GetEntityHealth(Ped) <= 1) {
                emitNet('DeathScript:Admin:Respawn', PlayerId, 0, false);
            }
        } else if (PlayerId.toLowerCase() === 'all') {
            emitNet('DeathScript:Admin:Respawn', -1, 0, true);
        }
    })
```

---

### Issues
-	None :p

**If you stumbled upon an issue or a bug; make sure to report it by creating an issue card**

---

 > **License:** Do what ever you want just don't claim it's yours.
