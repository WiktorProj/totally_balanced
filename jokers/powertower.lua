SMODS.Joker{ --Power Tower
    key = "powertower",
    config = {
        extra = {
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Power Tower',
        ['text'] = {
            [1] = 'Create a {C:attention}Gar{} if has one. {E:1}(Needs to have room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
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

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_totallyb_gar" then
              return true
          end
      end
      return false
  end)() then
                local created_joker = false
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        created_joker = true
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_totallyb_gar' })
                          if joker_card then
                              
                              
                          end
                          G.GAME.joker_buffer = 0
                          return true
                      end
                  }))
                  end
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            end
        end
    end
}