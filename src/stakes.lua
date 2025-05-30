-- Directly pulled from SMODS code
SMODS.Stake {
    name = "White Stake",
    key = "white",
    unlocked_stake = "red",
    unlocked = true,
    applied_stakes = {},
    pos = { x = 0, y = 0 },
    sticker_pos = { x = 1, y = 0 },
    colour = G.C.WHITE,
    loc_txt = {}
}

SMODS.Stake {
    name = "Red Stake",
    key = "red",
    unlocked_stake = "green",
    applied_stakes = { "white" },
    pos = { x = 1, y = 0 },
    sticker_pos = { x = 2, y = 0 },
    modifiers = function()
        G.GAME.modifiers.no_blind_reward = G.GAME.modifiers.no_blind_reward or {}
        G.GAME.modifiers.no_blind_reward.Small = true
    end,
    colour = G.C.RED,
    loc_txt = {}
}

SMODS.Stake {
    name = "Green Stake",
    key = "green",
    unlocked_stake = "black",
    applied_stakes = { "red" },
    pos = { x = 2, y = 0 },
    sticker_pos = { x = 3, y = 0 },
    modifiers = function()
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
    end,
    colour = G.C.GREEN,
    loc_txt = {}
}

SMODS.Stake {
    name = "Black Stake",
    key = "black",
    unlocked_stake = "blue",
    applied_stakes = { "green" },
    pos = { x = 4, y = 0 },
    sticker_pos = { x = 0, y = 1 },
    modifiers = function()
        G.GAME.modifiers.enable_eternals_in_shop = true
    end,
    colour = G.C.BLACK,
    loc_txt = {}
}

SMODS.Stake {
    name = "Blue Stake",
    key = "blue",
    unlocked_stake = "purple",
    applied_stakes = { "black" },
    pos = { x = 3, y = 0 },
    sticker_pos = { x = 4, y = 0 },
    modifiers = function()
        G.GAME.starting_params.discards = G.GAME.starting_params.discards - 1
    end,
    colour = G.C.BLUE,
    loc_txt = {}
}

SMODS.Stake {
    name = "Purple Stake",
    key = "purple",
    unlocked_stake = "orange",
    applied_stakes = { "blue" },
    pos = { x = 0, y = 1 },
    sticker_pos = { x = 1, y = 1 },
    modifiers = function()
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
    end,
    colour = G.C.PURPLE,
    loc_txt = {}
}

SMODS.Stake {
    name = "Orange Stake",
    key = "orange",
    unlocked_stake = "gold",
    applied_stakes = { "purple" },
    pos = { x = 1, y = 1 },
    sticker_pos = { x = 2, y = 1 },
    modifiers = function()
        G.GAME.modifiers.enable_perishables_in_shop = true
    end,
    colour = G.C.ORANGE,
    loc_txt = {},
}

SMODS.Stake {
    name = "Gold Stake",
    key = "gold",
    applied_stakes = { "orange" },
    pos = { x = 2, y = 1 },
    sticker_pos = { x = 3, y = 1 },
    modifiers = function()
        G.GAME.modifiers.enable_rentals_in_shop = true
    end,
    colour = G.C.GOLD,
    shiny = true,
    loc_txt = {}
}