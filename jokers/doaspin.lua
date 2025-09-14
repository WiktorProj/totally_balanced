SMODS.Joker{ --Do a Spin!
    key = "doaspin",
    config = {
        extra = {
            scale = 1,
            rotation = 2,
            onetime = 0
        }
    },
    loc_txt = {
        ['name'] = 'Do a Spin!',
        ['text'] = {
            [1] = 'Swap {C:blue}Chips{} and {C:red}Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["totallyb_totallyb_jokers"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                local target_card = context.other_card
                return {
                    swap = true,
                    extra = {
                        func = function()
                      card:juice_up(card.ability.extra.scale, card.ability.extra.rotation)
                      return true
                    end,
                        colour = G.C.WHITE
                        }
                }
        end
    end
}