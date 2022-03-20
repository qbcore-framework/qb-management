fx_version 'cerulean'
game 'gta5'

description 'qb-bossmenu'
version '2.0.0'

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

server_exports {
    'GetAccount',
    'AddMoney',
    'RemoveMoney',
    'GetGangAccount',
    'AddGangMoney',
    'RemoveGangMoney',
}

lua54 'yes'
