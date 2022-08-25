local Translations = {
    notify = {
        boss_withdraw = "You have withdrawn: $%{value}",
        not_enough_money = "You dont have enough money in the account!",
        money_deposit = "You have deposited: $%{value}",
        not_enough_moneyy = "You dont have enough money to add!",
        no_promotion = "You cannot promote to this rank!",
        player_promoted = "Sucessfulluy promoted!",
        player_ptomote_info = "You have been promoted to %{value}.",
        invalide_grade = "Promotion grade does not exist.",
        not_in_city = "Civilian not in city.",
        cannot_fire = "You cannot fire this citizen!",
        citizen_fired = "Employee fired!",
        gang_fired = "Gang Member fired!",
        citizen_fired_self = "You have been fired! Good luck.",
        gang_fired_self = "You have been expelled from the gang!",
        error = "Error..",
        cant_fire_self = "You can\'t fire yourself",
        cant_leave_gang = "You can\'t kick yourself out of the gang!",
        hire_success = "You have hired %{value1} as a %{value2}",
        hire_gang_success = "You have added %{value1} to the gang as %{value2}.",
        hire_success_self = "You were hired as %{value}",
        hire_gang_self  = "You have been hired as %{value}",
    },
    menu = {
        title = "Boss Menu - %{value}",
        manage_empl = "Manage Employees",
        manage_empl_help = "Check your Employees List",
        hire_empl = "Hire Employees",
        hire_empl_help = "Hire Nearby Civilians",
        storage = "Storage Access",
        storage_help = "Open Storage",
        outfits = "Outfits",
        outfits_help = "See Saved Outfits",
        money_mgt = "Money Management",
        money_mgt_help = "Check your Company Balance",
        exit = "Exit",
        mgt_empl = "Manage Employees - %{value}",
        return_menu = "Return",
        manage_player = "Manage %{value1} - %{value2}",
        player_grade = "Grade: %{value}",
        fire_empl = "Fire Employee",
        hire_emplyee = "Hire Employees - %{value}",
        citizen_id = "Citizen ID: %{value1} - ID: %{value2}",
        balance = "Balance: $%{value1} - %{value2}",
        deposit = "Deposit",
        deposit_help = "Deposit Money into account",
        withdraw = "Withdraw",
        withdraw_help = "Withdraw Money from account",
        deposit_balance = "Deposit Money <br> Available Balance: $%{value}",
        submitText = "Confirm",
        amount_text = "Amount",
        withdraw_balance = "Withdraw Money <br> Available Balance: $%{value}",
        box_title = "Boss Menu",
        gang_management = "Gang Management  - %{value}",
        manage_gang = "Manage Gang Members",
        manage_gang_help = "Recruit or Fire Gang Members",
        recruit_gang = "Recruit Members",
        recruit_gang_help = "Hire Gang Members",
        gang_storage = "Storage Access",
        gang_storage_help = "Open Gang Stash",
        gang_outfits = "Outfits",
        gang_outfits_help = "Change Clothes",
        gang_money = "Money Management",
        gang_money_help = "Check your Gang Balance",
        gang_manage = "Manage Gang Members - %{value}",
        gang_manage_member = "Manage %{value1} - %{value2}",
        gang_grade = "Grade: %{value}",
        gang_fire = "Fire",
        gang_hire = "Hire Gang Members - %{value}",
        gang_player = "Citizen ID: %{value1} - ID: %{value2}",
        gang_balance = "Balance: $%{value1} - %{value2}",
        gang_deposit_balance = "Deposit Money <br> Available Balance: $%{value}",
        gand_withdraw = "Withdraw Money <br> Available Balance: $%{value}",
        gang_title = "Gang Menu",      
    },
    interaction = {
        gang_open = "[E] Open Gang Management",
        job_management = "[E] Open Job Management",
    },
    actions = {
        player_droped_exp = "You were permanently banned by the server for: Exploiting",
    },

}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})