SMODS.Joker{ --oye
    key = "shitpost",
    config = {
        extra = {
            val = 1,
            totallyb_meow = 0
        }
    },
    loc_txt = {
        ['name'] = 'oye',
        ['text'] = {
            [1] = '{X:blue,C:white}+#1#{} {C:blue}Chips{}. that\'s literally it what did you expect...?'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "totallyb_funnies",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["totallyb_totallyb_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.val}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                card.ability.extra.val = (card.ability.extra.val) * 2
                play_sound("totallyb_meow")
                return {
                    message = "x2",
                    extra = {
                        chips = card.ability.extra.val,
                        colour = G.C.CHIPS
                        }
                }
        end
        if context.other_joker  then
                play_sound("totallyb_meow")
                return {
                    func = function()
                    card.ability.extra.val = (card.ability.extra.val) * 1.1
                    return true
                end,
                    message = "x1.1"
                }
        end
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_totallyb_shitpost" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
	if e.config.ref_table.config.center.key == "j_totallyb_shitpost" then
		e.config.colour = G.C.GREEN
		e.config.button = "use_card"
	else
		can_select_card_ref(e)
	end
end