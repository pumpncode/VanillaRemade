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

-- This overrides get_flush
-- Consider also a Lovely patch for this
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

-- Ceremonial Dagger
SMODS.Joker {
    key = "ceremonial",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 5, y = 5 },
    config = { extra = { mult = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos + 1] and not G.jokers.cards[my_pos + 1].ability.eternal and not G.jokers.cards[my_pos + 1].getting_sliced then
                local sliced_card = G.jokers.cards[my_pos + 1]
                sliced_card.getting_sliced = true -- Make sure to do this on destruction effects
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        card.ability.extra.mult = card.ability.extra.mult + sliced_card.sell_cost * 2
                        card:juice_up(0.8, 0.8)
                        sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                        play_sound('slice1', 0.96 + math.random() * 0.08)
                        return true
                    end
                }))
                return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { self.ability.mult + 2 * sliced_card.sell_cost } },
                    colour = G.C.RED,
                    no_juice = true
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Banner
SMODS.Joker {
    key = "banner",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 1, y = 2 },
    config = { extra = { chips = 30 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = G.GAME.current_round.discards_left * card.ability.extra.chips
            }
        end
    end
}

-- Mystic Summit
SMODS.Joker {
    key = "mystic_summit",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 2, y = 2 },
    config = { extra = { mult = 15, d_remaining = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.d_remaining } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.discards_left == card.ability.extra.d_remaining then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Marble Joker
SMODS.Joker {
    key = "marble",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 3, y = 2 },
    calculate = function(self, card, context)
        if context.setting_blind then
            local stone_card = create_playing_card({ center = G.P_CENTERS.m_stone }, G.discard, true, false,
                nil, true)
            G.E_MANAGER:add_event(Event({
                func = function()
                    stone_card:start_materialize({ G.C.SECONDARY_SET.Enhanced })
                    G.play:emplace(stone_card)
                    return true
                end
            }))
            return {
                message = localize('k_plus_stone'),
                colour = G.C.SECONDARY_SET.Enhanced,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            return true
                        end
                    }))
                    draw_card(G.play, G.deck, 90, 'up')
                    SMODS.calculate_context({ playing_card_added = true, cards = { stone_card } })
                end
            }
        end
    end
}

-- Loyalty Card
SMODS.Joker {
    key = "loyalty_card",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 4, y = 2 },
    config = { extra = { Xmult = 4, every = 5, loyalty_remaining = 5 } },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult,
                card.ability.extra.every + 1,
                localize { type = 'variable', key = (card.ability.extra.loyalty_remaining == 0 and 'loyalty_active' or 'loyalty_inactive'), vars = { card.ability.extra.loyalty_remaining } }
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.loyalty_remaining = (card.ability.extra.every - 1 - (G.GAME.hands_played - card.ability.hands_played_at_create)) %
                (card.ability.extra.every + 1)
            if not context.blueprint then
                if card.ability.extra.loyalty_remaining == 0 then
                    local eval = function(card) return (card.ability.extra.loyalty_remaining == 0) end
                    juice_card_until(card, eval, true)
                end
            end
            if card.ability.extra.loyalty_remaining == card.ability.extra.every then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}

-- 8 Ball
SMODS.Joker {
    key = "8_ball",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 0, y = 5 },
    config = { extra = { odds = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if (context.other_card:get_id() == 8) and (pseudorandom('8ball') < G.GAME.probabilities.normal / card.ability.extra.odds) then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                return {
                    extra = {
                        message = localize('k_plus_tarot'),
                        message_card = card,
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    SMODS.add_card {
                                        set = 'Tarot',
                                        key_append = '8ba' -- Optional, useful for checking the source of the creation.
                                    }
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end)
                            }))
                        end
                    },
                }
            end
        end
    end
}

-- Misprint
SMODS.Joker {
    key = "misprint",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 6, y = 2 },
    config = { extra = { max = 23, min = 0 } },
    loc_vars = function(self, info_queue, card)
        local r_mults = {}
        for i = card.ability.extra.min, card.ability.extra.max do
            r_mults[#r_mults + 1] = tostring(i)
        end
        local loc_mult = ' ' .. (localize('k_mult')) .. ' '
        main_start = {
            { n = G.UIT.T, config = { text = '  +', colour = G.C.MULT, scale = 0.32 } },
            { n = G.UIT.O, config = { object = DynaText({ string = r_mults, colours = { G.C.RED }, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.5, scale = 0.32, min_cycle_time = 0 }) } },
            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = {
                            { string = 'rand()', colour = G.C.JOKER_GREY }, { string = "#@" .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11) .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1, 1) or 'D'), colour = G.C.RED },
                            loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult,
                            loc_mult, loc_mult, loc_mult, loc_mult },
                        colours = { G.C.UI.TEXT_DARK },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            },
        }
        return { main_start = main_start }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = pseudorandom('misprint', card.ability.extra.min, card.ability.extra.max)
            }
        end
    end
}

