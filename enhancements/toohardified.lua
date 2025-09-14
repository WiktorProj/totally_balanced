SMODS.Enhancement {
    key = 'toohardified',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'TooHardified',
        text = {
        [1] = 'Oh no...'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 2,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if not joker.ability.eternal and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker_enhanced')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                end
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed Joker!", colour = G.C.RED})
        end
    end
}