SMODS.Joker{ --=
    key = "equals",
    config = {
        extra = {
            source_rank_type = "all",
            target_rank = "A"
        }
    },
    loc_txt = {
        ['name'] = '=',
        ['text'] = {
            [1] = 'Every card counts as an {C:attention}Ace{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
    end,

    add_to_deck = function(self, card, from_debuff)
        -- Combine ranks effect enabled
    end,

    remove_from_deck = function(self, card, from_debuff)
        -- Combine ranks effect disabled
    end
}


local card_get_id_ref = Card.get_id
function Card:get_id()
    local original_id = card_get_id_ref(self)
    if not original_id then return original_id end

    if next(SMODS.find_card("j_totallyb_equals")) then
        return 14
    end
    return original_id
end
