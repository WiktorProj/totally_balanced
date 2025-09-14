SMODS.Joker{ --ERRO
    key = "erro",
    config = {
        extra = {
            xchips = 37,
            Xmult = 70
        }
    },
    loc_txt = {
        ['name'] = 'ERRO',
        ['text'] = {
            [1] = '{C:blue}x34 chips{} and {C:red}x70 mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.xchips,
                    message = "ER",
                    extra = {
                        Xmult = card.ability.extra.Xmult,
                            message = "RO"
                        }
                }
        end
    end
}