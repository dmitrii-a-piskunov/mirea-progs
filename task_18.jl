function labyrinth(r)
    sides = []

    # функция, которая выводит робота в левый верхний угол
    function go_to_angle()
        while (!isborder(r, Nord) || !isborder(r, West))
            while !isborder(r, Nord)
                move!(r, Nord)
                push!(sides, Nord)
            end
            while !isborder(r, West)
                move!(r, West)
                push!(sides, West)
            end
        end
    end

    function put_marker_to_angle(side)
        while !isborder(r, side)
            move!(r, side)
        end
        putmarker!(r)
    end

    function solve()
        go_to_angle()
        for i in [Sud, Ost, Nord, West]
            put_marker_to_angle(i)
        end

        while length(sides) > 0
            move!(r, inverse_side(pop!(sides)))
        end
    end

    solve()
end