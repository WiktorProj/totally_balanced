SMODS.Joker{ --Recursive Card
    key = "recursivecard",
    config = {
        extra = {
            y = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Recursive Card',
        ['text'] = {
            [1] = 'Create a random consumable on round end'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 12,
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
                    func = function()
      
    for i = 1, 1 do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
            play_sound('timpani')
            local sets = {'Tarot', 'Planet', 'Spectral'}
            local random_set = pseudorandom_element(sets, 'random_consumable_set')
            SMODS.add_card({ set = random_set, soulable = true, })                            
            card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                  end
                }
        end
    end
}