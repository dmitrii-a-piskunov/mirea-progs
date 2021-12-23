function mark_perimeter!(r)
    side1 = Sud
    side2 = West
    h, w = go_to_corner!(r, side1, side2)
    for s in (Ost, Nord, West, Sud)
        mark_move!(r, s)
    end
    move_back(r, inverse_side(side1), inverse_side(side2), h, w)
end
