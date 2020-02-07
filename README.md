# FiveM-DeathScript
A script that gives you revive and respawn commands to aid your RP scenario. (Adrev and Adres for Admins) - Standalone Script

# Installation:

1) Download the files and extract the folder from the zip file.
2) Copy the folder and go to your resources folder in your server's root and paste it there.
3) Go to `Server.cfg` and start the resource by adding `start FiveM-DeathScript`
4) Give you admins or whoever you want permissions to admin revive `command.adrev` and respawn `command.adres`.

# Timers:
If you wish to change the waiting time, go to the file with name of `Client.lua`, then change the numbers on:
- line 36 `local OriginalRespawnTime = 120` for the respawn waiting time.
- line 35 `local OriginalReviveTime = 240` for the revive waiting time.

# Commands:
 - revive  |  Everyone is allowed to use it.
 - respawn  |  Everyone is allowed to use it.
 - adrev  |  permission: ``adrev``
 - adres  |  permission: ``adres``
 - adrevall  |  permission: ``adrevall``
 - adresall  |  permission: ``adresall``
 - deathtoggle  |  permission: ``deathtoggle``

# Usage:
You may use and edit the script as you wish but do not redistribute it.
