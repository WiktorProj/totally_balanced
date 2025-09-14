SMODS.Seal {
    key = 'voidseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            x_mult = 0.75,
            x_chips = 3
        }
    },
    badge_colour = HEX('000000'),
   loc_txt = {
        name = 'Void Seal',
        label = 'Void Seal',
        text = {
        [1] = '{C:red}x0.75 Mult{} but {C:blue}x3 chips{}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { x_mult = card.ability.seal.extra.x_mult, x_chips = card.ability.seal.extra.x_chips }
        end
    end
}