function kross!(r)
    x = 0
    y = 0

    function set_corner(side1, side2, sides::AbstractArray)
        while !isborder(r, side1) || !isborder(r, side2)
            while !isborder(r, side2)
                move!(r, side2)
                push!(sides, side2)
                x += 1
            end
            while !isborder(r, side1)
                move!(r, side1)
                push!(sides, side1)
                y += 1
            end
        end
    end

    function put_markers(side1, side2)
        for i in 1:x
            move!(r, side1)
        end
        putmarker!(r)
        for i in 1:x
            move!(r, inverse_side(side1))
        end

        for i in 1:y
            move!(r, side2)
        end
        putmarker!(r)
        for i in 1:y
            move!(r, inverse_side(side2))
        end
    end

    function solve(s1, s2, s3, s4)
        x = 0
        y = 0

        sides = []
        set_corner(s1, s4, sides)

        put_markers(s2, s3)

        while length(sides) > 0
            move!(r, inverse_side(pop!(sides)))
        end
    end

    solve(Nord, Ost, Sud, West)
    solve(Ost, Nord, West, Sud)
end