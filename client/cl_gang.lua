local QBCore = exports['qb-core']:GetCoreObject()
local PlayerGang = QBCore.Functions.GetPlayerData().gang
local shownGangMenu = false
local DynamicMenuItems = {}

-- UTIL
local function CloseMenuFullGang()
    exports['qb-menu']:closeMenu()
    exports['qb-core']:HideText()
    shownGangMenu = false
end

local function comma_valueGang(amount)
    local formatted = amount
    while true do
        local k
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k == 0) then
            break
        end
    end
    return formatted
end

--//Events
AddEventHandler('onResourceStart', function(resource)--if you restart the resource
    if resource == GetCurrentResourceName() then
        Wait(200)
        PlayerGang = QBCore.Functions.GetPlayerData().gang
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerGang = QBCore.Functions.GetPlayerData().gang
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(InfoGang)
    PlayerGang = InfoGang
end)

RegisterNetEvent('qb-gangmenu:client:Stash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "boss_" .. PlayerGang.name, {
        maxweight = 4000000,
        slots = 100,
    })
    TriggerEvent("inventory:client:SetCurrentStash", "boss_" .. PlayerGang.name)
end)

RegisterNetEvent('qb-gangmenu:client:Warbobe', function()
    TriggerEvent('qb-clothing:client:openOutfitMenu')
end)

