SMODS.Rarity {
    key = "funnies",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.125,
    badge_colour = HEX('43452a'),
    loc_txt = {
        name = "funnies"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "beyond",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('c3c3c3'),
    loc_txt = {
        name = "BEYOND"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}