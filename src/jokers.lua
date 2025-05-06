--- Notes:
---
--- 1. This mod will use the default Joker atlas for convenience and to not redistribute Balatro assets.
--- It is recommended that you include your own atlas. Check the SMODS documentation or example mods for more info.
---
--- 2. Unlike some vanilla jokers that put values in card.ability, these will all use card.ability.extra as it's best practice for modded jokers.
---
--- 3. The objective is not to recreate vanilla code 1-to-1 but to highlight best practices. So while effects should be practically the same, there might be some small differences.

-- Joker
SMODS.Joker {
    key = "joker",
    pos = { x = 0, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 2,
    config = { extra = { mult = 4 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Greedy Joker
SMODS.Joker {
    key = "greedy_joker",
    pos = { x = 6, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { s_mult = 3, suit = 'Diamonds' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                mult = card.ability.extra.s_mult
            }
        end
    end
}

-- Lusty Joker
SMODS.Joker {
    key = "lusty_joker",
    pos = { x = 7, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { s_mult = 3, suit = 'Hearts' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                mult = card.ability.extra.s_mult
            }
        end
    end
}

-- Wrathful Joker
SMODS.Joker {
    key = "wrathful_joker",
    pos = { x = 8, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { s_mult = 3, suit = 'Spades' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                mult = card.ability.extra.s_mult
            }
        end
    end
}

-- Gluttonous Joker
SMODS.Joker {
    key = "gluttenous_joker", -- (sic)
    pos = { x = 9, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { s_mult = 3, suit = 'Clubs' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                mult = card.ability.extra.s_mult
            }
        end
    end
}

-- Jolly Joker
SMODS.Joker {
    key = "jolly",
    pos = { x = 2, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 3,
    config = { extra = { t_mult = 8, type = 'Pair' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_mult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = card.ability.extra.t_mult
            }
        end
    end
}

-- Zany Joker
SMODS.Joker {
    key = "zany",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 3, y = 0 },
    config = { extra = { t_mult = 12, type = 'Three of a Kind' } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_mult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = card.ability.extra.t_mult
            }
        end
    end
}

-- Mad Joker
SMODS.Joker {
    key = "mad",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 4, y = 0 },
    config = { extra = { t_mult = 10, type = 'Two Pair' } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_mult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = card.ability.extra.t_mult
            }
        end
    end
}

-- Crazy Joker
SMODS.Joker {
    key = "crazy",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 5, y = 0 },
    config = { extra = { t_mult = 12, type = 'Straight' } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_mult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = card.ability.extra.t_mult
            }
        end
    end
}

-- Droll Joker
SMODS.Joker {
    key = "droll",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 6, y = 0 },
    config = { extra = { t_mult = 10, type = 'Flush' } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_mult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = card.ability.extra.t_mult
            }
        end
    end
}

-- Sly Joker
SMODS.Joker {
    key = "sly",
    blueprint_compat = true,
    rarity = 1,
    cost = 3,
    pos = { x = 0, y = 14 },
    config = { extra = { t_chips = 50, type = 'Pair' } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_chips, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                chips = card.ability.extra.t_chips
            }
        end
    end
}

-- Wily Joker
SMODS.Joker {
    key = "wily",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    config = { extra = { t_chips = 100, type = 'Three of a Kind' } },
    pos = { x = 1, y = 14 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_chips, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                chips = card.ability.extra.t_chips
            }
        end
    end
}

-- Clever Joker
SMODS.Joker {
    key = "clever",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    config = { extra = { t_chips = 80, type = 'Two Pair' } },
    pos = { x = 2, y = 14 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_chips, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                chips = card.ability.extra.t_chips
            }
        end
    end
}

-- Devious Joker
SMODS.Joker {
    key = "devious",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    config = { extra = { t_chips = 100, type = 'Straight' } },
    pos = { x = 3, y = 14 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_chips, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                chips = card.ability.extra.t_chips
            }
        end
    end
}

-- Crafty Joker
SMODS.Joker {
    key = "crafty",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    config = { extra = { t_chips = 80, type = 'Flush' } },
    pos = { x = 4, y = 14 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_chips, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                chips = card.ability.extra.t_chips
            }
        end
    end
}

-- Half Joker
-- TODO: Add size fix
SMODS.Joker {
    key = "half",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 7, y = 0 },
    config = { extra = { mult = 20, size = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.size } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and #context.full_hand <= card.ability.extra.size then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Joker Stencil
SMODS.Joker {
    key = "stencil",
    blueprint_compat = true,
    rarity = 2,
    cost = 8,
    pos = { x = 2, y = 5 },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.jokers and math.max(1, (G.jokers.config.card_limit - #G.jokers.cards) + #SMODS.find_card("j_vremade_stencil", true)) or 1 } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = math.max(1,
                    (G.jokers.config.card_limit - #G.jokers.cards) + #SMODS.find_card("j_vremade_stencil", true))
            }
        end
    end
}

-- Four Fingers
SMODS.Joker {
    key = "four_fingers",
    blueprint_compat = false,
    rarity = 2,
    cost = 7,
    pos = { x = 6, y = 6 },
}

SMODS.PokerHandPart:take_ownership('_straight',
    {
        func = function(hand)
            return get_straight(hand,
                (next(SMODS.find_card('j_four_fingers')) or next(SMODS.find_card('j_vremade_four_fingers'))) and 4 or 5,
                not not (next(SMODS.find_card('j_shortcut')) or next(SMODS.find_card('j_vremade_shortcut')))
            )
        end,
    },
    true
)

-- I wish there was a better solution than this
function get_flush(hand, min_length)
    local ret = {}
    local suits = SMODS.Suit.obj_buffer
    min_length = min_length or 5
    if min_length < 2 then min_length = 2 end
    if #hand < min_length then
        return ret
    else
        for j = 1, #suits do
            local t = {}
            local suit = suits[j]
            local flush_count = 0
            for i = 1, #hand do
                if hand[i]:is_suit(suit, nil, true) then
                    flush_count = flush_count + 1; t[#t + 1] = hand[i]
                end
            end
            if flush_count >= min_length then
                table.insert(ret, t)
                return ret
            end
        end
        return {}
    end
end

SMODS.PokerHandPart:take_ownership('_flush',
    {
        func = function(hand)
            return get_flush(hand,
                (next(SMODS.find_card('j_four_fingers')) or next(SMODS.find_card('j_vremade_four_fingers'))) and 4 or 5
            )
        end,
    },
    true
)

-- Mime
SMODS.Joker {
    key = "mime",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 4, y = 1 },
    config = { extra = { repetitions = 1 } },
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1) then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
    end
}

-- Credit Card
SMODS.Joker {
    key = "credit_card",
    blueprint_compat = false,
    rarity = 1,
    cost = 1,
    pos = { x = 5, y = 1 },
    config = { extra = { bankrupt_at = 20 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.bankrupt_at } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.bankrupt_at
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.bankrupt_at
    end
}

------- WIP ----------------------------------------------------------------

-- Ceremonial Dagger
SMODS.Joker {
    key = "ceremonial",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 5, y = 5 },
    config = { mult = 0 }
}

-- Banner
SMODS.Joker {
    key = "banner",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 1, y = 2 },
    config = { extra = 30 }
}

-- Mystic Summit
SMODS.Joker {
    key = "mystic_summit",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 2, y = 2 },
    config = { extra = { mult = 15,
        d_remaining = 0 } }
}

-- Marble Joker
SMODS.Joker {
    key = "marble",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 3, y = 2 },
    config = { extra = 1 }
}

-- Loyalty Card
SMODS.Joker {
    key = "loyalty_card",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 4, y = 2 },
    config = { extra = { Xmult = 4,
        every = 5,
        remaining = "5 remaining" } }
}

-- 8 Ball
SMODS.Joker {
    key = "8_ball",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 0, y = 5 },
    config = { extra = 4 }
}

-- Misprint
SMODS.Joker {
    key = "misprint",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 6, y = 2 },
    config = { extra = { max = 23,
        min = 0 } }
}

-- Dusk
SMODS.Joker {
    key = "dusk",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 4, y = 7 },
    config = { extra = 1 },
    unlock_condition = { type = '',
        extra = '',
        hidden = true }
}

-- Raised Fist
SMODS.Joker {
    key = "raised_fist",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 8, y = 2 },
    config = {}
}

