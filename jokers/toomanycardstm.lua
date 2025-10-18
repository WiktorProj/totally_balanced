SMODS.Joker{ --Too Many Cards(TM)
    key = "toomanycardstm",
    config = {
        extra = {
            repetitions = 1000
        }
    },
    loc_txt = {
        ['name'] = 'Too Many Cards(TM)',
        ['text'] = {
            [1] = 'Add 1000 {C:attention}Polychrome Lucky{} {C:hearts}Kings of Hearts{} with {C:red}Red Seal{} to the deck.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1000,
    rarity = "totallyb_funnies",
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
                for i = 1, card.ability.extra.repetitions do
              local card_front = G.P_CARDS.H_K
                local base_card = create_playing_card({
                    front = card_front,
                    center = 
      G.P_CENTERS.m_lucky
                }, G.discard, true, false, nil, true)
      base_card:set_seal("Red", true)
      base_card:set_edition("e_polychrome", true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local new_card = copy_card(base_card, nil, nil, G.playing_card)
                new_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                G.deck:emplace(new_card)
                table.insert(G.playing_cards, new_card)
                
                base_card:remove()
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        new_card:start_materialize()
                        return true
                    end
                }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
          end
            end
        end
    end
}