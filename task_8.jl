function infinite_border!(r)
    n = 1
    while isborder(r, Nord)
        if (n % 2 == 0)
            move_to_side(West, n)
        else
            move_to_side(Ost, n)
        end
        n += 1
    end
end