-- Chaos the Clown
SMODS.Joker {
    key = "chaos",
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 1, y = 0 },
    config = { extra = 1 }
}

-- Fibonacci
SMODS.Joker {
    key = "fibonacci",
    blueprint_compat = true,
    rarity = 2,
    cost = 8,
    pos = { x = 1, y = 5 },
    config = { extra = 8 }
}

-- Steel Joker
SMODS.Joker {
    key = "steel_joker",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 7, y = 2 },
    config = { extra = 0.2 },
    enhancement_gate = 'm_steel'
}

-- Scary Face
SMODS.Joker {
    key = "scary_face",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 2, y = 3 },
    config = { extra = 30 }
}

-- Abstract Joker
SMODS.Joker {
    key = "abstract",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 3, y = 3 },
    config = { extra = 3 }
}

-- Delayed Gratification
SMODS.Joker {
    key = "delayed_grat",
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 4, y = 3 },
    config = { extra = 2 }
}

-- Hack
SMODS.Joker {
    key = "hack",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 5, y = 2 },
    config = { extra = 1 }
}

-- Pareidolia
SMODS.Joker {
    key = "pareidolia",
    blueprint_compat = false,
    rarity = 2,
    cost = 5,
    pos = { x = 6, y = 3 },
    config = {}
}

