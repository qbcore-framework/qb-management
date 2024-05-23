fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Kakarot'
description 'Employee management system allowing players to hire/fire other players'
version '2.1.2'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}
