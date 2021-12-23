function mark_corners!(r)
    side1 = Nord
    side2 = West
    go_to_corner_with_walls!(r, side1, side2)
    for i in [Sud, Ost, Nord, West]
        putmarker_to_corner(i)
    end
    while length(sides) > 0
        move!(r, inverse_side(pop!(sides)))
    end
end
