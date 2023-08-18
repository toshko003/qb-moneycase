local Translations = {
    menu = {
        ['moneycase'] = 'Куфар',
        ['getMoney'] = 'Вземи пари от куфара',
        ['putMoney'] = 'Сложи пари в куфара',
    },
    input = {
        ['money'] = 'Пари ($)',
        ['getMoneyButton'] = 'Вземи',
        ['putMoneyButton'] = 'Сложи',
    },
    notify = {
        ['successDeposit'] = 'Успешно сложихте $%{money} в куфара',
        ['successWithdraw'] = 'Успешно взехте $%{money} от куфара',
        ['caseFull'] = 'Куфарът е пълен',
        ['caseNotEnoughMoney'] = 'Куфарът няма толкова пари',
        ['playerNotEnoughMoney'] = 'Нямате толкова пари',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})