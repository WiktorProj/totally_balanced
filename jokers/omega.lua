SMODS.Joker{ --Omega
    key = "omega",
    config = {
        extra = {
            hypermult_n = 2,
            hypermult_arrows = 2
        }
    },
    loc_txt = {
        ['name'] = 'Omega',
        ['text'] = {
            [1] = '{E:5}Oh god... {C:red}2^^ Mult{}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 100,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["totallyb_totallyb_jokers"] = true },

    calculate = function(self, card, context)
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