SMODS.Joker{ --$$$
    key = "money",
    config = {
        extra = {
            currentmoney = 0
        }
    },
    loc_txt = {
        ['name'] = '$$$',
        ['text'] = {
            [1] = '{C:money}$x2{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
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
                    dollars = G.GAME.dollars
                }
        end
    end
}