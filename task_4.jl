function mark_stairs!(r)
    side1 = Sud
    side2 = Ost
    h, w = go_to_corner!(r, side1, side2)
    s = West
    steps = 0
    while true
        if s == West
            steps = mark_line!(r, s)
        else
            move_mark_some_steps!(r, s, steps - 1)
            if isborder(r, West)
                break
            end
            move!(r, West)
        end
        if isborder(r, Nord)
            break
        end
        move!(r, Nord)
        s = inverse_side(s)
    end
    go_to_corner!(r, side1, side2)
    move_back(r, inverse_side(side1), inverse_side(side2), h, w)
end
