SMODS.Rarity {
    key = "error",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.05,
    badge_colour = HEX('ff0004'),
    loc_txt = {
        name = "eRRoR"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}