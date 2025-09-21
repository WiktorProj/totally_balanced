SMODS.Joker{ --Gar
    key = "gar",
    config = {
        extra = {
            emult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Gar',
        ['text'] = {
            [1] = 'To the moon!!!! {C:red}^5 mult{}!!!'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
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
                    e_mult = card.ability.extra.emult
                }
        end
    end
}