-- Gros Michel
SMODS.Joker {
    key = "gros_michel",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 1,
    cost = 5,
    pos = { x = 7, y = 6 },
    config = { extra = { odds = 6,
        mult = 15 } },
    no_pool_flag = 'gros_michel_extinct'
}

-- Even Steven
SMODS.Joker {
    key = "even_steven",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 8, y = 3 },
    config = { extra = 4 }
}

-- Odd Todd
SMODS.Joker {
    key = "odd_todd",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 9, y = 3 },
    config = { extra = 31 }
}

-- Scholar
SMODS.Joker {
    key = "scholar",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 0, y = 4 },
    config = { extra = { mult = 4,
        chips = 20 } }
}

-- Business Card
SMODS.Joker {
    key = "business",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 1, y = 4 },
    config = { extra = 2 }
}

-- Supernova
SMODS.Joker {
    key = "supernova",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 2, y = 4 },
    config = { extra = 1 }
}

-- Ride the Bus
SMODS.Joker {
    key = "ride_the_bus",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 6,
    pos = { x = 1, y = 6 },
    config = { extra = 1 },
    unlock_condition = { type = 'discard_custom' }
}

-- Space Joker
SMODS.Joker {
    key = "space",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 3, y = 5 },
    config = { extra = 4 }
}

-- Cavendish
SMODS.Joker {
    key = "egg",
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    name = 'Egg',
    pos = { x = 0, y = 10 },
    config = { extra = 3 }
}

SMODS.Joker {
    key = "burglar",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    name = 'Burglar',
    pos = { x = 1, y = 10 },
    config = { extra = 3 }
}

SMODS.Joker {
    key = "blackboard",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    name = 'Blackboard',
    pos = { x = 2, y = 10 },
    config = { extra = 3 }
}

SMODS.Joker {
    key = "runner",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 5,
    name = 'Runner',
    pos = { x = 3, y = 10 },
    config = { extra = { chips = 0,
        chip_mod = 15 } }
}

SMODS.Joker {
    key = "ice_cream",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 1,
    cost = 5,
    name = 'Ice Cream',
    pos = { x = 4, y = 10 },
    config = { extra = { chips = 100,
        chip_mod = 5 } }
}

SMODS.Joker {
    key = "dna",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    name = 'DNA',
    pos = { x = 5, y = 10 },
    config = {}
}

SMODS.Joker {
    key = "splash",
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    name = 'Splash',
    pos = { x = 6, y = 10 },
    config = {}
}

SMODS.Joker {
    key = "blue_joker",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    name = 'Blue Joker',
    pos = { x = 7, y = 10 },
    config = { extra = 2 }
}

SMODS.Joker {
    key = "sixth_sense",
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    name = 'Sixth Sense',
    pos = { x = 8, y = 10 },
    config = {}
}

SMODS.Joker {
    key = "constellation",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    name = 'Constellation',
    pos = { x = 9, y = 10 },
    config = { extra = 0.1,
        Xmult = 1 }
}

