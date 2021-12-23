function chess!(r)

    x = 0
    y = 0
    ok = 0
    while !isborder(r, Sud)
        move!(r, Sud)
        y += 1
    end
    while !isborder(r, West)
        move!(r, West)
        x += 1
    end

    if (x + y) % 2 == 0
        ok = 1
    else
        ok = 0
    end

    n = 1
    line(Ost, ok)
    ok += 1
    ok = ok % 2
    while !isborder(r, Nord)
        move!(r, Nord)
        if (n % 2 == 0)
            line(Ost, ok)
        else
            line(West, ok)
        end
        ok += 1
        ok = ok % 2
        n += 1
    end

    while !isborder(r, Sud)
        move!(r, Sud)
    end
    while !isborder(r, West)
        move!(r, West)
    end
    for i in 1:x
        move!(r, Ost)
    end
    for i in 1:y
        move!(r, Nord)
    end
end