SMODS.Joker{ --​
    key = "nothing",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = '​',
        ['text'] = {
            [1] = '​'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 0,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["totallyb_totallyb_jokers"] = true }
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_totallyb_nothing" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
	if e.config.ref_table.config.center.key == "j_totallyb_nothing" then
		e.config.colour = G.C.GREEN
		e.config.button = "use_card"
	else
		can_select_card_ref(e)
	end
end