SMODS.Joker {
    key = "hiker",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    name = 'Hiker',
    pos = { x = 0, y = 11 },
    config = { extra = 5 }
}

SMODS.Joker {
    key = "faceless",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    name = 'Faceless Joker',
    pos = { x = 1, y = 11 },
    config = { extra = { dollars = 5,
        faces = 3 } }
}

SMODS.Joker {
    key = "green_joker",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 4,
    name = 'Green Joker',
    pos = { x = 2, y = 11 },
    config = { extra = { hand_add = 1,
        discard_sub = 1 } }
}

SMODS.Joker {
    key = "superposition",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    name = 'Superposition',
    pos = { x = 3, y = 11 },
    config = {}
}

SMODS.Joker {
    key = "todo_list",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    name = 'To Do List',
    pos = { x = 4, y = 11 },
    config = { extra = { dollars = 4,
        poker_hand = 'High Card' } }
}

SMODS.Joker {
    key = "cavendish",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 5, y = 11 },
    config = { extra = { odds = 1000,
        Xmult = 3 } },
    yes_pool_flag = 'gros_michel_extinct'
}

-- Card Sharp
SMODS.Joker {
    key = "card_sharp",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 6, y = 11 },
    config = { extra = { Xmult = 3 } }
}

-- Red Card
SMODS.Joker {
    key = "red_card",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 5,
    pos = { x = 7, y = 11 },
    config = { extra = 3 }
}

-- Madness
SMODS.Joker {
    key = "madness",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 7,
    pos = { x = 8, y = 11 },
    config = { extra = 0.5 }
}

-- Square Joker
SMODS.Joker {
    key = "square",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 9, y = 11 },
    config = { extra = { chips = 0,
        chip_mod = 4 } }
}

-- Seance
SMODS.Joker {
    key = "seance",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 0, y = 12 },
    config = { extra = { poker_hand = 'Straight Flush' } }
}

-- Riff-raff
SMODS.Joker {
    key = "riff_raff",
    blueprint_compat = true,
    rarity = 1,
    cost = 6,
    pos = { x = 1, y = 12 },
    config = { extra = 2 }
}

-- Vampire
SMODS.Joker {
    key = "vampire",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 7,
    config = { extra = 0.1,
        Xmult = 1 },
    pos = { x = 2, y = 12 }
}

-- Shortcut
-- For the effect, see Four Fingers
SMODS.Joker {
    key = "shortcut",
    blueprint_compat = false,
    rarity = 2,
    cost = 7,
    pos = { x = 3, y = 12 }
}

-- Hologram
SMODS.Joker {
    key = "hologram",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 7,
    config = { extra = 0.25,
        Xmult = 1 },
    pos = { x = 4, y = 12 },
    soul_pos = { x = 2, y = 9 },

}

-- Vagabond
SMODS.Joker {
    key = "vagabond",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    config = { extra = 4 },
    pos = { x = 5, y = 12 }
}

-- Baron
SMODS.Joker {
    key = "baron",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    config = { extra = 1.5 },
    pos = { x = 6, y = 12 }
}

-- Cloud 9
SMODS.Joker {
    key = "cloud_9",
    blueprint_compat = false,
    rarity = 2,
    cost = 7,
    config = { extra = 1 },
    pos = { x = 7, y = 12 }
}

-- Rocket
SMODS.Joker {
    key = "rocket",
    blueprint_compat = false,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    config = { extra = { dollars = 1,
        increase = 2 } },
    pos = { x = 8, y = 12 }
}

-- Obelisk
SMODS.Joker {
    key = "obelisk",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 3,
    cost = 8,
    config = { extra = 0.2,
        Xmult = 1 },
    pos = { x = 9, y = 12 }
}

-- Midas Mask
SMODS.Joker {
    key = "midas_mask",
    blueprint_compat = false,
    rarity = 2,
    cost = 7,
    config = {},
    pos = { x = 0, y = 13 }
}

-- Luchador
SMODS.Joker {
    key = "luchador",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 2,
    cost = 5,
    config = {},
    pos = { x = 1, y = 13 }
}

-- Photograph
SMODS.Joker {
    key = "photograph",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    config = { extra = 2 },
    pos = { x = 2, y = 13 }
}

-- Gift Card
SMODS.Joker {
    key = "gift",
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    config = { extra = 1 },
    pos = { x = 3, y = 13 }
}