local function AddGangMenuItem(data, id)
    local menuID = id or (#DynamicMenuItems + 1)
    DynamicMenuItems[menuID] = deepcopy(data)
    return menuID
end

exports("AddGangMenuItem", AddGangMenuItem)

local function RemoveGangMenuItem(id)
    DynamicMenuItems[id] = nil
end

exports("RemoveGangMenuItem", RemoveGangMenuItem)

RegisterNetEvent('qb-gangmenu:client:OpenMenu', function()
    shownGangMenu = true
    local gangMenu = {
        {
            header = Lang:t('menu.gang_management', {value = string.upper(PlayerGang.label)}),
            icon = "fa-solid fa-circle-info",
            isMenuHeader = true,
        },
        {
            header = Lang:t("menu.manage_gang"),
            icon = "fa-solid fa-list",
            txt = Lang:t("menu.manage_gang_help"),
            params = {
                event = "qb-gangmenu:client:ManageGang",
            }
        },
        {
            header = Lang:t("menu.recruit_gang"),
            icon = "fa-solid fa-hand-holding",
            txt = Lang:t("menu.recruit_gang_help"),
            params = {
                event = "qb-gangmenu:client:HireMembers",
            }
        },
        {
            header = Lang:t("menu.gang_storage"),
            icon = "fa-solid fa-box-open",
            txt = Lang:t("menu.gang_storage_help"),
            params = {
                event = "qb-gangmenu:client:Stash",
            }
        },
        {
            header = Lang:t("menu.gang_outfits"),
            txt = Lang:t("menu.gang_outfits_help"),
            icon = "fa-solid fa-shirt",
            params = {
                event = "qb-gangmenu:client:Warbobe",
            }
        },
        {
            header = Lang:t("menu.gang_money"),
            icon = "fa-solid fa-sack-dollar",
            txt = Lang:t("menu.gang_money_help"),
            params = {
                event = "qb-gangmenu:client:SocietyMenu",
            }
        },
    }

    for _, v in pairs(DynamicMenuItems) do
        gangMenu[#gangMenu + 1] = v
    end

    gangMenu[#gangMenu + 1] = {
        header = Lang:t("menu.exit"),
        icon = "fa-solid fa-angle-left",
        params = {
            event = "qb-menu:closeMenu",
        }
    }

    exports['qb-menu']:openMenu(gangMenu)
end)

RegisterNetEvent('qb-gangmenu:client:ManageGang', function()
    local GangMembersMenu = {
        {
            header = Lang:t('menu.gang_manage', {value = string.upper(PlayerGang.label)}),
            icon = "fa-solid fa-circle-info",
            isMenuHeader = true,
        },
    }
    QBCore.Functions.TriggerCallback('qb-gangmenu:server:GetEmployees', function(cb)
        for _, v in pairs(cb) do
            GangMembersMenu[#GangMembersMenu + 1] = {
                header = v.name,
                txt = v.grade.name,
                icon = "fa-solid fa-circle-user",
                params = {
                    event = "qb-gangmenu:lient:ManageMember",
                    args = {
                        player = v,
                        work = PlayerGang
                    }
                }
            }
        end
        GangMembersMenu[#GangMembersMenu + 1] = {
            header = Lang:t("menu.return_menu"),
            icon = "fa-solid fa-angle-left",
            params = {
                event = "qb-gangmenu:client:OpenMenu",
            }
        }
        exports['qb-menu']:openMenu(GangMembersMenu)
    end, PlayerGang.name)
end)

RegisterNetEvent('qb-gangmenu:lient:ManageMember', function(data)
    local MemberMenu = {
        {
            header = Lang:t('menu.gang_manage_member', {value1 = data.player.name, value2 = string.upper(PlayerGang.label)}),
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
        },
    }
    for k, v in pairs(QBCore.Shared.Gangs[data.work.name].grades) do
        MemberMenu[#MemberMenu + 1] = {
            header = v.name,
            txt = Lang:t('menu.gang_grade', {value = k}),
            params = {
                isServer = true,
                event = "qb-gangmenu:server:GradeUpdate",
                icon = "fa-solid fa-file-pen",
                args = {
                    cid = data.player.empSource,
                    grade = tonumber(k),
                    gradename = v.name
                }
            }
        }
    end
    MemberMenu[#MemberMenu + 1] = {
        header = Lang:t("menu.gang_fire"),
        icon = "fa-solid fa-user-large-slash",
        params = {
            isServer = true,
            event = "qb-gangmenu:server:FireMember",
            args = data.player.empSource
        }
    }
    MemberMenu[#MemberMenu + 1] = {
        header = Lang:t("menu.return_menu"),
        icon = "fa-solid fa-angle-left",
        params = {
            event = "qb-gangmenu:client:ManageGang",
        }
    }
    exports['qb-menu']:openMenu(MemberMenu)
end)

RegisterNetEvent('qb-gangmenu:client:HireMembers', function()
    local HireMembersMenu = {
        {
            header = Lang:t('menu.gang_hire', {value = string.upper(PlayerGang.label)}),
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
        },
    }
    QBCore.Functions.TriggerCallback('qb-gangmenu:getplayers', function(players)
        for _, v in pairs(players) do
            if v and v ~= PlayerId() then
                HireMembersMenu[#HireMembersMenu + 1] = {
                    header = v.name,
                    txt = Lang:t('menu.gang_player', {value1 = v.citizenid, value2 = v.sourceplayer}),
                    icon = "fa-solid fa-user-check",
                    params = {
                        isServer = true,
                        event = "qb-gangmenu:server:HireMember",
                        args = v.sourceplayer
                    }
                }
            end
        end
        HireMembersMenu[#HireMembersMenu + 1] = {
            header = Lang:t("menu.return_menu"),
            icon = "fa-solid fa-angle-left",
            params = {
                event = "qb-gangmenu:client:OpenMenu",
            }
        }
        exports['qb-menu']:openMenu(HireMembersMenu)
    end)
end)

RegisterNetEvent('qb-gangmenu:client:SocietyMenu', function()
    QBCore.Functions.TriggerCallback('qb-gangmenu:server:GetAccount', function(cb)
        local SocietyMenu = {
            {
                header = Lang:t('menu.gang_balance', {value1 = comma_valueGang(cb), value2 = string.upper(PlayerGang.label)}),
                isMenuHeader = true,
                icon = "fa-solid fa-circle-info",
            },
            {
                header = Lang:t("menu.deposit"),
                icon = "fa-solid fa-money-bill-transfer",
                txt = Lang:t("menu.deposit_help"),
                params = {
                    event = "qb-gangmenu:client:SocietyDeposit",
                    args = comma_valueGang(cb)
                }
            },
            {
                header = Lang:t("menu.withdraw"),
                icon = "fa-solid fa-money-bill-transfer",
                txt = Lang:t("menu.withdraw_help"),
                params = {
                    event = "qb-gangmenu:client:SocietyWithdraw",
                    args = comma_valueGang(cb)
                }
            },
            {
                header = Lang:t("menu.return_menu"),
                icon = "fa-solid fa-angle-left",
                params = {
                    event = "qb-gangmenu:client:OpenMenu",
                }
            },
        }
        exports['qb-menu']:openMenu(SocietyMenu)
    end, PlayerGang.name)
end)

RegisterNetEvent('qb-gangmenu:client:SocietyDeposit', function(saldoattuale)
    local deposit = exports['qb-input']:ShowInput({
        header = Lang:t('menu.gang_deposit_balance', {value = saldoattuale}),
        submitText = Lang:t("menu.submitText"),
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = Lang:t("menu.amount_text")
            }
        }
    })
    if deposit then
        if not deposit.amount then return end
        TriggerServerEvent("qb-gangmenu:server:depositMoney", tonumber(deposit.amount))
    end
end)

