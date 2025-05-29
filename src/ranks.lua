-- Directly pulled from SMODS

for _, v in ipairs({ 2, 3, 4, 5, 6, 7, 8, 9 }) do
    SMODS.Rank {
        key = v .. '',
        card_key = v .. '',
        pos = { x = v - 2 },
        nominal = v,
        next = { (v + 1) .. '' },
    }
end

SMODS.Rank {
    key = '10',
    card_key = 'T',
    pos = { x = 8 },
    nominal = 10,
    next = { 'Jack' },
}

SMODS.Rank {
    key = 'Jack',
    card_key = 'J',
    pos = { x = 9 },
    nominal = 10,
    face_nominal = 0.1,
    face = true,
    shorthand = 'J',
    next = { 'Queen' },
}

SMODS.Rank {
    key = 'Queen',
    card_key = 'Q',
    pos = { x = 10 },
    nominal = 10,
    face_nominal = 0.2,
    face = true,
    shorthand = 'Q',
    next = { 'King' },
}

SMODS.Rank {
    key = 'King',
    card_key = 'K',
    pos = { x = 11 },
    nominal = 10,
    face_nominal = 0.3,
    face = true,
    shorthand = 'K',
    next = { 'Ace' },
}

SMODS.Rank {
    key = 'Ace',
    card_key = 'A',
    pos = { x = 12 },
    nominal = 11,
    face_nominal = 0.4,
    shorthand = 'A',
    straight_edge = true,
    next = { '2' },
}
