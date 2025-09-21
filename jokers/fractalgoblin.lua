SMODS.Joker{ --Fractal Goblin
    key = "fractalgoblin",
    config = {
        extra = {
            Xmult = 7,
            odds = 13,
            start_dissolve = 0,
            n = 0,
            totallyb_tawww = 0
        }
    },
    loc_txt = {
        ['name'] = 'Fractal Goblin',
        ['text'] = {
            [1] = '{E:1}Taw{}{s:0.75,E:1}w{}{s:0.6,E:1}w{}{s:0.5,E:1}w{}{E:1}...{} {C:red}x7 Mult{}, {C:green}1 in 13{} chance to destroy self.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
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

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    Xmult = card.ability.extra.Xmult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_b38ce298', 1, card.ability.extra.odds, 'j_totallyb_fractalgoblin', false) then
              play_sound("totallyb_tawww")
                        SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
          end
                        return true
                    end
                }
            end
        end
    end
}