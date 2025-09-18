SMODS.Joker{ --Un-NaN-ify
    key = "unnanify",
    config = {
        extra = {
            emult = 1000,
            echips = 1000
        }
    },
    loc_txt = {
        ['name'] = 'Un-NaN-ify',
        ['text'] = {
            [1] = 'Instantly win the blind. Well... not really.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1e+22,
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
                    e_mult = card.ability.extra.emult,
                    extra = {
                        e_chips = card.ability.extra.echips,
                        colour = G.C.DARK_EDITION,
                        extra = {
                            balance = true,
                            colour = G.C.PURPLE
                        }
                        }
                }
        end
    end
}