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
    pos = { x = 1, y = 14 },
    config = { extra = { t_chips = 100, type = 'Three of a Kind' } },
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
    pos = { x = 2, y = 14 },
    config = { extra = { t_chips = 80, type = 'Two Pair' } },
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
    pos = { x = 3, y = 14 },
    config = { extra = { t_chips = 100, type = 'Straight' } },
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
    pos = { x = 4, y = 14 },
    config = { extra = { t_chips = 80, type = 'Flush' } },
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

--- This overrides get_flush
--- Consider a Lovely patch for this
---@param hand Card[]|table[] Played cards in hand
---@param min_length integer Minimum amount of cards. Added in this override
---@return table[] - All combinations of flushes
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
                    flush_count = flush_count + 1
                    t[#t + 1] = hand[i]
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
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult + 2 * sliced_card.sell_cost } },
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
                    local eval = function(card) return card.ability.extra.loyalty_remaining == 0 and not G.RESET_JIGGLES end
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
            if (context.other_card:get_id() == 8) and (pseudorandom('vremade_8_ball') < G.GAME.probabilities.normal / card.ability.extra.odds) then
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
                                        key_append = 'vremade_8_ball' -- Optional, useful for checking the source of the creation.
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
                mult = pseudorandom('vremade_misprint', card.ability.extra.min, card.ability.extra.max)
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
        if G.playing_cards then
            for _, playing_card in pairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_steel') then steel_tally = steel_tally + 1 end
            end
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
    config = { extra = { dollars = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calc_dollar_bonus = function(self, card)
        return G.GAME.current_round.discards_used == 0 and G.GAME.current_round.discards_left > 0 and
            G.GAME.current_round.discards_left * card.ability.extra.dollars or nil
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
            if pseudorandom('vremade_gros_michel') < G.GAME.probabilities.normal / card.ability.extra.odds then
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
                                return true
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
    config = { extra = { odds = 2, dollars = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_face() and
            pseudorandom('vremade_business') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
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
        if context.before and context.main_eval and pseudorandom('vremade_space') < G.GAME.probabilities.normal / card.ability.extra.odds then
            return {
                level_up = true,
                message = localize('k_level_up_ex')
            }
        end
    end
}

-- Egg
SMODS.Joker {
    key = "egg",
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 0, y = 10 },
    config = { extra = { price = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.price } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra_value = card.ability.extra_value + card.ability.extra.price
            card:set_cost()
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
    end
}

-- Burglar
SMODS.Joker {
    key = "burglar",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 1, y = 10 },
    config = { extra = { hands = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            ease_discard(-G.GAME.current_round.discards_left, nil, true)
                            ease_hands_played(card.ability.extra.hands)
                            SMODS.calculate_effect(
                                { message = localize { type = 'variable', key = 'a_hands', vars = { card.ability.extra.hands } } },
                                context.blueprint_card or card)
                            return true
                        end
                    }))
                end
            }
        end
    end
}

-- Blackboard
SMODS.Joker {
    key = "blackboard",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 2, y = 10 },
    config = { extra = { xmult = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, localize('Spades', 'suits_plural'), localize('Clubs', 'suits_plural') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local all_black_suits = true
            for _, playing_card in ipairs(G.hand.cards) do
                if not playing_card:is_suit('Clubs', nil, true) and not playing_card:is_suit('Spades', nil, true) then
                    all_black_suits = false
                    break
                end
            end
            if all_black_suits then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
}

-- Runner
SMODS.Joker {
    key = "runner",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 5,
    pos = { x = 3, y = 10 },
    config = { extra = { chips = 0, chip_mod = 15 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod } }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint and next(context.poker_hands['Straight']) then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

-- Ice Cream
SMODS.Joker {
    key = "ice_cream",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 1,
    cost = 5,
    pos = { x = 4, y = 10 },
    config = { extra = { chips = 100, chip_mod = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod } }
    end,
    calculate = function(self, card, context)
        if context.after and context.main_eval and not context.blueprint then
            if card.ability.extra.chips - card.ability.extra.chip_mod <= 0 then
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
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                                return true
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = localize('k_melted_ex'),
                    colour = G.C.CHIPS
                }
            else
                card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_mod
                return {
                    message = localize { type = 'variable', key = 'a_chips_minus', vars = { card.ability.extra.chip_mod } },
                    colour = G.C.CHIPS
                }
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

-- DNA
SMODS.Joker {
    key = "dna",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 5, y = 10 },
    config = { extra = { copy = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.copy } }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.before and context.main_eval and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local copy_card = copy_card(context.full_hand[1], nil, nil, G.playing_card)
            copy_card:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, copy_card)
            G.hand:emplace(copy_card)
            copy_card.states.visible = nil

            G.E_MANAGER:add_event(Event({
                func = function()
                    copy_card:start_materialize()
                    return true
                end
            }))
            return {
                message = localize('k_copied_ex'),
                colour = G.C.CHIPS,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.calculate_context({ playing_card_added = true, cards = { copy_card } })
                            return true
                        end
                    }))
                end
            }
        end
    end
}

