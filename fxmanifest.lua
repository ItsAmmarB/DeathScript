--[[

[v2.1] DeathScript
Author: ItsAmmarB (Discord: ItsAmmarB#7897)
Release: 2.1

open issue card on github or on the cfx post if you have any issues/bugs/improvements.

Issues:
    - None :p

Commits:
    - Aug 29, 2019 | Initial Commit
    - Aug 30, 2019 | Minor fixes
    - Sep 22, 2019 | README.md Update
    - Feb 7, 2020 | Added Revive all & Respawn all
    - Mar 23, 2022 | DeathScript v2.0 release
    - Mar 27, 2022 | Added Keybind for AdRev & AdRes, bugs fixes, lintings

]]

-----------------------------------------------------------------

fx_version 'cerulean'

game 'gta5'

name 'DeathScript'
description 'A custom death management script that provides more RP opportunities'
author 'ItsAmmarB'
version '2.1'
url 'https://github.com/ItsAmmarB/DeathScript'

client_script {
    'cl_**.js'
}

server_script {
    'sv_**.js'
}

shared_script {
    'sh_**.js'
}