function mark_around_border!(r)
    height = 11
    width = 12
    side1 = Sud
    side2 = West
    go_to_corner_with_walls!(r, side1, side2)

    k = 0
    number_now = 0
    side = Ost
    while !isborder(r, Nord)
        if k % 2 == 0
            number_now = counter(Ost)
            side = Ost
        else
            number_now = counter(West)
            side = West
        end
        k += 1
        if (number_now + 1) != width
            break
        end
        move!(r, Nord)
    end

    if (side == West)
        for i in [Sud, West, Nord, Ost, Sud]
            mark_around(i)
        end
    else
        for i in [Nord, Ost, Sud, West, Nord]
            mark_around(i)
        end
    end

    while !isborder(r, side1) || !isborder(r, side2)
        while (!isborder(r, side1))
            move!(r, side1)
        end
        while (!isborder(r, side2))
            move!(r, side2)
        end
    end

    while length(sides) > 0
        move!(r, inverse_side(pop!(sides)))
    end 
end