RegisterNetEvent('qb-gangmenu:client:SocietyWithdraw', function(saldoattuale)
    local withdraw = exports['qb-input']:ShowInput({
        header = Lang:t('menu.gand_withdraw', {value = saldoattuale}),
        submitText = Lang:t("menu.submitText"),
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = Lang:t("menu.amount_text")
            }
        }
    })
    if withdraw then
        if not withdraw.amount then return end
        TriggerServerEvent("qb-gangmenu:server:withdrawMoney", tonumber(withdraw.amount))
    end
end)

-- MAIN THREAD

CreateThread(function()
    if Config.UseTarget then
        for gang, zones in pairs(Config.GangMenuZones) do
            for index, data in ipairs(zones) do
                exports['qb-target']:AddBoxZone(gang.."-GangMenu"..index, data.coords, data.length, data.width, {
                    name = gang.."-GangMenu"..index,
                    heading = data.heading,
                    -- debugPoly = true,
                    minZ = data.minZ,
                    maxZ = data.maxZ,
                }, {
                    options = {
                        {
                            type = "client",
                            event = "qb-gangmenu:client:OpenMenu",
                            icon = "fas fa-sign-in-alt",
                            label = Lang:t("menu.gang_title"),
                            canInteract = function() return gang == PlayerGang.name and PlayerGang.isboss end,
                        },
                    },
                    distance = 2.5
                })
            end
        end
    else
        while true do
            local wait = 2500
            local pos = GetEntityCoords(PlayerPedId())
            local inRangeGang = false
            local nearGangmenu = false
            if PlayerGang then
                wait = 0
                for k, menus in pairs(Config.GangMenus) do
                    for _, coords in ipairs(menus) do
                        if k == PlayerGang.name and PlayerGang.isboss then
                            if #(pos - coords) < 5.0 then
                                inRangeGang = true
                                if #(pos - coords) <= 1.5 then
                                    nearGangmenu = true
                                    if not shownGangMenu then
                                        exports['qb-core']:DrawText(Lang:t("interaction.gang_open"), 'left')
                                    end

                                    if IsControlJustReleased(0, 38) then
                                        exports['qb-core']:HideText()
                                        TriggerEvent("qb-gangmenu:client:OpenMenu")
                                    end
                                end

                                if not nearGangmenu and shownGangMenu then
                                    CloseMenuFullGang()
                                    shownGangMenu = false
                                end
                            end
                        end
                    end
                end
                if not inRangeGang then
                    Wait(1500)
                    if shownGangMenu then
                        CloseMenuFullGang()
                        shownGangMenu = false
                    end
                end
            end
            Wait(wait)
        end
    end
end)
