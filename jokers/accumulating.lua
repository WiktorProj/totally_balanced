SMODS.Joker{ --Accumulating
    key = "accumulating",
    config = {
        extra = {
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Accumulating',
        ['text'] = {
            [1] = '{C:red}+1 Mult{} on start of round',
            [2] = '(Currently {X:red,C:white}X#1#{} Mult)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["totallyb_totallyb_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                local mult_value = card.ability.extra.mult
                card.ability.extra.mult = (card.ability.extra.mult) + 1
                return {
                    Xmult = mult_value,
                    extra = {
                        message = "+1",
                        colour = G.C.GREEN
                        }
                }
        end
    end
}