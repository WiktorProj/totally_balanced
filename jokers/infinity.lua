SMODS.Joker{ --Infinity
    key = "infinity",
    config = {
        extra = {
            hypermult_n = 10,
            hypermult_arrows = 10
        }
    },
    loc_txt = {
        ['name'] = 'Infinity',
        ['text'] = {
            [1] = '{s:2}YOU LITERALLY CANNOT LOSE.{}',
            [2] = 'Prevent {C:attention}EVERY{} game over. {C:red}10^^^^^^^^^^ Mult{}. I am not joking.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 50,
    rarity = "totallyb_infinity",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["totallyb_totallyb_jokers"] = true },
    soul_pos = {
        x = 7,
        y = 2
    },

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
                return {
                    saved = true,
                    message = localize('k_saved_ex')
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    hypermult = {
    card.ability.extra.hypermult_arrows,
    card.ability.extra.hypermult_n
}
                }
        end
    end
}