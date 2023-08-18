local QBCore = exports[Shared.CoreName]:GetCoreObject()

QBCore.Functions.CreateUseableItem("moneycase", function(source, item)
    local player = QBCore.Functions.GetPlayer(source)
    if not player then return end

    if player.Functions.GetItemBySlot(item.slot) then
        TriggerClientEvent('moneycase:openMoneyCase', source, item)
    end
end)

QBCore.Functions.CreateCallback('moneycase:addMoneyToCase', function (source, cb, amount, moneyCase)
    local player = QBCore.Functions.GetPlayer(source)

    if not player or not amount or not moneyCase then return end

    player.PlayerData.items[moneyCase.slot].info.money = player.PlayerData.items[moneyCase.slot].info.money or 0

    if player.PlayerData.items[moneyCase.slot].info.money + amount > Shared.MaxCash then
        TriggerClientEvent('QBCore:Notify', source, Lang:t("notify.caseFull"), 'error')
        return
    end

    if player.PlayerData.money.cash - amount < 0 then
        TriggerClientEvent('QBCore:Notify', source, Lang:t("notify.playerNotEnoughMoney"), 'error')
        return
    end

    player.PlayerData.items[moneyCase.slot].info.money += amount
    player.Functions.SetInventory(player.PlayerData.items)

    player.Functions.RemoveMoney('cash', amount)

    cb(true)
end)

QBCore.Functions.CreateCallback('moneycase:removeMoneyFromCase', function (source, cb, amount, moneyCase)
    local player = QBCore.Functions.GetPlayer(source)

    if not player or not amount or not moneyCase then return end

    if player.PlayerData.items[moneyCase.slot].info.money - amount < 0 then
        TriggerClientEvent('QBCore:Notify', source, Lang:t("notify.caseNotEnoughMoney"), 'error')
        return
    end

    player.PlayerData.items[moneyCase.slot].info.money -= amount
    player.Functions.SetInventory(player.PlayerData.items)

    player.Functions.AddMoney('cash', amount)

    cb(true)
end)