-- Splash
SMODS.Joker {
    key = "splash",
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    pos = { x = 6, y = 10 },
    calculate = function(self, card, context)
        if context.modify_scoring_hand then
            return {
                add_to_hand = true
            }
        end
    end
}

-- Blue Joker
SMODS.Joker {
    key = "blue_joker",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 7, y = 10 },
    config = { extra = { chips = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chips * ((G.deck and G.deck.cards) and #G.deck.cards or 52) } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips * #G.deck.cards
            }
        end
    end
}

-- Sixth Sense
SMODS.Joker {
    key = "sixth_sense",
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 8, y = 10 },
    calculate = function(self, card, context)
        if context.destroy_card and not context.blueprint then
            if #context.full_hand == 1 and context.full_hand[1]:get_id() == 6 and G.GAME.current_round.hands_played == 0 then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            SMODS.add_card {
                                set = 'Spectral',
                                key_append = 'vremade_sixth_sense' -- Optional, useful for checking the source of the creation.
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end)
                    }))
                    return {
                        message = localize('k_plus_spectral'),
                        colour = G.C.SECONDARY_SET.Spectral,
                        remove = true
                    }
                end
                return {
                    remove = true
                }
            end
        end
    end
}

-- Constellation
SMODS.Joker {
    key = "constellation",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 9, y = 10 },
    config = { extra = { Xmult = 1, Xmult_mod = 0.1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult_mod, card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet' then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
            }
        end
        if context.joker_main then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end
}

-- Hiker
SMODS.Joker {
    key = "hiker",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 0, y = 11 },
    config = { extra = { chips = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
                card.ability.extra.chips
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end
    end
}

-- Faceless Joker
SMODS.Joker {
    key = "faceless",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 1, y = 11 },
    config = { extra = { dollars = 5, faces = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, card.ability.extra.faces } }
    end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == context.full_hand[#context.full_hand] then
            local face_cards = 0
            for _, discarded_card in ipairs(context.full_hand) do
                if discarded_card:is_face() then face_cards = face_cards + 1 end
            end
            if face_cards >= card.ability.extra.faces then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                return {
                    dollars = card.ability.extra.dollars,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            end
        end
    end
}

-- Green Joker
SMODS.Joker {
    key = "green_joker",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 2, y = 11 },
    config = { extra = { hand_add = 1, discard_sub = 1, mult = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hand_add, card.ability.extra.discard_sub, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.discard and not context.blueprint and context.other_card == context.full_hand[#context.full_hand] then
            local prev_mult = card.ability.extra.mult
            card.ability.extra.mult = math.max(0, card.ability.extra.mult - card.ability.extra.discard_sub)
            if card.ability.extra.mult ~= prev_mult then
                return {
                    message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.discard_sub } },
                    colour = G.C.RED
                }
            end
        end
        if context.before and context.main_eval and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.hand_add
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.hand_add } }
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Superposition
SMODS.Joker {
    key = "superposition",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 3, y = 11 },
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands["Straight"]) and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            local ace_check = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 14 then
                    ace_check = true
                    break
                end
            end
            if ace_check then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'Tarot',
                            key_append = 'vremade_superposition' -- Optional, useful for checking the source of the creation.
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('k_plus_tarot'),
                    colour = G.C.SECONDARY_SET.Tarot,
                }
            end
        end
    end
}

