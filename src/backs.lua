-- Red Deck
SMODS.Back {
    key = "red",
    pos = { x = 0, y = 0 },
    config = { extra = { discards = 1 } },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.extra.discards } }
    end,
    apply = function(self, back)
        G.GAME.starting_params.discards = G.GAME.starting_params.discards + self.config.extra.discards
    end
}

-- Blue Deck
SMODS.Back {
    key = "blue",
    pos = { x = 0, y = 2 },
    config = { extra = { hands = 1 } },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.extra.hands } }
    end,
    locked_loc_vars = function(self, info_queue, back)
        return { vars = { 20 }}
    end,
    apply = function(self, back)
        G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
    end,
    check_for_unlock = function(self, args)
        if args.type == 'discover_amount' and args.amount >= 20 then
            return true
        end
        return false
    end
}

-- Yellow Deck
SMODS.Back {
    key = "yellow",
    pos = { x = 1, y = 2 },
    config = { extra = { dollars = 10 } },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.extra.dollars } }
    end,
    locked_loc_vars = function(self, info_queue, back)
        return { vars = { 50 }}
    end,
    apply = function(self, back)
        G.GAME.starting_params.dollars = G.GAME.starting_params.dollars + self.config.extra.dollars
    end,
    check_for_unlock = function(self, args)
        if args.type == 'discover_amount' and args.amount >= 50 then
            return true
        end
        return false
    end
}

-- Green Deck
SMODS.Back {
    key = "green",
    pos = { x = 2, y = 2 },
    config = { extra = { extra_hand_bonus = 2, extra_discard_bonus = 1 } },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.extra.extra_hand_bonus, self.config.extra.extra_discard_bonus } }
    end,
    locked_loc_vars = function(self, info_queue, back)
        return { vars = { 75 }}
    end,
    apply = function(self, back)
        G.GAME.modifiers.money_per_hand = self.config.extra.extra_hand_bonus
        G.GAME.modifiers.money_per_discard = self.config.extra.extra_discard_bonus
        G.GAME.modifiers.no_interest = true
    end,
    check_for_unlock = function(self, args)
        if args.type == 'discover_amount' and args.amount >= 75 then
            return true
        end
        return false
    end
}

-- Black Deck
SMODS.Back {
    key = "black",
    pos = { x = 3, y = 2 },
    config = { extra = { hands = -1, joker_slot = 1 } },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.extra.joker_slot, self.config.extra.hands } }
    end,
    locked_loc_vars = function(self, info_queue, back)
        return { vars = { 100 }}
    end,
    apply = function(self, back)
        G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.extra.hands
        G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slot
    end,
    check_for_unlock = function(self, args)
        if args.type == 'discover_amount' and args.amount >= 100 then
            return true
        end
        return false
    end
}

-- Magic Deck
SMODS.Back {
    key = "magic",
    pos = { x = 0, y = 3 },
    config = { extra = { voucher = 'v_crystal_ball', consumables = { 'c_fool', 'c_fool' } } },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return {
            vars = { localize { type = 'name_text', key = self.config.extra.voucher, set = 'Voucher' },
                localize { type = 'name_text', key = self.config.extra.consumables[1], set = 'Tarot' }
            }
        }
    end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['b_red'].unlocked then
            other_name = localize { type = 'name_text', set = 'Back', key = 'b_red' }
        end

        return { vars = { other_name } }
    end,
    apply = function(self, back)
        -- Apply the voucher
        G.GAME.used_vouchers[self.config.extra.voucher] = true
        G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
        G.E_MANAGER:add_event(Event({ -- Adding back objects of any type from a deck MUST be done within an event
            func = function()
                back.apply_to_run(nil, G.P_CENTERS[self.config.extra.voucher])
                return true
            end
        }))

        -- Apply the consumables
        delay(0.4)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in ipairs(self.config.extra.consumables) do
                    SMODS.add_card({ key = v })
                end
                return true
            end
        }))
    end,
    check_for_unlock = function(self, args)
        if args.type == 'win_deck' and args.deck == 'b_red' then
            return true
        end
        return false
    end
}

