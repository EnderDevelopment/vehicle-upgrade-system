fx_version 'cerulean'
game 'gta5'

name 'MechanicUpgradeSystem'
description 'QB-Core FiveM script for professional automotive upgrade system'
author 'EnderDevelopment'
version '1.0.0'

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

shared_scripts {
    'config.lua'
}

dependencies {
    'qb-core',
    'qb-target',
    'ox_lib'
}