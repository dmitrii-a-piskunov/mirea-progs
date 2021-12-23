function mark_all!(r::AbstractChessRobot)
    side1 = Sud
    side2 = West
    h, w = go_to_corner!(r, side1, side2)
    s = Ost
    mark_snake!(r, s)
    go_to_corner!(r, side1, side2)
    move_back(r, inverse_side(side1), inverse_side(side2), h, w)
end
