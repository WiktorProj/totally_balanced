SMODS.Consumable {
    key = 'nil',
    set = 'Tarot',
    pos = { x = 0, y = 0 },
    config = { extra = {
        edition_amount = 1
    } },
    loc_txt = {
        name = 'nil',
        text = {
        [1] = '{C:dark_edition, E:1}???{}'
    }
    },
    cost = 0,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            for i = 1, #(G.jokers and G.jokers.cards or {}) do
              
                if #G.jokers.cards > 1 then
  G.jokers:unhighlight_all()
  G.E_MANAGER:add_event(Event({
      trigger = 'before',
      func = function()
          G.E_MANAGER:add_event(Event({
              func = function()
                  G.jokers:shuffle('aajk')
                  play_sound('cardSlide1', 0.85)
                  return true
              end,
          }))
          delay(0.15)
          G.E_MANAGER:add_event(Event({
              func = function()
                  G.jokers:shuffle('aajk')
                  play_sound('cardSlide1', 1.15)
                  return true
              end
          }))
          delay(0.15)
          G.E_MANAGER:add_event(Event({
              func = function()
                  G.jokers:shuffle('aajk')
                  play_sound('cardSlide1', 1)
                  return true
              end
          }))
        delay(0.5)
        return true
      end
    }))
  end
                local jokers_to_edition = {}
            local eligible_jokers = {}
            
            if 'editionless' == 'editionless' then
                eligible_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
            else
                for _, joker in pairs(G.jokers.cards) do
                    if joker.ability.set == 'Joker' then
                        eligible_jokers[#eligible_jokers + 1] = joker
                    end
                end
            end
            
            if #eligible_jokers > 0 then
                local temp_jokers = {}
                for _, joker in ipairs(eligible_jokers) do 
                    temp_jokers[#temp_jokers + 1] = joker 
                end
                
                pseudoshuffle(temp_jokers, 76543)
                
                for i = 1, math.min(card.ability.extra.edition_amount, #temp_jokers) do
                    jokers_to_edition[#jokers_to_edition + 1] = temp_jokers[i]
                end
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            for _, joker in pairs(jokers_to_edition) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, 'random edition')
                        joker:set_edition(edition, true)
                        return true
                    end
                }))
            end
            delay(0.6)
                G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      local new_joker = SMODS.add_card({ set = 'Joker' })
                      if new_joker then
                      end
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
          end
    end,
    can_use = function(self, card)
        return true
    end
}