-- Dusk
SMODS.Joker {
    key = "dusk",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 4, y = 7 },
    config = { extra = { repetitions = 1 } },
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and G.GAME.current_round.hands_left == 0 then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
    end
}

-- Raised Fist
SMODS.Joker {
    key = "raised_fist",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 8, y = 2 },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            local temp_Mult, temp_ID = 15, 15
            local raised_card = nil
            for i = 1, #G.hand.cards do
                if temp_ID >= G.hand.cards[i].base.id and not SMODS.has_no_rank(G.hand.cards[i]) then
                    temp_Mult = G.hand.cards[i].base.nominal
                    temp_ID = G.hand.cards[i].base.id
                    raised_card = G.hand.cards[i]
                end
            end
            if raised_card == context.other_card then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED
                    }
                else
                    return {
                        mult = 2 * temp_Mult
                    }
                end
            end
        end
    end
}

-- Chaos the Clown
SMODS.Joker {
    key = "chaos",
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 1, y = 0 },
    config = { extra = { rerolls = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.rerolls } }
    end,
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(card.ability.extra.rerolls)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(-card.ability.extra.rerolls)
    end
}

-- Fibonacci
SMODS.Joker {
    key = "fibonacci",
    blueprint_compat = true,
    rarity = 2,
    cost = 8,
    pos = { x = 1, y = 5 },
    config = { extra = { mult = 8 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 2 or
                context.other_card:get_id() == 3 or
                context.other_card:get_id() == 5 or
                context.other_card:get_id() == 8 or
                context.other_card:get_id() == 14 then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}

-- Steel Joker
SMODS.Joker {
    key = "steel_joker",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 7, y = 2 },
    config = { extra = { xmult = 0.2 } },
    loc_vars = function(self, info_queue, card)
        local steel_tally = 0
        for _, playing_card in pairs(G.playing_cards) do
            if SMODS.has_enhancement(playing_card, 'm_steel') then steel_tally = steel_tally + 1 end
        end
        return { vars = { card.ability.extra.xmult, 1 + card.ability.extra.xmult * steel_tally } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local steel_tally = 0
            for _, playing_card in pairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_steel') then steel_tally = steel_tally + 1 end
            end
            return {
                Xmult = 1 + card.ability.extra.xmult * steel_tally,
            }
        end
    end,
    in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_steel'`
        for _, playing_card in pairs(G.playing_cards) do
            if SMODS.has_enhancement(playing_card, 'm_steel') then
                return true
            end
        end
        return false
    end
}

-- Scary Face
SMODS.Joker {
    key = "scary_face",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 2, y = 3 },
    config = { extra = { chips = 30 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.other_card:is_face() then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
}

-- Abstract Joker
SMODS.Joker {
    key = "abstract",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 3, y = 3 },
    config = { extra = { mult = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * (G.jokers and #G.jokers.cards or 0) } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            -- You can also do this if you want to make sure everything in the Joker slots is a Joker (blame other mods)
            -- local joker_count = 0
            -- for i = 1, #G.jokers.cards do
            --     if G.jokers.cards[i].ability.set == 'Joker' then joker_count = joker_count + 1 end
            -- end
            return {
                mult = card.ability.extra.mult * #G.jokers.cards
            }
        end
    end,
}

-- Delayed Gratification
SMODS.Joker {
    key = "delayed_grat",
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 4, y = 3 },
    config = { extra = { money = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,
    calc_dollar_bonus = function(self, card)
        return G.GAME.current_round.discards_used == 0 and G.GAME.current_round.discards_left > 0 and
            G.GAME.current_round.discards_left * card.ability.extra.money or nil
    end
}

-- Hack
SMODS.Joker {
    key = "hack",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 5, y = 2 },
    config = { extra = { repetitions = 1 } },
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card:get_id() == 2 or
                context.other_card:get_id() == 3 or
                context.other_card:get_id() == 4 or
                context.other_card:get_id() == 5 then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
    end
}

-- Pareidolia
SMODS.Joker {
    key = "pareidolia",
    blueprint_compat = false,
    rarity = 2,
    cost = 5,
    pos = { x = 6, y = 3 },
}

local card_is_face_ref = Card.is_face
function Card:is_face(from_boss)
    return card_is_face_ref(self, from_boss) or (self:get_id() and next(SMODS.find_card("j_vremade_pareidolia")))
end

-- Gros Michel
SMODS.Joker {
    key = "gros_michel",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 1,
    cost = 5,
    pos = { x = 7, y = 6 },
    config = { extra = { odds = 6, mult = 15 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if pseudorandom('gros_michel') < G.GAME.probabilities.normal / self.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                G.jokers:remove_card(self)
                                card:remove()
                                card = nil
                                return true;
                            end
                        }))
                        return true
                    end
                }))
                G.GAME.pool_flags.vremade_gros_michel_extinct = true
                return {
                    message = localize('k_extinct_ex')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    in_pool = function(self, args) -- equivalent to `no_pool_flag = 'vremade_gros_michel_extinct'`
        return not G.GAME.pool_flags.vremade_gros_michel_extinct
    end
}

-- Even Steven
SMODS.Joker {
    key = "even_steven",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 8, y = 3 },
    config = { extra = { mult = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() <= 10 and
                context.other_card:get_id() >= 0 and
                context.other_card:get_id() % 2 == 0 then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}

-- Odd Todd
SMODS.Joker {
    key = "odd_todd",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 9, y = 3 },
    config = { extra = { chips = 31 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if (context.other_card:get_id() <= 10 and
                    context.other_card:get_id() >= 0 and
                    context.other_card:get_id() % 2 == 1) or
                (context.other_card:get_id() == 14) then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}

-- Scholar
SMODS.Joker {
    key = "scholar",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 0, y = 4 },
    config = { extra = { mult = 4, chips = 20 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
    end
}

-- Business Card
SMODS.Joker {
    key = "business",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 1, y = 4 },
    config = { extra = { odds = 2, money = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.money } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_face() and
            pseudorandom('business') < G.GAME.probabilities.normal / card.ability.extra.odds then
            return {
                dollars = card.ability.extra.money
            }
        end
    end
}

-- Supernova
SMODS.Joker {
    key = "supernova",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 2, y = 4 },
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = G.GAME.hands[context.scoring_name].played
            }
        end
    end
}

-- Ride the Bus
SMODS.Joker {
    key = "ride_the_bus",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 6,
    pos = { x = 1, y = 6 },
    config = { extra = { mult_gain = 1, mult = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local faces = false
            for _, playing_card in ipairs(context.scoring_hand) do
                if playing_card:is_face() then
                    faces = true
                    break
                end
            end
            if faces then
                local last_mult = card.ability.extra.mult
                card.ability.extra.mult = 0
                if last_mult > 0 then
                    return {
                        message = localize('k_reset')
                    }
                end
            else
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Space Joker
SMODS.Joker {
    key = "space",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 3, y = 5 },
    config = { extra = { odds = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and pseudorandom('space') < G.GAME.probabilities.normal / card.ability.extra.odds then
            return {
                level_up = true,
                message = localize('k_level_up_ex')
            }
        end
    end
}

------- WIP ----------------------------------------------------------------

-- Egg
SMODS.Joker {
    key = "egg",
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 0, y = 10 },
    config = { extra = 3 }
}

-- Burglar
SMODS.Joker {
    key = "burglar",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 1, y = 10 },
    config = { extra = 3 }
}

-- Blackboard
SMODS.Joker {
    key = "blackboard",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 2, y = 10 },
    config = { extra = 3 }
}

-- Runner
SMODS.Joker {
    key = "runner",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 5,
    pos = { x = 3, y = 10 },
    config = { extra = { chips = 0,
        chip_mod = 15 } }
}

-- Ice Cream
SMODS.Joker {
    key = "ice_cream",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 1,
    cost = 5,
    pos = { x = 4, y = 10 },
    config = { extra = { chips = 100,
        chip_mod = 5 } }
}

-- DNA
SMODS.Joker {
    key = "dna",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 5, y = 10 },
    config = {}
}

-- Splash
SMODS.Joker {
    key = "splash",
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    name = 'Splash',
    pos = { x = 6, y = 10 },
    config = {}
}

-- Blue Joker
SMODS.Joker {
    key = "blue_joker",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    name = 'Blue Joker',
    pos = { x = 7, y = 10 },
    config = { extra = 2 }
}

-- Sixth Sense
SMODS.Joker {
    key = "sixth_sense",
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    name = 'Sixth Sense',
    pos = { x = 8, y = 10 },
    config = {}
}

-- Constellation
SMODS.Joker {
    key = "constellation",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 9, y = 10 },
    config = { extra = 0.1,
        Xmult = 1 }
}

-- Hiker
SMODS.Joker {
    key = "hiker",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 0, y = 11 },
    config = { extra = 5 }
}

-- Faceless Joker
SMODS.Joker {
    key = "faceless",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 1, y = 11 },
    config = { extra = { dollars = 5,
        faces = 3 } }
}

-- Green Joker
SMODS.Joker {
    key = "green_joker",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 2, y = 11 },
    config = { extra = { hand_add = 1,
        discard_sub = 1 } }
}

-- Superposition
SMODS.Joker {
    key = "superposition",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 3, y = 11 },
    config = {}
}

-- To Do List
SMODS.Joker {
    key = "todo_list",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 4, y = 11 },
    config = { extra = { dollars = 4,
        poker_hand = 'High Card' } }
}

-- Cavendish
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
