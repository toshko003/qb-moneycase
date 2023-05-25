local Translations = {
    menu = {
        ['moneycase'] = 'Moneycase',
        ['getMoney'] = 'Take money from the moneycase',
        ['putMoney'] = 'Put money in the moneycase',
    },
    input = {
        ['money'] = 'Money ($)',
        ['getMoneyButton'] = 'Take',
        ['putMoneyButton'] = 'Put',
    },
    notify = {
        ['successDeposit'] = 'Successfully deposited $%{money} into the moneycase',
        ['successWithdraw'] = 'Successfully withdrew $%{money} from the moneycase',
        ['caseFull'] = 'The moneycase is full',
        ['caseNotEnoughMoney'] = 'The moneycase does not have enough money',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})