-- Nebula Deck
SMODS.Back {
    key = "nebula",
    pos = { x = 3, y = 0 },
    config = { extra = { voucher = 'v_telescope', consumable_slot = -1 } },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return { vars = { localize { type = 'name_text', key = self.config.extra.voucher, set = 'Voucher' }, self.config.extra.consumable_slot } }
    end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['b_blue'].unlocked then
            other_name = localize { type = 'name_text', set = 'Back', key = 'b_blue' }
        end

        return { vars = { other_name } }
    end,
    apply = function(self, back)
        -- Apply the voucher
        G.GAME.used_vouchers[self.config.extra.voucher] = true
        G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
        G.E_MANAGER:add_event(Event({
            func = function()
                back.apply_to_run(nil, G.P_CENTERS[self.config.extra.voucher])
                return true
            end
        }))

        -- Apply the consumable slot deduction
        G.GAME.starting_params.consumable_slots = G.GAME.starting_params.consumable_slots +
            self.config.extra.consumable_slot
    end,
    check_for_unlock = function(self, args)
        if args.type == 'win_deck' and args.deck == 'b_blue' then
            return true
        end
        return false
    end
}

-- Ghost Deck
SMODS.Back {
    key = "ghost",
    pos = { x = 6, y = 2 },
    config = { extra = { spectral_rate = 2, consumables = { 'c_hex' } } },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.extra.spectral_rate, self.config.extra.consumables[1] } }
    end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['b_yellow'].unlocked then
            other_name = localize { type = 'name_text', set = 'Back', key = 'b_yellow' }
        end

        return { vars = { other_name } }
    end,
    apply = function(self, back)
        -- Apply the spectral rate
        G.GAME.spectral_rate = self.config.extra.spectral_rate

        -- Apply the consumables
        delay(0.4)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in ipairs(self.config.extra.consumables) do
                    SMODS.add_card({ key = v })
                end
                return true
            end
        }))
    end,
    check_for_unlock = function(self, args)
        if args.type == 'win_deck' and args.deck == 'b_yellow' then
            return true
        end
        return false
    end
}

-- Abandoned Deck
SMODS.Back {
    key = "abandoned",
    pos = { x = 3, y = 3 },
    config = { extra = {} },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return { vars = {} }
    end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['b_green'].unlocked then
            other_name = localize { type = 'name_text', set = 'Back', key = 'b_green' }
        end

        return { vars = { other_name } }
    end,
    apply = function(self, back)
        G.GAME.starting_params.no_faces = true
    end,
    check_for_unlock = function(self, args)
        if args.type == 'win_deck' and args.deck == 'b_green' then
            return true
        end
        return false
    end
}

-- Checkered Deck
SMODS.Back {
    key = "checkered",
    pos = { x = 1, y = 3 },
    config = { extra = {} },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return { vars = {} }
    end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['b_black'].unlocked then
            other_name = localize { type = 'name_text', set = 'Back', key = 'b_black' }
        end

        return { vars = { other_name } }
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v.base.suit == 'Clubs' then
                        v:change_suit('Spades')
                    end
                    if v.base.suit == 'Diamonds' then
                        v:change_suit('Hearts')
                    end
                end
                return true
            end
        }))
    end,
    check_for_unlock = function(self, args)
        if args.type == 'win_deck' and args.deck == 'b_black' then
            return true
        end
        return false
    end
}

-- Zodiac Deck
SMODS.Back {
    key = "zodiac",
    pos = { x = 3, y = 4 },
    config = { extra = { vouchers = { 'v_tarot_merchant', 'v_planet_merchant', 'v_overstock_norm' } } },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return {
            vars = { localize { type = 'name_text', key = self.config.extra.vouchers[1], set = 'Voucher' },
                localize { type = 'name_text', key = self.config.extra.vouchers[2], set = 'Voucher' },
                localize { type = 'name_text', key = self.config.extra.vouchers[3], set = 'Voucher' }
            }
        }
    end,
    locked_loc_vars = function(self, info_queue, back)
        return {
            vars = {
                localize { type = 'name_text', set = 'Stake', key = 'stake_red' },
                -- The colours table is a table within vars{} that can be used for variable colors in loc_vars
                colours = { get_stake_col(2) }
            }
        }
    end,
    apply = function(self, back)
        for k, v in pairs(self.config.extra.vouchers) do
            G.GAME.used_vouchers[v] = true
            G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    back.apply_to_run(nil, G.P_CENTERS[v])
                    return true
                end
            }))
        end
    end,
    check_for_unlock = function(self, args)
        if args.type == 'win_stake' and args.stake >= 2 then
            return true
        end
        return false
    end
}