-- Turtle Bean
SMODS.Joker {
    key = "turtle_bean",
    blueprint_compat = false,
    eternal_compat = false,
    rarity = 2,
    cost = 6,
    config = { extra = { h_size = 5,
        h_mod = 1 } },
    pos = { x = 4, y = 13 }
}

-- Erosion
SMODS.Joker {
    key = "erosion",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    config = { extra = 4 },
    pos = { x = 5, y = 13 }
}

-- Reserved Parking
SMODS.Joker {
    key = "reserved_parking",
    blueprint_compat = true,
    rarity = 1,
    cost = 6,
    config = { extra = { odds = 2,
        dollars = 1 } },
    pos = { x = 6, y = 13 }
}

-- Mail-In Rebate
SMODS.Joker {
    key = "mail",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    config = { extra = 5 },
    pos = { x = 7, y = 13 }
}

-- To the Moon
SMODS.Joker {
    key = "to_the_moon",
    blueprint_compat = false,
    rarity = 2,
    cost = 5,
    config = { extra = 1 },
    pos = { x = 8, y = 13 }
}

-- Hallucination
SMODS.Joker {
    key = "hallucination",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    config = { extra = 2 },
    pos = { x = 9, y = 13 }
}

-- Fortune Teller
SMODS.Joker {
    key = "fortune_teller",
    blueprint_compat = true,
    rarity = 1,
    cost = 6,
    pos = { x = 7, y = 5 },
    config = { extra = 1 }
}

-- Juggler
SMODS.Joker {
    key = "juggler",
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 0, y = 1 },
    config = { h_size = 1 }
}

-- Drunkard
SMODS.Joker {
    key = "drunkard",
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 1, y = 1 },
    config = { d_size = 1 }
}

-- Stone Joker
SMODS.Joker {
    key = "stone",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 9, y = 0 },
    config = { extra = 25 },
    enhancement_gate = 'm_stone'
}

-- Golden Joker
SMODS.Joker {
    key = "golden",
    blueprint_compat = false,
    rarity = 1,
    cost = 6,
    pos = { x = 9, y = 2 },
    config = { extra = 4 }
}

-- Lucky Cat
SMODS.Joker {
    key = "lucky_cat",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    config = { Xmult = 1,
        extra = 0.25 },
    pos = { x = 5, y = 14 },
    enhancement_gate = 'm_lucky'
}

-- Baseball Card
SMODS.Joker {
    key = "baseball",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    config = { extra = 1.5 },
    pos = { x = 6, y = 14 }
}

-- Bull
SMODS.Joker {
    key = "bull",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    config = { extra = 2 },
    pos = { x = 7, y = 14 }
}

-- Diet Cola
SMODS.Joker {
    key = "diet_cola",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 2,
    cost = 6,
    config = {},
    pos = { x = 8, y = 14 }
}

-- Trading Card
SMODS.Joker {
    key = "trading",
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    config = { extra = 3 },
    pos = { x = 9, y = 14 }
}

-- Flash Card
SMODS.Joker {
    key = "flash",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 5,
    config = { extra = 2,
        mult = 0 },
    pos = { x = 0, y = 15 }
}

-- Popcorn
SMODS.Joker {
    key = "popcorn",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 1,
    cost = 5,
    config = { mult = 20,
        extra = 4 },
    pos = { x = 1, y = 15 }
}

-- Spare Trousers
SMODS.Joker {
    key = "trousers",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    config = { extra = 2 },
    pos = { x = 4, y = 15 }
}

-- Ancient Joker
SMODS.Joker {
    key = "ancient",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    config = { extra = 1.5 },
    pos = { x = 7, y = 15 }
}

-- Ramen
SMODS.Joker {
    key = "ramen",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 2,
    cost = 6,
    config = { Xmult = 2,
        extra = 0.01 },
    pos = { x = 2, y = 15 }
}

-- Walkie Talkie
SMODS.Joker {
    key = "walkie_talkie",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    config = { extra = { chips = 10,
        mult = 4 } },
    pos = { x = 8, y = 15 }
}

-- Seltzer
SMODS.Joker {
    key = "selzer",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 2,
    cost = 6,
    config = { extra = 10 },
    pos = { x = 3, y = 15 }
}

