SMODS.Joker{ --e
    key = "e",
    config = {
        extra = {
            hypermult_n = 2,
            hypermult_arrows = 1,
            hyperchips_n = 2,
            hyperchips_arrows = 1
        }
    },
    loc_txt = {
        ['name'] = 'e',
        ['text'] = {
            [1] = 'Add an {C:attention}e{} to the {C:red}Mult{} and {C:blue}Chips{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
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
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    hypermult = {
    card.ability.extra.hypermult_arrows,
    card.ability.extra.hypermult_n
},
                    extra = {
                        hyperchips = {
    card.ability.extra.hyperchips_arrows,
    card.ability.extra.hyperchips_n
},
                        colour = G.C.DARK_EDITION
                        }
                }
        end
    end
}