SMODS.Joker{ --dont
    key = "dont",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'dont',
        ['text'] = {
            [1] = 'Instantly lose the run when bought.',
            [2] = 'This is a {C:common}Common{} so you will definitely see this.',
            [3] = '{s:0.8}Right?{}',
            [4] = '{s:0.6}You will see this?{}',
            [5] = '{s:0.4}Maybe?{}',
            [6] = '{s:0.2}Please?{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["totallyb_totallyb_jokers"] = true },

    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
                return {
                    func = function()
                
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        if G.STAGE == G.STAGES.RUN then 
                          G.STATE = G.STATES.GAME_OVER
                          G.STATE_COMPLETE = false
                        end
                    end
                }))
                
                return true
            end
                }
        end
    end
}