-- Castle
SMODS.Joker {
    key = "castle",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    config = { extra = { chips = 0,
        chip_mod = 3 } },
    pos = { x = 9, y = 15 }
}

-- Smiley Face
SMODS.Joker {
    key = "smiley",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    config = { extra = 5 },
    pos = { x = 6, y = 15 }
}

-- Campfire
SMODS.Joker {
    key = "campfire",
    blueprint_compat = true,
    rarity = 3,
    cost = 9,
    config = { extra = 0.25 },
    pos = { x = 5, y = 15 }
}

-- Golden Ticket
SMODS.Joker {
    key = "ticket",
    unlocked = false,
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 5, y = 3 },
    config = { extra = 4 },
    unlock_condition = { type = 'hand_contents',
        extra = 'Gold' },
    enhancement_gate = 'm_gold'
}

-- Mr. Bones
SMODS.Joker {
    key = "mr_bones",
    unlocked = false,
    blueprint_compat = false,
    eternal_compat = false,
    rarity = 2,
    cost = 5,
    pos = { x = 3, y = 4 },
    config = {},
    unlock_condition = { type = 'c_losses',
        extra = 5 }
}

-- Acrobat
SMODS.Joker {
    key = "acrobat",
    unlocked = false,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 2, y = 1 },
    config = { extra = 3 },
    unlock_condition = { type = 'c_hands_played',
        extra = 200 }
}

-- Sock and Buskin
SMODS.Joker {
    key = "sock_and_buskin",
    unlocked = false,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 3, y = 1 },
    config = { extra = 1 },
    unlock_condition = { type = 'c_face_cards_played',
        extra = 300 }
}

-- Swashbuckler
SMODS.Joker {
    key = "swashbuckler",
    unlocked = false,
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 9, y = 5 },
    config = { mult = 1 },
    unlock_condition = { type = 'c_jokers_sold',
        extra = 20 }
}

-- Troubadour
SMODS.Joker {
    key = "troubadour",
    unlocked = false,
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 0, y = 2 },
    config = { extra = { h_size = 2,
        h_plays = -1 } },
    unlock_condition = { type = 'round_win',
        extra = 5 }
}

-- Certificate
SMODS.Joker {
    key = "certificate",
    unlocked = false,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 8, y = 8 },
    config = {},
    unlock_condition = { type = 'double_gold' }
}

-- Smeared Joker
SMODS.Joker {
    key = "smeared",
    unlocked = false,
    blueprint_compat = false,
    rarity = 2,
    cost = 7,
    pos = { x = 4, y = 6 },
    config = {},
    unlock_condition = { type = 'modify_deck',
        extra = { count = 3,
            enhancement = 'Wild Card',
            e_key = 'm_wild' } }
}

-- Throwback
SMODS.Joker {
    key = "throwback",
    unlocked = false,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 5, y = 7 },
    config = { extra = 0.25 },
    unlock_condition = { type = 'continue_game' }
}

-- Hanging Chad
SMODS.Joker {
    key = "hanging_chad",
    unlocked = false,
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 9, y = 6 },
    config = { extra = 2 },
    unlock_condition = { type = 'round_win',
        extra = 'High Card' }
}

-- Rough Gem
SMODS.Joker {
    key = "rough_gem",
    unlocked = false,
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 9, y = 7 },
    config = { extra = 1 },
    unlock_condition = { type = 'modify_deck',
        extra = { count = 30,
            suit = 'Diamonds' } }
}

-- Bloodstone
SMODS.Joker {
    key = "bloodstone",
    unlocked = false,
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 0, y = 8 },
    config = { extra = { odds = 2,
        Xmult = 1.5 } },
    unlock_condition = { type = 'modify_deck',
        extra = { count = 30,
            suit = 'Hearts' } }
}

-- Arrowhead
SMODS.Joker {
    key = "arrowhead",
    unlocked = false,
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 1, y = 8 },
    config = { extra = 50 },
    unlock_condition = { type = 'modify_deck',
        extra = { count = 30,
            suit = 'Spades' } }
}

-- Onyx Agate
SMODS.Joker {
    key = "onyx_agate",
    unlocked = false,
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 2, y = 8 },
    config = { extra = 7 },
    unlock_condition = { type = 'modify_deck',
        extra = { count = 30,
            suit = 'Clubs' } }
}

