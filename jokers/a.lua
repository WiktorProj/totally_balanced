SMODS.Joker{ --a
    key = "a",
    config = {
        extra = {
            t = 1,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'a',
        ['text'] = {
            [1] = '{X:tarot,C:white}+#1#{} {C:tarot}Tarot Card{} (Changes every time triggered)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "totallyb_funnies",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["totallyb_totallyb_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.t}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                local t_value = card.ability.extra.t
                for i = 1, math.min(t_value, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
            play_sound('timpani')
            SMODS.add_card({ set = 'Tarot', })                            
            card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)
                card.ability.extra.t = pseudorandom('t_d5105331', 1, 10)
                return {
                    message = created_consumable and localize('k_plus_tarot') or nil
                }
        end
    end
}