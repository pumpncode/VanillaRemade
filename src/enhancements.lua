SMODS.Enhancement {
    key = 'bonus',
    pos = { x = 1, y = 1 },
    config = { bonus = 30 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus } }
    end,
}

SMODS.Enhancement {
    key = 'mult',
    pos = { x = 2, y = 1 },
    config = { mult = 4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.mult } }
    end,
}

SMODS.Enhancement {
    key = 'wild',
    pos = { x = 3, y = 1 },
    any_suit = true
}

SMODS.Enhancement {
    key = 'glass',
    pos = { x = 5, y = 1 },
    config = { Xmult = 2, odds = 4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.Xmult, G.GAME.probabilities.normal, card.ability.odds } }
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and pseudorandom('glass') < G.GAME.probabilities.normal / card.ability.extra then
            return { remove = true }
        end
    end,
}

SMODS.Enhancement {
    key = 'steel',
    pos = { x = 6, y = 1 },
    config = { h_x_mult = 1.5 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.h_x_mult } }
    end,
}

SMODS.Enhancement {
    key = 'stone',
    pos = { x = 5, y = 0 },
    config = { bonus = 50 },
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus } }
    end,
}

SMODS.Enhancement {
    key = 'gold',
    pos = { x = 6, y = 0 },
    config = { h_dollars = 3 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.h_dollars } }
    end,
}

SMODS.Enhancement {
    key = 'lucky',
    pos = { x = 4, y = 1 },
    -- We can't use 'mult' or 'p_dollars' here because they would be scored unconditionally if they were
    config = { mult_amt = 20, dollars_amt = 20, mult_odds = 5, dollars_odds = 15 },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.mult_amt, card.ability.mult_odds, card.ability.dollars_amt, card.ability.dollars_odds} }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local ret = {}
            if pseudorandom('lucky_mult') < G.GAME.probabilities.normal / card.ability.mult_odds then
                card.lucky_trigger = true
                ret.mult = (ret.mult or 0) + card.ability.mult_amt
            end
            if pseudorandom('lucky_money') < G.GAME.probabilities.normal / card.ability.dollars_odds then
                card.lucky_trigger = true
                ret.dollars = (ret.dollars or 0) + card.ability.dollars_amt
            end
            return ret
        end
    end,
}