-- Glass Joker
SMODS.Joker {
    key = "glass",
    unlocked = false,
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 1, y = 3 },
    config = { extra = 0.75,
        Xmult = 1 },
    unlock_condition = { type = 'modify_deck',
        extra = { count = 5,
            enhancement = 'Glass Card',
            e_key = 'm_glass' } },
    enhancement_gate = 'm_glass'
}

-- Showman
SMODS.Joker {
    key = "ring_master",
    unlocked = false,
    blueprint_compat = false,
    rarity = 2,
    cost = 5,
    pos = { x = 6, y = 5 },
    config = {},
    unlock_condition = { type = 'ante_up',
        ante = 4 }
}

-- Flower Pot
SMODS.Joker {
    key = "flower_pot",
    unlocked = false,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 0, y = 6 },
    config = { extra = 3 },
    unlock_condition = { type = 'ante_up',
        ante = 8 }
}

-- Blueprint
SMODS.Joker {
    key = "blueprint",
    unlocked = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 10,
    pos = { x = 0, y = 3 },
    config = {},
    unlock_condition = { type = 'win_custom' }
}

-- Wee Joker
SMODS.Joker {
    key = "wee",
    unlocked = false,
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 3,
    cost = 8,
    pos = { x = 0, y = 0 },
    config = { extra = { chips = 0,
        chip_mod = 8 } },
    unlock_condition = { type = 'win',
        n_rounds = 18 }
}

-- Merry Andy
SMODS.Joker {
    key = "merry_andy",
    unlocked = false,
    blueprint_compat = false,
    rarity = 2,
    cost = 7,
    pos = { x = 8, y = 0 },
    config = { d_size = 3,
        h_size = -1 },
    unlock_condition = { type = 'win',
        n_rounds = 12 }
}

-- Oops! All 6s
SMODS.Joker {
    key = "oops",
    unlocked = false,
    blueprint_compat = false,
    rarity = 2,
    cost = 4,
    pos = { x = 5, y = 6 },
    config = {},
    unlock_condition = { type = 'chip_score',
        chips = 10000 }
}

-- The Idol
SMODS.Joker {
    key = "idol",
    unlocked = false,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 6, y = 7 },
    config = { extra = 2 },
    unlock_condition = { type = 'chip_score',
        chips = 1000000 }
}

-- Seeing Double
SMODS.Joker {
    key = "seeing_double",
    unlocked = false,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 4, y = 4 },
    config = { extra = 2 },
    unlock_condition = { type = 'hand_contents',
        extra = 'four 7 of Clubs' }
}

-- Matador
SMODS.Joker {
    key = "matador",
    unlocked = false,
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 4, y = 5 },
    config = { extra = 8 },
    unlock_condition = { type = 'round_win' }
}

-- Hit the Road
SMODS.Joker {
    key = "hit_the_road",
    unlocked = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 8, y = 5 },
    config = { extra = 0.5 },
    unlock_condition = { type = 'discard_custom' }
}

-- The Duo
SMODS.Joker {
    key = "duo",
    unlocked = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 5, y = 4 },
    config = { Xmult = 2,
        type = 'Pair' },
    unlock_condition = { type = 'win_no_hand',
        extra = 'Pair' }
}

-- The Trio
SMODS.Joker {
    key = "trio",
    unlocked = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 6, y = 4 },
    config = { Xmult = 3,
        type = 'Three of a Kind' },
    unlock_condition = { type = 'win_no_hand',
        extra = 'Three of a Kind' }
}

-- The Family
SMODS.Joker {
    key = "family",
    unlocked = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 7, y = 4 },
    config = { Xmult = 4,
        type = 'Four of a Kind' },
    unlock_condition = { type = 'win_no_hand',
        extra = 'Four of a Kind' }
}

-- The Order
SMODS.Joker {
    key = "order",
    unlocked = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 8, y = 4 },
    config = { Xmult = 3,
        type = 'Straight' },
    unlock_condition = { type = 'win_no_hand',
        extra = 'Straight' }
}

-- The Tribe
SMODS.Joker {
    key = "tribe",
    unlocked = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 9, y = 4 },
    config = { Xmult = 2,
        type = 'Flush' },
    unlock_condition = { type = 'win_no_hand',
        extra = 'Flush' }
}