-- To Do List
SMODS.Joker {
    key = "todo_list",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 4, y = 11 },
    config = { extra = { dollars = 4, poker_hand = 'High Card' } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, localize(card.ability.extra.poker_hand, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and context.scoring_name == card.ability.extra.poker_hand then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local _poker_hands = {}
            for k, v in pairs(G.GAME.hands) do
                if v.visible and k ~= card.ability.extra.poker_hand then
                    _poker_hands[#_poker_hands + 1] = k
                end
            end
            card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed('vremade_to_do'))
            return {
                message = localize('k_reset')
            }
        end
    end,
    set_ability = function(self, card, initial, delay_sprites)
        local _poker_hands = {}
        for k, v in pairs(G.GAME.hands) do
            if v.visible and k ~= card.ability.extra.poker_hand then
                _poker_hands[#_poker_hands + 1] = k
            end
        end
        card.ability.extra.poker_hand = pseudorandom_element(_poker_hands,
            pseudoseed((card.area and card.area.config.type == 'title') and 'vremade_false_to_do' or 'vremade_to_do'))
    end
}

-- Cavendish
SMODS.Joker {
    key = "cavendish",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 5, y = 11 },
    config = { extra = { odds = 1000, Xmult = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if pseudorandom('vremade_cavendish') < G.GAME.probabilities.normal / card.ability.extra.odds then
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
                                return true
                            end
                        }))
                        return true
                    end
                }))
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
                xmult = card.ability.extra.Xmult
            }
        end
    end,
    in_pool = function(self, args) -- equivalent to `yes_pool_flag = 'vremade_gros_michel_extinct'`
        return G.GAME.pool_flags.vremade_gros_michel_extinct
    end
}

-- Card Sharp
SMODS.Joker {
    key = "card_sharp",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 6, y = 11 },
    config = { extra = { Xmult = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end,
}

-- Red Card
SMODS.Joker {
    key = "red_card",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 5,
    pos = { x = 7, y = 11 },
    config = { extra = { mult_gain = 3, mult = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.skipping_booster and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_gain } },
                colour = G.C.RED,
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
}

-- Madness
SMODS.Joker {
    key = "madness",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 7,
    pos = { x = 8, y = 11 },
    config = { extra = { xmult_gain = 0.5, xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint and not context.blind.boss then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            local destructable_jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced then
                    destructable_jokers[#destructable_jokers + 1] =
                        G.jokers.cards[i]
                end
            end
            local joker_to_destroy = pseudorandom_element(destructable_jokers, pseudoseed('vremade_madness'))

            if joker_to_destroy then
                joker_to_destroy.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        (context.blueprint_card or card):juice_up(0.8, 0.8)
                        joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
                        return true
                    end
                }))
            end
            return { message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } } }
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}

-- Square Joker
-- TODO: Fix sprite size
SMODS.Joker {
    key = "square",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 9, y = 11 },
    config = { extra = { chips = 0, chip_mod = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod } }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint and #context.full_hand == 4 then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
}

-- Seance
SMODS.Joker {
    key = "seance",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 0, y = 12 },
    config = { extra = { poker_hand = 'Straight Flush' } },
    loc_vars = function(self, info_queue, card)
        return { vars = { localize(card.ability.extra.poker_hand, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.poker_hand]) and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    SMODS.add_card {
                        set = 'Spectral',
                        key_append = 'vremade_seance' -- Optional, useful for checking the source of the creation.
                    }
                    G.GAME.consumeable_buffer = 0
                    return true
                end)
            }))
            return {
                message = localize('k_plus_spectral'),
                colour = G.C.SECONDARY_SET.Spectral
            }
        end
    end,
}

