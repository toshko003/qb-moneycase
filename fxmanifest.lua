fx_version  'cerulean'
game        'gta5'
lua54       'yes'

author      'TOSHKO'
repository  'https://github.com/TOSHKO003/qb-moneycase'
description 'Money Case script for storing money in a case'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua'
}
client_scripts {
    'client/cl_main.lua'
}

server_scripts {
    'server/sv_main.lua'
}