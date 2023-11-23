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

--//Events
AddEventHandler('onResourceStart', function(resource) --if you restart the resource
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
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'boss_' .. PlayerGang.name, {
        maxweight = 4000000,
        slots = 100,
    })
    TriggerEvent('inventory:client:SetCurrentStash', 'boss_' .. PlayerGang.name)
end)

RegisterNetEvent('qb-gangmenu:client:Warbobe', function()
    TriggerEvent('qb-clothing:client:openOutfitMenu')
end)

local function AddGangMenuItem(data, id)
    local menuID = id or (#DynamicMenuItems + 1)
    DynamicMenuItems[menuID] = deepcopy(data)
    return menuID
end

exports('AddGangMenuItem', AddGangMenuItem)

local function RemoveGangMenuItem(id)
    DynamicMenuItems[id] = nil
end

exports('RemoveGangMenuItem', RemoveGangMenuItem)

RegisterNetEvent('qb-gangmenu:client:OpenMenu', function()
    shownGangMenu = true
    local gangMenu = {
        {
            header = Lang:t('headersgang.bsm') .. string.upper(PlayerGang.label),
            icon = 'fa-solid fa-circle-info',
            isMenuHeader = true,
        },
        {
            header = Lang:t('bodygang.manage'),
            txt = Lang:t('bodygang.managed'),
            icon = 'fa-solid fa-list',
            params = {
                event = 'qb-gangmenu:client:ManageGang',
            }
        },
        {
            header = Lang:t('bodygang.hire'),
            txt = Lang:t('bodygang.hired'),
            icon = 'fa-solid fa-hand-holding',
            params = {
                event = 'qb-gangmenu:client:HireMembers',
            }
        },
        {
            header = Lang:t('bodygang.storage'),
            txt = Lang:t('bodygang.storaged'),
            icon = 'fa-solid fa-box-open',
            params = {
                event = 'qb-gangmenu:client:Stash',
            }
        },
        {
            header = Lang:t('bodygang.outfits'),
            txt = Lang:t('bodygang.outfitsd'),
            icon = 'fa-solid fa-shirt',
            params = {
                event = 'qb-gangmenu:client:Warbobe',
            }
        }
    }

    for _, v in pairs(DynamicMenuItems) do
        gangMenu[#gangMenu + 1] = v
    end

    gangMenu[#gangMenu + 1] = {
        header = Lang:t('bodygang.exit'),
        icon = 'fa-solid fa-angle-left',
        params = {
            event = 'qb-menu:closeMenu',
        }
    }

    exports['qb-menu']:openMenu(gangMenu)
end)

RegisterNetEvent('qb-gangmenu:client:ManageGang', function()
    local GangMembersMenu = {
        {
            header = Lang:t('bodygang.mempl') .. string.upper(PlayerGang.label),
            icon = 'fa-solid fa-circle-info',
            isMenuHeader = true,
        },
    }
    QBCore.Functions.TriggerCallback('qb-gangmenu:server:GetEmployees', function(cb)
        for _, v in pairs(cb) do
            GangMembersMenu[#GangMembersMenu + 1] = {
                header = v.name,
                txt = v.grade.name,
                icon = 'fa-solid fa-circle-user',
                params = {
                    event = 'qb-gangmenu:lient:ManageMember',
                    args = {
                        player = v,
                        work = PlayerGang
                    }
                }
            }
        end
        GangMembersMenu[#GangMembersMenu + 1] = {
            header = Lang:t('bodygang.return'),
            icon = 'fa-solid fa-angle-left',
            params = {
                event = 'qb-gangmenu:client:OpenMenu',
            }
        }
        exports['qb-menu']:openMenu(GangMembersMenu)
    end, PlayerGang.name)
end)

RegisterNetEvent('qb-gangmenu:lient:ManageMember', function(data)
    local MemberMenu = {
        {
            header = Lang:t('bodygang.mngpl') .. data.player.name .. ' - ' .. string.upper(PlayerGang.label),
            isMenuHeader = true,
            icon = 'fa-solid fa-circle-info',
        },
    }
    for k, v in pairs(QBCore.Shared.Gangs[data.work.name].grades) do
        MemberMenu[#MemberMenu + 1] = {
            header = v.name,
            txt = Lang:t('bodygang.grade') .. k,
            params = {
                isServer = true,
                event = 'qb-gangmenu:server:GradeUpdate',
                icon = 'fa-solid fa-file-pen',
                args = {
                    cid = data.player.empSource,
                    grade = tonumber(k),
                    gradename = v.name
                }
            }
        }
    end
    MemberMenu[#MemberMenu + 1] = {
        header = Lang:t('bodygang.fireemp'),
        icon = 'fa-solid fa-user-large-slash',
        params = {
            isServer = true,
            event = 'qb-gangmenu:server:FireMember',
            args = data.player.empSource
        }
    }
    MemberMenu[#MemberMenu + 1] = {
        header = Lang:t('bodygang.return'),
        icon = 'fa-solid fa-angle-left',
        params = {
            event = 'qb-gangmenu:client:ManageGang',
        }
    }
    exports['qb-menu']:openMenu(MemberMenu)
end)

RegisterNetEvent('qb-gangmenu:client:HireMembers', function()
    local HireMembersMenu = {
        {
            header = Lang:t('bodygang.hireemp') .. string.upper(PlayerGang.label),
            isMenuHeader = true,
            icon = 'fa-solid fa-circle-info',
        },
    }
    QBCore.Functions.TriggerCallback('qb-gangmenu:getplayers', function(players)
        for _, v in pairs(players) do
            if v and v ~= PlayerId() then
                HireMembersMenu[#HireMembersMenu + 1] = {
                    header = v.name,
                    txt = Lang:t('bodygang.cid') .. v.citizenid .. ' - ID: ' .. v.sourceplayer,
                    icon = 'fa-solid fa-user-check',
                    params = {
                        isServer = true,
                        event = 'qb-gangmenu:server:HireMember',
                        args = v.sourceplayer
                    }
                }
            end
        end
        HireMembersMenu[#HireMembersMenu + 1] = {
            header = Lang:t('bodygang.return'),
            icon = 'fa-solid fa-angle-left',
            params = {
                event = 'qb-gangmenu:client:OpenMenu',
            }
        }
        exports['qb-menu']:openMenu(HireMembersMenu)
    end)
end)

-- MAIN THREAD

CreateThread(function()
    if Config.UseTarget then
        for gang, zones in pairs(Config.GangMenuZones) do
            for index, data in ipairs(zones) do
                exports['qb-target']:AddBoxZone(gang .. '-GangMenu' .. index, data.coords, data.length, data.width, {
                    name = gang .. '-GangMenu' .. index,
                    heading = data.heading,
                    -- debugPoly = true,
                    minZ = data.minZ,
                    maxZ = data.maxZ,
                }, {
                    options = {
                        {
                            type = 'client',
                            event = 'qb-gangmenu:client:OpenMenu',
                            icon = 'fas fa-sign-in-alt',
                            label = Lang:t('targetgang.label'),
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
                                        exports['qb-core']:DrawText(Lang:t('drawtextgang.label'), 'left')
                                        shownGangMenu = true
                                    end

                                    if IsControlJustReleased(0, 38) then
                                        exports['qb-core']:HideText()
                                        TriggerEvent('qb-gangmenu:client:OpenMenu')
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
