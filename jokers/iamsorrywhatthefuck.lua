SMODS.Joker{ --i am sorry what the fuck
    key = "iamsorrywhatthefuck",
    config = {
        extra = {
            levels = 1000
        }
    },
    loc_txt = {
        ['name'] = 'i am sorry what the fuck',
        ['text'] = {
            [1] = 'On card trigger, {C:hearts}UPGRADE A RANDOM FUCKING POKER HAND BY 1000 LEVELS{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "totallyb_beyond",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["totallyb_totallyb_jokers"] = true },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                local available_hands = {}
        for hand, value in pairs(G.GAME.hands) do
          if value.visible and value.level >= to_big(1) then
            table.insert(available_hands, hand)
          end
        end
        local target_hand = #available_hands > 0 and pseudorandom_element(available_hands, pseudoseed('level_up_hand')) or "High Card"
                return {
                    level_up = card.ability.extra.levels,
      level_up_hand = target_hand,
                    message = localize('k_level_up_ex')
                }
        end
    end
}