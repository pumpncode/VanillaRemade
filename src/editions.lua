SMODS.Edition {
    key = 'foil',
    shader = 'foil',
    config = { extra = { chips = 50 } },
    in_shop = true,
    weight = 20,
    extra_cost = 2,
    sound = { sound = "foil1", per = 1.2, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.chips } }
    end,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end
}

SMODS.Edition {
    key = 'holo',
    shader = 'holo',
    config = { extra = { mult = 10 } },
    in_shop = true,
    weight = 14,
    extra_cost = 3,
    sound = { sound = "holo1", per = 1.2 * 1.58, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.mult } }
    end,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end
}

SMODS.Edition {
    key = 'polychrome',
    shader = 'polychrome',
    config = { extra = { x_mult = 1.5 } },
    in_shop = true,
    weight = 3,
    extra_cost = 5,
    sound = { sound = "polychrome1", per = 1.2, vol = 0.7 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.x_mult } }
    end,
    get_weight = function(self)
        return (G.GAME.edition_rate - 1) * G.P_CENTERS["e_negative"].weight + G.GAME.edition_rate * self.weight
    end
}

SMODS.Edition {
    key = 'negative',
    shader = 'negative',
    config = { extra = { card_limit = 1 } },
    in_shop = true,
    weight = 3,
    extra_cost = 5,
    sound = { sound = "negative", per = 1.5, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.card_limit } }
    end,
    get_weight = function(self)
        return self.weight
    end
}