-- Painted Deck
SMODS.Back {
    key = "painted",
    pos = { x = 4, y = 3 },
    config = { extra = { hand_size = 2, joker_slot = -1 } },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.extra.hand_size, self.config.extra.joker_slot } }
    end,
    locked_loc_vars = function(self, info_queue, back)
        return {
            vars = {
                localize { type = 'name_text', set = 'Stake', key = 'stake_green' },
                colours = { get_stake_col(3) }
            }
        }
    end,
    apply = function(self, back)
        G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + self.config.extra.hand_size
        G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slot
    end,
    check_for_unlock = function(self, args)
        if args.type == 'win_stake' and args.stake >= 3 then
            return true
        end
        return false
    end
}

-- Anaglyph Deck
SMODS.Back {
    key = "anaglyph",
    pos = { x = 2, y = 4 },
    config = { extra = {} },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return { vars = { localize { type = 'name_text', key = 'tag_double', set = 'Tag' } } }
    end,
    locked_loc_vars = function(self, info_queue, back)
        return {
            vars = {
                localize { type = 'name_text', set = 'Stake', key = 'stake_black' },
                colours = { get_stake_col(4) }
            }
        }
    end,
    calculate = function(self, back, context)
        -- This context is only ever used for this deck in vanilla
        -- The timing of this trigger is unique to this context as well
        if context.context == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss then
            G.E_MANAGER:add_event(Event({
                func = function()
                    add_tag(Tag('tag_double'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
        end
    end,
    check_for_unlock = function(self, args)
        if args.type == 'win_stake' and args.stake >= 4 then
            return true
        end
        return false
    end
}

-- Plasma Deck
SMODS.Back {
    key = "plasma",
    pos = { x = 4, y = 2 },
    config = { extra = { ante_scaling = 2 } },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.extra.ante_scaling } }
    end,
    locked_loc_vars = function(self, info_queue, back)
        return {
            vars = {
                localize { type = 'name_text', set = 'Stake', key = 'stake_blue' },
                colours = { get_stake_col(5) }
            }
        }
    end,
    calculate = function(self, back, context)
        if context.final_scoring_step then
            -- 'hand_chips' and 'mult' are global variables that hold the chip and mult values at time of calculation
            local total = hand_chips + mult
            hand_chips = mod_chips(math.floor(total / 2))
            mult = mod_mult(math.floor(total / 2))
            update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })
            
            G.E_MANAGER:add_event(Event({
            func = (function()
                local text = localize('k_balanced')
                play_sound('gong', 0.94, 0.3)
                play_sound('gong', 0.94*1.5, 0.2)
                play_sound('tarot1', 1.5)
                ease_colour(G.C.UI_CHIPS, {0.8, 0.45, 0.85, 1})
                ease_colour(G.C.UI_MULT, {0.8, 0.45, 0.85, 1})
                attention_text({
                    scale = 1.4, text = text, hold = 2, align = 'cm', offset = {x = 0,y = -2.7},major = G.play
                })
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    blockable = false,
                    blocking = false,
                    delay =  4.3,
                    func = (function() 
                            ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
                            ease_colour(G.C.UI_MULT, G.C.RED, 2)
                        return true
                    end)
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    blockable = false,
                    blocking = false,
                    no_delete = true,
                    delay =  6.3,
                    func = (function() 
                        G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
                        G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
                        return true
                    end)
                }))
                return true
            end)
        }))

        delay(0.6)
        end
    end,
    apply = function(self, back)
        G.GAME.starting_params.ante_scaling = self.config.extra.ante_scaling
    end,
    check_for_unlock = function(self, args)
        if args.type == 'win_stake' and args.stake >= 5 then
            return true
        end
        return false
    end
}

-- Erratic Deck
SMODS.Back {
    key = "erratic",
    pos = { x = 2, y = 3 },
    config = { extra = {} },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return { vars = {} }
    end,
    locked_loc_vars = function(self, info_queue, back)
        return {
            vars = {
                localize { type = 'name_text', set = 'Stake', key = 'stake_orange' },
                colours = { get_stake_col(7) }
            }
        }
    end,
    apply = function(self, back)
        G.GAME.starting_params.erratic_suits_and_ranks = true
    end,
    check_for_unlock = function(self, args)
        if args.type == 'win_stake' and args.stake >= 7 then
            return true
        end
        return false
    end
}
