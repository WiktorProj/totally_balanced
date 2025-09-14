SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end

local function load_enhancements_folder()
    local mod_path = SMODS.current_mod.path
    local enhancements_path = mod_path .. "/enhancements"
    local files = NFS.getDirectoryItemsInfo(enhancements_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("enhancements/" .. file_name))()
        end
    end
end

local function load_seals_folder()
    local mod_path = SMODS.current_mod.path
    local seals_path = mod_path .. "/seals"
    local files = NFS.getDirectoryItemsInfo(seals_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. file_name))()
        end
    end
end

local function load_rarities_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("rarities.lua"))()
end

load_rarities_file()
assert(SMODS.load_file("sounds.lua"))()
load_jokers_folder()
load_enhancements_folder()
load_seals_folder()
SMODS.ObjectType({
    key = "totallyb_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "totallyb_totallyb_jokers",
    cards = {
        ["j_totallyb_nothing"] = true,
        ["j_totallyb_money"] = true,
        ["j_totallyb_doaspin"] = true,
        ["j_totallyb_epsilon"] = true,
        ["j_totallyb_exchange"] = true,
        ["j_totallyb_extremegar"] = true,
        ["j_totallyb_fractal"] = true,
        ["j_totallyb_fractalgoblin"] = true,
        ["j_totallyb_g64"] = true,
        ["j_totallyb_gargar"] = true,
        ["j_totallyb_omega"] = true,
        ["j_totallyb_shitpost"] = true,
        ["j_totallyb_toohard"] = true,
        ["j_totallyb_unnanify"] = true,
        ["j_totallyb_whatdoiputhere"] = true
    },
})

local oldfunc = Game.main_menu
Game.main_menu = function(change_context)
    local ret = oldfunc(change_context)
    local newcard = Card(
        G.title_top.T.x,
        G.title_top.T.y,
        G.CARD_W,
        G.CARD_H,
        G.P_CARDS.empty,
        G.P_CENTERS.j_totallyb_gar,
        { bypass_discovery_center = true }
    )
    G.title_top.T.w = G.title_top.T.w * 1.7675
    G.title_top.T.x = G.title_top.T.x - 0.8
    G.title_top:emplace(newcard)
    newcard.T.w = newcard.T.w * 1.1 * 1.2
    newcard.T.h = newcard.T.h * 1.1 * 1.2
    newcard.no_ui = true
    newcard.states.visible = false

    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0,
        blockable = false,
        blocking = false,
        func = function()
            if change_context == "splash" then
                newcard.states.visible = true
                newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, true, 2.5)
            else
                newcard.states.visible = true
                newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, nil, 1.2)
            end
            return true
        end,
    }))

    return ret
end