-- Stuntman
SMODS.Joker {
    key = "stuntman",
    unlocked = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 7,
    pos = { x = 8, y = 6 },
    config = { extra = { h_size = 2,
        chip_mod = 250 } },
    unlock_condition = { type = 'chip_score',
        chips = 100000000 }
}

-- Invisible Joker
SMODS.Joker {
    key = "invisible",
    unlocked = false,
    blueprint_compat = false,
    eternal_compat = false,
    rarity = 3,
    cost = 8,
    pos = { x = 1, y = 7 },
    config = { extra = 2 },
    unlock_condition = { type = 'win_custom' }
}

-- Brainstorm
SMODS.Joker {
    key = "brainstorm",
    unlocked = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 10,
    pos = { x = 7, y = 7 },
    config = {},
    unlock_condition = { type = 'discard_custom' }
}

-- Satellite
SMODS.Joker {
    key = "satellite",
    unlocked = false,
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 8, y = 7 },
    config = { extra = 1 },
    unlock_condition = { type = 'money',
        extra = 400 }
}

-- Shoot the Moon
SMODS.Joker {
    key = "shoot_the_moon",
    unlocked = false,
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 2, y = 6 },
    config = { extra = 13 },
    unlock_condition = { type = 'play_all_hearts' }
}

-- Driver's License
SMODS.Joker {
    key = "drivers_license",
    unlocked = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 7,
    pos = { x = 0, y = 7 },
    config = { extra = 3 },
    unlock_condition = { type = 'modify_deck',
        extra = { count = 16,
            tally = 'total' } }
}

-- Cartomancer
SMODS.Joker {
    key = "cartomancer",
    unlocked = false,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 7, y = 3 },
    config = {},
    unlock_condition = { type = 'discover_amount',
        tarot_count = 22 }
}

-- Astronomer
SMODS.Joker {
    key = "astronomer",
    unlocked = false,
    blueprint_compat = false,
    rarity = 2,
    cost = 8,
    pos = { x = 2, y = 7 },
    config = {},
    unlock_condition = { type = 'discover_amount',
        planet_count = 12 }
}

-- Burnt Joker
SMODS.Joker {
    key = "burnt",
    unlocked = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 3, y = 7 },
    config = { h_size = 0,
        extra = 4 },
    unlock_condition = { type = 'c_cards_sold',
        extra = 50 }
}

-- Bootstraps
SMODS.Joker {
    key = "bootstraps",
    unlocked = false,
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 9, y = 8 },
    config = { extra = { mult = 2,
        dollars = 5 } },
    unlock_condition = { type = 'modify_jokers',
        extra = { polychrome = true,
            count = 2 } }
}

-- Caino
SMODS.Joker {
    key = "caino",
    unlocked = false,
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    pos = { x = 3, y = 8 },
    soul_pos = { x = 3, y = 9 },
    config = { extra = 1 },
    unlock_condition = { type = '',
        extra = '',
        hidden = true }
}

-- Triboulet
SMODS.Joker {
    key = "triboulet",
    unlocked = false,
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    pos = { x = 4, y = 8 },
    soul_pos = { x = 4, y = 9 },
    config = { extra = 2 },
    unlock_condition = { type = '',
        extra = '',
        hidden = true }
}

-- Yorick
SMODS.Joker {
    key = "yorick",
    unlocked = false,
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    pos = { x = 5, y = 8 },
    soul_pos = { x = 5, y = 9 },
    config = { extra = { xmult = 1,
        discards = 23 } },
    unlock_condition = { type = '',
        extra = '',
        hidden = true }
}

-- Chicot
SMODS.Joker {
    key = "chicot",
    unlocked = false,
    blueprint_compat = false,
    rarity = 4,
    cost = 20,
    pos = { x = 6, y = 8 },
    soul_pos = { x = 6, y = 9 },
    config = {},
    unlock_condition = { type = '',
        extra = '',
        hidden = true }
}

-- Perkeo
SMODS.Joker {
    key = "perkeo",
    unlocked = false,
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    pos = { x = 7, y = 8 },
    soul_pos = { x = 7, y = 9 },
    config = {},
    unlock_condition = { type = '',
        extra = '',
        hidden = true }
}
