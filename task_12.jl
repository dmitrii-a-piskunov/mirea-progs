function chess_n!(r)

    # перемещаем робота в левый нижний угол и запоминаем движение
    sides = []
    while !isborder(r, Sud)
        move!(r, Sud)
        push!(sides, Sud)
    end
    while !isborder(r, West)
        move!(r, West)
        push!(sides, West)
    end

    n = 4 # сторона одного квадрата
    count = 0
    k = 0
    flag = false
    while !flag
        for i in 1:n
            print_line(Ost, n, count)
            if isborder(r, Nord)
                flag = true
                break
            end
            move!(r, Nord)
        end
        if flag
            break
        end
        count += n
    end

    while !isborder(r, Sud)
        move!(r, Sud)
    end
    while !isborder(r, West)
        move!(r, West)
    end
    for i in sides
        move!(r, inverse_side(i))
    end
end