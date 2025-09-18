SMODS.Joker{ --Fractal
    key = "fractal",
    config = {
        extra = {
            xchips = 6,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Fractal',
        ['text'] = {
            [1] = 'Create a copy of self, when sold destroy all Fractals, {C:blue}x8 chips{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 42,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["totallyb_totallyb_jokers"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_totallyb_fractal' })
                          if joker_card then
                              
                              
                          end
                          
                          return true
                      end
                  }))
                return {
                    x_chips = card.ability.extra.xchips,
                    extra = {
                        message = created_joker and localize('k_plus_joker') or nil,
                        colour = G.C.BLUE
                        }
                }
        end
        if context.selling_self  then
            if true then
                for i = 1, #(G.jokers and G.jokers.cards or {}) do
              SMODS.calculate_effect({func = function()
                local target_joker = nil
                for i, joker in ipairs(G.jokers.cards) do
                    if joker.config.center.key == "j_totallyb_fractal" and not joker.getting_sliced then
                        target_joker = joker
                        break
                    end
                end
                
                if target_joker then
                    if target_joker.ability.eternal then
                        target_joker.ability.eternal = nil
                    end
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                    return true
                end}, card)
          end
            end
        end
    end
}