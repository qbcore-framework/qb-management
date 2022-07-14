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

client_exports {
    'AddBossMenuItem',
    'AddGangMenuItem',
    'RemoveBossMenuItem',
    'RemoveGangMenuItem'
}

server_exports {
    'AddMoney',
    'AddGangMoney',
    'RemoveMoney',
    'RemoveGangMoney',
    'GetAccount',
    'GetGangAccount',
}

lua54 'yes'