-- Riff-raff
SMODS.Joker {
    key = "riff_raff",
    blueprint_compat = true,
    rarity = 1,
    cost = 6,
    pos = { x = 1, y = 12 },
    config = { extra = { creates = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.creates } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            local jokers_to_create = math.min(2, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _ = 1, jokers_to_create do
                        SMODS.add_card {
                            set = 'Joker',
                            rarity = 'Common',
                            key_append = 'vremade_riff_raff' -- Optional, useful for checking the source of the creation.
                        }
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                colour = G.C.BLUE,
            }
        end
    end,
}

-- Vampire
SMODS.Joker {
    key = "vampire",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 7,
    pos = { x = 2, y = 12 },
    config = { extra = { Xmult_gain = 0.1, Xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult_gain, card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local enhanced = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(scored_card)) and not scored_card.debuff and not scored_card.vampired then
                    enhanced[#enhanced + 1] = scored_card
                    scored_card.vampired = true
                    scored_card:set_ability('c_base', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            scored_card.vampired = nil
                            return true
                        end
                    }))
                end
            end

            if #enhanced > 0 then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain * #enhanced
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end,
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
-- TODO: Add sprite effect
SMODS.Joker {
    key = "hologram",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 7,
    pos = { x = 4, y = 12 },
    soul_pos = { x = 2, y = 9 },
    config = { extra = { Xmult_gain = 0.25, Xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult_gain, card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.playing_card_added and not context.blueprint then
            card.ability.extra.Xmult = card.ability.extra.Xmult + #context.cards * card.ability.extra.Xmult_gain
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { self.ability.x_mult } },
            }
        end
        if context.joker_main then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end,
}

-- Vagabond
SMODS.Joker {
    key = "vagabond",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 5, y = 12 },
    config = { extra = { dollars = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if G.GAME.dollars <= card.ability.extra.dollars then -- See note about Talisman compatibility below
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'Tarot',
                            key_append = 'vremade_vagabond' -- Optional, useful for checking the source of the creation.
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('k_plus_tarot'),
                }
            end
        end
    end,
}

--[[
    Note: The popular mod Talisman replaces some in-game values with tables in order to be able to reach higher numbers.
    Talisman itself handles most compatibility except for comparisons between values.

    With Talisman installed `G.GAME.dollars <= card.ability.extra.dollars` will cause a crash.
    We can prevent this replacing that line with `to_big(G.GAME.dollars) <= to_big(card.ability.extra.dollars)`
    This will cause crashes as well because `to_big` doesn't exist without the mod installed, so to prevent that issue we can define it as follows:

    to_big = to_big or function(x) return x end

    This means that `to_big` will either be the Talisman defined `to_big` if it exists or a dummy function that does nothing if not.
--]]

-- Baron
SMODS.Joker {
    key = "baron",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 6, y = 12 },
    config = { extra = { xmult = 1.5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 13 then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    x_mult = card.ability.extra.xmult
                }
            end
        end
    end,
}

-- Cloud 9
SMODS.Joker {
    key = "cloud_9",
    blueprint_compat = false,
    rarity = 2,
    cost = 7,
    pos = { x = 7, y = 12 },
    config = { extra = { dollars = 1 } },
    loc_vars = function(self, info_queue, card)
        local nine_tally = 0
        if G.playing_cards then
            for _, playing_card in pairs(G.playing_cards) do
                if playing_card:get_id() == 9 then nine_tally = nine_tally + 1 end
            end
        end
        return { vars = { card.ability.extra.dollars, card.ability.extra.dollars * nine_tally } }
    end,
    calc_dollar_bonus = function(self, card)
        local nine_tally = 0
        for _, playing_card in pairs(G.playing_cards) do
            if playing_card:get_id() == 9 then nine_tally = nine_tally + 1 end
        end
        return nine_tally > 0 and card.ability.extra.dollars * nine_tally or nil
    end
}

-- Rocket
SMODS.Joker {
    key = "rocket",
    blueprint_compat = false,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 8, y = 12 },
    config = { extra = { dollars = 1, increase = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, card.ability.extra.increase } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss then
            card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.increase
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MONEY
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
}

-- Obelisk
SMODS.Joker {
    key = "obelisk",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 3,
    cost = 8,
    pos = { x = 9, y = 12 },
    config = { extra = { Xmult_gain = 0.2, Xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult_gain, card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local reset = true
            local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
            for k, v in pairs(G.GAME.hands) do
                if k ~= context.scoring_name and v.played >= play_more_than and v.visible then
                    reset = false
                    break
                end
            end
            if reset then
                if card.ability.extra.Xmult > 1 then
                    card.ability.extra.Xmult = 1
                    return {
                        message = localize('k_reset')
                    }
                end
            else
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end,
}

-- Midas Mask
SMODS.Joker {
    key = "midas_mask",
    blueprint_compat = false,
    rarity = 2,
    cost = 7,
    pos = { x = 0, y = 13 },
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local faces = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_face() then
                    faces[#faces + 1] = scored_card
                    scored_card:set_ability('m_gold', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if #faces > 0 then
                return {
                    message = localize('k_gold'),
                    colour = G.C.MONEY
                }
            end
        end
    end
}

-- Luchador
SMODS.Joker {
    key = "luchador",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 2,
    cost = 5,
    pos = { x = 1, y = 13 },
    loc_vars = function(self, info_queue, card)
        local main_end = nil
        if card.area and (card.area == G.jokers) then
            local disableable = G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.boss))
            main_end = {
                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { ref_table = self, align = "m", colour = disableable and G.C.GREEN or G.C.RED, r = 0.05, padding = 0.06 },
                            nodes = {
                                { n = G.UIT.T, config = { text = ' ' .. localize(disableable and 'k_active' or 'ph_no_boss_active') .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.9 } },
                            }
                        }
                    }
                }
            }
        end
        return { main_end = main_end }
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.boss then
                return {
                    message = localize('ph_boss_disabled'),
                    func = function()
                        G.GAME.blind:disable()
                    end
                }
            end
        end
    end
}

-- Photograph
-- TODO: Fix sprite
SMODS.Joker {
    key = "photograph",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    pos = { x = 2, y = 13 },
    config = { extra = { xmult = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
            local is_first_face = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_face() then
                    is_first_face = context.scoring_hand[i] == context.other_card
                    break
                end
            end
            if is_first_face then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
}

-- Gift Card
SMODS.Joker {
    key = "gift",
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 3, y = 13 },
    config = { extra = { sell_value = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.sell_value } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            for _, area in ipairs({ G.jokers, G.consumeables }) do
                for _, other_card in ipairs(area.cards) do
                    if other_card.set_cost then
                        other_card.ability.extra_value = (other_card.ability.extra_value or 0) +
                            card.ability.extra.sell_value
                        other_card:set_cost()
                    end
                end
            end
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
    end
}

-- Turtle Bean
SMODS.Joker {
    key = "turtle_bean",
    blueprint_compat = false,
    eternal_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 4, y = 13 },
    config = { extra = { h_size = 5, h_mod = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_size, card.ability.extra.h_mod } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.h_size - card.ability.extra.h_mod <= 0 then
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
                                return true
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            else
                card.ability.extra.h_size = card.ability.extra.h_size - card.ability.extra.h_mod
                G.hand:change_size(-card.ability.extra.h_mod)
                return {
                    message = localize { type = 'variable', key = 'a_handsize_minus', vars = { self.ability.extra.h_mod } },
                    colour = G.C.FILTER
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end
}

-- Erosion
SMODS.Joker {
    key = "erosion",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 5, y = 13 },
    config = { extra = { mult = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, math.max(0, card.ability.extra.mult * (G.playing_cards and (G.GAME.starting_deck_size - #G.playing_cards) or 0)), G.GAME.starting_deck_size } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = math.max(0, card.ability.extra.mult * (G.GAME.starting_deck_size - #G.playing_cards))
            }
        end
    end
}

-- Reserved Parking
SMODS.Joker {
    key = "reserved_parking",
    blueprint_compat = true,
    rarity = 1,
    cost = 6,
    pos = { x = 6, y = 13 },
    config = { extra = { odds = 2, dollars = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card:is_face() and
                pseudorandom('vremade_reserved_parking') < G.GAME.probabilities.normal / card.ability.extra.odds then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED
                    }
                else
                    G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                    return {
                        dollars = card.ability.extra.dollars,
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.dollar_buffer = 0
                                    return true
                                end
                            }))
                        end
                    }
                end
            end
        end
    end
}

-- Mail-In Rebate
SMODS.Joker {
    key = "mail",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 7, y = 13 },
    config = { extra = { dollars = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, localize((G.GAME.current_round.vremade_mail_card or {}).rank or 'Ace', 'ranks') } }
    end,
    calculate = function(self, card, context)
        if context.discard and not context.other_card.debuff and
            context.other_card:get_id() == G.GAME.current_round.vremade_mail_card.id then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end
}

--- This changes vremade_mail_card every round so every instance of Mail-In Rebate shares the same card.
--- You could replace this with a context.end_of_round reset instead if you want the variables to be local.
--- See SMODS.current_mod.reset_game_globals at the bottom of this file for when this function is called.
local function reset_vremade_mail_rank()
    G.GAME.current_round.vremade_mail_card = { rank = 'Ace' }
    local valid_mail_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_rank(playing_card) then
            valid_mail_cards[#valid_mail_cards + 1] = playing_card
        end
    end
    local mail_card = pseudorandom_element(valid_mail_cards, pseudoseed('vremade_mail' .. G.GAME.round_resets.ante))
    if mail_card then
        G.GAME.current_round.vremade_mail_card.rank = mail_card.base.value
        G.GAME.current_round.vremade_mail_card.id = mail_card.base.id
    end
end


-- To the Moon
SMODS.Joker {
    key = "to_the_moon",
    blueprint_compat = false,
    rarity = 2,
    cost = 5,
    pos = { x = 8, y = 13 },
    config = { extra = { interest = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.interest } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.interest_amount = G.GAME.interest_amount + card.ability.extra.interest
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.interest_amount = G.GAME.interest_amount - card.ability.extra.interest
    end
}

-- Hallucination
SMODS.Joker {
    key = "hallucination",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 9, y = 13 },
    config = { extra = { odds = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.open_booster and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if pseudorandom('vremade_hallucination' .. G.GAME.round_resets.ante) < G.GAME.probabilities.normal / card.ability.extra.odds then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        SMODS.add_card {
                            set = 'Tarot',
                            key_append = 'vremade_hallucination' -- Optional, useful for checking the source of the creation.
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('k_plus_tarot'),
                    colour = G.C.PURPLE,
                }
            end
        end
    end
}

-- Fortune Teller
SMODS.Joker {
    key = "fortune_teller",
    blueprint_compat = true,
    rarity = 1,
    cost = 6,
    pos = { x = 7, y = 5 },
    config = { extra = { mult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0) } }
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == "Tarot" then
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { G.GAME.consumeable_usage_total.tarot } },
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult *
                    (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0)
            }
        end
    end,
}

-- Juggler
SMODS.Joker {
    key = "juggler",
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 0, y = 1 },
    config = { extra = { h_size = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_size } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end
}

-- Drunkard
SMODS.Joker {
    key = "drunkard",
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 1, y = 1 },
    config = { extra = { d_size = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.d_size } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
        ease_discard(card.ability.extra.d_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
        ease_discard(-card.ability.extra.d_size)
    end
}

-- Stone Joker
SMODS.Joker {
    key = "stone",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 9, y = 0 },
    config = { extra = { chips = 25 } },
    loc_vars = function(self, info_queue, card)
        local stone_tally = 0
        if G.playing_card then
            for _, playing_card in pairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_stone') then stone_tally = stone_tally + 1 end
            end
        end
        return { vars = { card.ability.extra.chips, card.ability.extra.chips * stone_tally } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local stone_tally = 0
            for _, playing_card in pairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_stone') then stone_tally = stone_tally + 1 end
            end
            return {
                chips = card.ability.extra.chips * stone_tally
            }
        end
    end,
    in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_stone'`
        for _, playing_card in pairs(G.playing_cards) do
            if SMODS.has_enhancement(playing_card, 'm_stone') then
                return true
            end
        end
        return false
    end
}

-- Golden Joker
SMODS.Joker {
    key = "golden",
    blueprint_compat = false,
    rarity = 1,
    cost = 6,
    pos = { x = 9, y = 2 },
    config = { extra = { dollars = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
}

-- Lucky Cat
SMODS.Joker {
    key = "lucky_cat",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 5, y = 14 },
    config = { extra = { Xmult_gain = 0.25, Xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult_gain, card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card.lucky_trigger and not context.blueprint then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
                message_card = card
            }
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end,
    in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_lucky'`
        for _, playing_card in pairs(G.playing_cards) do
            if SMODS.has_enhancement(playing_card, 'm_lucky') then
                return true
            end
        end
        return false
    end
}

-- Baseball Card
SMODS.Joker {
    key = "baseball",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 6, y = 14 },
    config = { extra = { xmult = 1.5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.other_joker and (context.other_joker.config.center.rarity == 2 or context.other_joker.config.center.rarity == "Uncommon") then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}

-- Bull
SMODS.Joker {
    key = "bull",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 7, y = 14 },
    config = { extra = { chips = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chips * math.max(0, (G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return { -- TODO: Check Talisman compat
                xmult = card.ability.extra.chips * math.max(0, (G.GAME.dollars + (G.GAME.dollar_buffer or 0)))
            }
        end
    end,
}

-- Diet Cola
SMODS.Joker {
    key = "diet_cola",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 8, y = 14 },
    loc_vars = function(self, info_queue, card)
        return { vars = { localize { type = 'name_text', set = 'Tag', key = 'tag_double' } } }
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            add_tag(Tag('tag_double'))
                            play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                            return true
                        end)
                    }))
                end
            }
        end
    end,
}

-- Trading Card
SMODS.Joker {
    key = "trading",
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 9, y = 14 },
    config = { extra = { dollars = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(self, eval, true)
        end
        if context.discard and not context.blueprint and
            G.GAME.current_round.discards_used <= 0 and #context.full_hand == 1 then
            return {
                dollars = card.ability.extra.dollars,
                remove = true
            }
        end
    end
}

-- Flash Card
SMODS.Joker {
    key = "flash",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 5,
    pos = { x = 0, y = 15 },
    config = { extra = { mult_gain = 2, mult = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.reroll_shop and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                colour = G.C.MULT,
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Popcorn
SMODS.Joker {
    key = "popcorn",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 1,
    cost = 5,
    pos = { x = 1, y = 15 },
    config = { extra = { mult_loss = 4, mult = 20 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_loss } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.mult - card.ability.extra.mult_loss <= 0 then
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
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                                return true;
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            else
                card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_loss
                return {
                    message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.mult_loss } },
                    colour = G.C.MULT
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

-- Spare Trousers
SMODS.Joker {
    key = "trousers",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 4, y = 15 },
    config = { extra = { mult_gain = 2, mult = 20 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, localize('Two Pair', 'poker_hands'), card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint and (next(context.poker_hands['Two Pair']) or next(context.poker_hands['Full House'])) then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Ancient Joker
SMODS.Joker {
    key = "ancient",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 7, y = 15 },
    config = { extra = { xmult = 1.5 } },
    loc_vars = function(self, info_queue, card)
        local suit = (G.GAME.current_round.vremade_ancient_card or {}).suit or 'Spades'
        return { vars = { card.ability.extra.xmult, localize(suit, 'suits_singular'), colours = { G.C.SUITS[suit] } } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit(G.GAME.current_round.vremade_ancient_card.suit) then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}

--- This changes vremade_ancient_card every round so every instance of Ancient Joker shares the same card.
--- You could replace this with a context.end_of_round reset instead if you want the variables to be local.
--- See SMODS.current_mod.reset_game_globals at the bottom of this file for when this function is called.
local function reset_vremade_ancient_card()
    G.GAME.current_round.vremade_ancient_card = G.GAME.current_round.vremade_ancient_card or { suit = 'Spades' }
    local ancient_suits = {}
    for k, v in ipairs({ 'Spades', 'Hearts', 'Clubs', 'Diamonds' }) do
        if v ~= G.GAME.current_round.vremade_ancient_card.suit then ancient_suits[#ancient_suits + 1] = v end
    end
    local ancient_card = pseudorandom_element(ancient_suits, pseudoseed('vremade_ancient' .. G.GAME.round_resets.ante))
    G.GAME.current_round.vremade_ancient_card.suit = ancient_card
end

-- Ramen
SMODS.Joker {
    key = "ramen",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 2, y = 15 },
    config = { extra = { Xmult_loss = 0.01, Xmult = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_loss } }
    end,
    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
            if card.ability.extra.Xmult - card.ability.extra.Xmult_loss <= 1 then
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
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                                return true;
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            else
                card.ability.extra.Xmult = card.ability.extra.Xmult - card.ability.extra.Xmult_loss
                return {
                    message = localize { type = 'variable', key = 'a_xmult_minus', vars = { card.ability.extra.Xmult_loss } },
                    colour = G.C.RED
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end
}

-- Walkie Talkie
SMODS.Joker {
    key = "walkie_talkie",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 8, y = 15 },
    config = { extra = { chips = 10, mult = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            (context.other_card:get_id() == 10 or context.other_card:get_id() == 4) then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Seltzer
SMODS.Joker {
    key = "selzer",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 3, y = 15 },
    config = { extra = { hands_left = 10 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands_left } }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            return {
                repetitions = 1
            }
        end
        if context.after and not context.blueprint then
            if card.ability.extra.hands_left - 1 <= 0 then
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
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                                return true;
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = localize('k_drank_ex'),
                    colour = G.C.FILTER
                }
            else
                card.ability.extra.hands_left = card.ability.extra.hands_left - 1
                return {
                    message = card.ability.extra.hands_left .. '',
                    colour = G.C.FILTER
                }
            end
        end
    end
}

-- Castle
SMODS.Joker {
    key = "castle",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 9, y = 15 },
    config = { extra = { chips = 0, chip_mod = 3 } },
    loc_vars = function(self, info_queue, card)
        local suit = (G.GAME.current_round.vremade_castle_card or {}).suit or 'Spades'
        return { vars = { card.ability.extra.chip_mod, localize(suit, 'suits_singular'), card.ability.extra.chips, colours = { G.C.SUITS[suit] } } }
    end,
    calculate = function(self, card, context)
        if context.discard and not context.blueprint and not context.other_card.debuff and
            context.other_card:is_suit(G.GAME.current_round.vremade_castle_card.suit) then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

--- This changes vremade_castle_card every round so every instance of Castle shares the same card.
--- You could replace this with a context.end_of_round reset instead if you want the variables to be local.
--- See SMODS.current_mod.reset_game_globals at the bottom of this file for when this function is called.
local function reset_vremade_castle_card()
    G.GAME.current_round.vremade_castle_card = { suit = 'Spades' }
    local valid_castle_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_suit(playing_card) then
            valid_castle_cards[#valid_castle_cards + 1] = playing_card
        end
    end
    local castle_card = pseudorandom_element(valid_castle_cards,
        pseudoseed('vremade_castle' .. G.GAME.round_resets.ante))
    if castle_card then
        G.GAME.current_round.castle_card.suit = castle_card.base.suit
    end
end

-- Smiley Face
SMODS.Joker {
    key = "smiley",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 6, y = 15 },
    config = { extra = { mult = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Campfire
SMODS.Joker {
    key = "campfire",
    blueprint_compat = true,
    rarity = 3,
    cost = 9,
    pos = { x = 5, y = 15 },
    config = { extra = { xmult_gain = 0.25, xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.selling_card and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            return {
                message = localize('k_upgrade_ex')
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if G.GAME.blind.boss and card.ability.extra.xmult > 1 then
                card.ability.extra.xmult = 1
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}

------- WIP ----------------------------------------------------------------

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

-- Canio
SMODS.Joker {
    key = "caino", -- (sic)
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

-- This is done to change variables globally each round
function SMODS.current_mod.reset_game_globals(run_start)
    reset_vremade_mail_rank()    -- See Mail-In Rebate
    reset_vremade_ancient_card() -- See Ancient Joker
    reset_vremade_castle_card()  -- See Castle
end
