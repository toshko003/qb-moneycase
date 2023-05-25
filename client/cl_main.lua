local QBCore = exports[Shared.CoreName]:GetCoreObject()

RegisterNetEvent('moneycase:openMoneyCase', function (moneyCaseInfo)
    exports['qb-menu']:openMenu({
        {
            header = Lang:t("menu.moneycase"),
            isMenuHeader = true,
        },
        {
            header = Lang:t("menu.getMoney"),
            disabled = moneyCaseInfo.info.money == nil or moneyCaseInfo.info.money == 0,
            params = {
                event = "moneycase:removeMoneyFromCase",
                args = {
                    case = moneyCaseInfo,
                }
            }
        },
        {
            header = Lang:t("menu.putMoney"),
            disabled = QBCore.Functions.GetPlayerData().money.cash == 0 or moneyCaseInfo.info.money == Shared.MaxCash,
            params = {
                event = "moneycase:addMoneyToCase",
                args = {
                    case = moneyCaseInfo,
                }
            }
        },
    })
end)

AddEventHandler('moneycase:removeMoneyFromCase', function (data)
    local dialog = exports['qb-input']:ShowInput({
        header = Lang:t("menu.getMoney"),
        submitText = Lang:t("input.getMoneyButton"),
        inputs = {
            {
                text = Lang:t("input.money"),
                name = "money",
                type = "number",
                isRequired = true,
                default = 1,
            }
        },
    })

    if not dialog then return end
    QBCore.Functions.TriggerCallback('moneycase:removeMoneyFromCase', function (success)
        if success then
            QBCore.Functions.Notify(Lang:t("notify.successWithdraw", {money = dialog.money}), 'success')
        end
    end, dialog.money, data.case)
end)

AddEventHandler('moneycase:addMoneyToCase', function(data)
    local dialog = exports['qb-input']:ShowInput({
        header = Lang:t("menu.putMoney"),
        submitText = Lang:t("input.putMoneyButton"),
        inputs = {
            {
                text = Lang:t("input.money"),
                name = "money",
                type = "number",
                isRequired = true,
                default = 1,
            }
        },
    })

    if not dialog then return end
    QBCore.Functions.TriggerCallback('moneycase:addMoneyToCase', function (success)
        if success then
            QBCore.Functions.Notify(Lang:t("notify.successDeposit", {money = dialog.money}), 'success')
        end
    end, dialog.money, data.case)
end)