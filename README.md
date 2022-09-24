# [FiveM] DeathScript 
A lightweight script that helps aid players with their roleplay by providing more roleplaying opportunities and providing staff a handful of very useful commands

---

## Contributors
- [eurofra1d](https://github.com/eurofra1d)
- [ItsAmmarB](https://github.com/ItsAmmarB)

---

## Features
- Disables auto spawn while enabled.
- lightweight and quick
- Mappable keys for a quick self-revive or self-respawn. [Revive & Respawn]
- Commands to revive and respawn everyone.
- Standalone and compatible with most resources.
- Exports for external use. 

---

 ## Installation
Download the latest [release](https://github.com/ItsAmmarB/DeathScript/releases), extract the resource from the `.zip`, put the resource in the resources folder and remove the version number from the name, then add `start DeathScript` to your `server.cfg`

---

## Controls, Commands, and permissions

<details>
<summary>Revive</summary>
This command can be used to revive the player who is using it <b>ONLY</b>    
</br> </br> 

> <b>Command:</b> /revive

> <b>Keybind:</b> unbounded <br/>
_(Any player can bind it to their desired key in their controls settings within their game)_

> <b>Wait time:</b> 240 seconds <br/>
_(This can be changed by the server maintainers to their desired needs, instructions in next section)_

> <b>AcePermission:</b> Unrestricted <br/>
_(Meaning, this cannot be restricted to be used by certain players)_
</details>


<details>
 <summary>Admin Revive</summary>
 This command can be used to instantly revive the player who is using it or other players as well using their server ID
 </br> </br> 
 
> <b>Command:</b> /adrev [ID] <br/>
/adrev _(would instant revive the person using the command)_ <br/>
/adrev 8 _(would instant revive the person with the ID number 8)_

> <b>Keybind:</b> unbounded <br/>
_(Any player can bind it to their desired key in their controls settings within their game)_

> <b>AcePermission:</b> "DeathScript.AdRev" <br/>
===================================== <br/>
```add_ace identifier.fivem:63953 "DeathScript.AdRev" allow``` _(Will give the person with the "fivem:63953" identifier permission to use the admin revive command and keybind)_ <br/>
```add_ace group.admin "DeathScript.AdRev" allow``` _(Will give all players within the group "admin" permission to use the admin revive command and keybind)_ <br/>
_alternatively, you could use_ ``deny`` _instead of_ ``allow`` _to deny a player/group's permission_
</details>

<details>
 <summary>Admin Revive All</summary>
 This command can be used to revive all players instantly
</br> </br> 

> <b>Command:</b> /adrevall

> <b>AcePermission:</b> "DeathScript.AdRevAll" <br/>
===================================== <br/>
```add_ace identifier.fivem:63953 "DeathScript.AdRevAll" allow``` _(Will give the person with the "fivem:63953" identifier permission to use the admin revive all command)_ <br/>
```add_ace group.admin "DeathScript.AdRevAll" allow``` _(Will give all players within the group "admin" permission to use the admin revive all command)_ <br/>
_alternatively, you could use_ ``deny`` _instead of_ ``allow`` _to deny a player/group's permission_
</details>

<details>
 <summary>Respawn</summary>
 This command can be used to respawn the player who is using it <b>ONLY</b>
 </br> </br> 

> <b>Command:</b> /respawn

> <b>Keybind:</b> unbounded <br/>
_(Any player can bind it to their desired key in their controls settings within their game)_

> <b>Wait time:</b> 120 seconds <br/>
_(This can be changed by the server maintainers to their desired needs, instructions in next section)_

> <b>AcePermission:</b> Unrestricted <br/>
_(Meaning, this cannot be restricted to be used by certain players)_
</details>

<details>
 <summary>Admin Respawn</summary>
 This command can be used to instantly respawn the player who is using it or other players as well using their server ID
  </br> </br> 

> <b>Command:</b> /adres [ID] <br/>
/adrev _(would instant respawn the person using the command)_ <br/>
/adrev 8 _(would instant respawn the person with the ID number 8)_

> <b>Keybind:</b> unbounded <br/>
_(Any player can bind it to their desired key in their controls settings within their game)_

> <b>AcePermission:</b> "DeathScript.AdRes" <br/>
===================================== <br/>
```add_ace identifier.fivem:63953 "DeathScript.AdRes" allow``` _(Will give the person with the "fivem:63953" identifier permission to use the admin respawn command and keybind)_ <br/>
```add_ace group.admin "DeathScript.AdRes" allow``` _(Will give all players within the group "admin" permission to use the admin respawn command and keybind)_ <br/>
_alternatively, you could use_ ``deny`` _instead of_ ``allow`` _to deny a player/group's permission_
</details>

<details>
 <summary>Admin Respawn All</summary>
 This command can be used to respawn all players instantly 
 </br> </br> 

> <b>Command:</b> /adresall 

> <b>AcePermission:</b> "DeathScript.AdResAll" <br/>
===================================== <br/>
```add_ace identifier.fivem:63953 "DeathScript.AdResAll" allow``` _(Will give the person with the "fivem:63953" identifier permission to use the admin respawn all command)_ <br/>
```add_ace group.admin "DeathScript.AdResAll" allow``` _(Will give all players within the group "admin" permission to use the admin respawn all command)_ <br/>
_alternatively, you could use_ ``deny`` _instead of_ ``allow`` _to deny a player/group's permission_
</details>

<details>
 <summary>Toggle DeathScript</summary>
 This command can be used to disable the resource and allow players to automatically respawn after the set timer
 <br/><br/>

> <b>Command:</b> /toggleds

> <b>AcePermission:</b> "DeathScript.ToggleDS" <br/>
===================================== <br/>
```add_ace identifier.fivem:63953 "DeathScript.ToggleDS" allow``` _(Will give the person with the "fivem:63953" identifier permission to use the toggle command)_ <br/>
```add_ace group.admin "DeathScript.ToggleDS" allow``` _(Will give all players within the group "admin" permission to use the toggle command)_ <br/>
_alternatively, you could use_ ``deny`` _instead of_ ``allow`` _to deny a player/group's permission_
</details>


To set a keybind for command, go to `pause menu > setting > keybinds > FiveM` 
and you will find a keybind slot for every respective command that has this feature <br/>
<details>
 <summary>Click me!</summary>
 https://forum.cfx.re/uploads/default/original/4X/2/b/8/2b8aa033fdc1d5bdb722bbb8ef7c46133e3ed97b.png
</details>


---

## Timers
Aka, wait time, this is set time that the player has to wait after being unalived before they're able to use it

If you wish to change the waiting time, go to the `sh_config.js` file and you can find a variable called ``WaitTime`` or ``AutoRespawnTimer`` </br>
<details>
 <summary>Revive Timer</summary>

**line no.11**

```javascript
  WaitTime: 240, // The default wait time the player has to wait before they can use the command // TIME IN SECONDS \\
``` 
</details>

<details>
 <summary>Respawn Timer</summary>

**line no.26** 

```javascript
  WaitTime: 120, // The default wait time the player has to wait before they can use the command // TIME IN SECONDS \\
``` 
</details>

<details>
 <summary>Auto Respawn Timer</summary>
This will be effective only if the resource was to be disabled using the Toggle DeathScript command ``/toggleds``
</br></br>

**line no.27**

```javascript
AutoRespawnTimer: 10, // this will be the wait time for auto respawn when the script is toggled off using the "/toggleds" command
``` 
</details>


keep in mind, setting a lower number could decrease the effectiveness of the script, and setting a higher number could make players bored.

---

## Exports
```javascript
// Client Side

  // Ex; exports.DeathScript.Revive()
    exports('Revive', () => RevivePed(PlayerPedId())) 
  // Ex; exports.DeathScript.Respawn()
    exports('Respawn', () => RespawnPed(PlayerPedId())) 
```


```javascript
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

## Issues
-	None :p

**If you stumble upon an issue or a bug; make sure to report it by creating an issue card**

---

 > **License:** Do whatever you want just don't claim it's yours.
