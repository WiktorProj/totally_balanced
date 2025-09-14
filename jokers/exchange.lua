SMODS.Joker{ --Exchange
    key = "exchange",
    config = {
        extra = {
            dollars = 40,
            xchips = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Exchange',
        ['text'] = {
            [1] = '{C:blue}x0.5 Chips{}, but {C:money}+$40{} each turn'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 16,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["totallyb_totallyb_jokers"] = true },

    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
                return {
                    dollars = card.ability.extra.dollars
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.xchips
                }
        end
    end
}