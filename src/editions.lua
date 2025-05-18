SMODS.Edition {
    key = 'foil',
    shader = 'foil',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    config = { chips = 50 },
    in_shop = true,
    weight = 20,
    extra_cost = 2,
    sound = { sound = "foil1", per = 1.2, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.chips } }
    end,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                chips = card.edition.chips
            }
        end
    end
}

SMODS.Edition {
    key = 'holo',
    shader = 'holo',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    config = { mult = 10 },
    in_shop = true,
    weight = 14,
    extra_cost = 3,
    sound = { sound = "holo1", per = 1.2 * 1.58, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.mult } }
    end,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                mult = card.edition.mult
            }
        end
    end
}

SMODS.Edition {
    key = 'polychrome',
    shader = 'polychrome',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    config = { x_mult = 1.5 },
    in_shop = true,
    weight = 3,
    extra_cost = 5,
    sound = { sound = "polychrome1", per = 1.2, vol = 0.7 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.x_mult } }
    end,
    get_weight = function(self)
        return (G.GAME.edition_rate - 1) * G.P_CENTERS["e_negative"].weight + G.GAME.edition_rate * self.weight
    end,
    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_mult = card.edition.x_mult
            }
        end
    end
}

SMODS.Edition {
    key = 'negative',
    shader = 'negative',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    config = { card_limit = 1 },
    in_shop = true,
    weight = 3,
    extra_cost = 5,
    sound = { sound = "negative", per = 1.5, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.card_limit } }
    end,
    get_weight = function(self)
        return self.weight
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' and (card.config.center.discovered or card.bypass_discovery_center) then
            card.children.center:draw_shader('negative', nil, card.ARGS.send_to_shader)
            if card.children.front and card.ability.effect ~= 'Stone Card' then
                card.children.front:draw_shader('negative', nil, card.ARGS.send_to_shader)
            end
            card.children.center:draw_shader('negative_shine', nil, card.ARGS.send_to_shader)
        end
    end
}
