SMODS.Joker{ --GarGar
    key = "gargar",
    config = {
        extra = {
            echips = 2,
            repetitions = 2,
            emult = 5
        }
    },
    loc_txt = {
        ['name'] = 'GarGar',
        ['text'] = {
            [1] = 'Acts like 2 {C:attention}Gars{}, {C:blue}^2 Chips{} and copy the effect of the joker to the left.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
    pools = { ["totallyb_totallyb_jokers"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    e_chips = card.ability.extra.echips
                ,
                    func = function()
                        for i = 1, card.ability.extra.repetitions do
              SMODS.calculate_effect({e_mult = card.ability.extra.emult}, card)
          end
                        return true
                    end
                }
            end
        end
        
        local target_joker = nil
        
        local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        target_joker = (my_pos and my_pos > 1) and G.jokers.cards[my_pos - 1] or nil
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}