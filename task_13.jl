function mark_kross_diag!(r)

    function inverse_side_2(side, k)
        return HorizonSide((Int(side) + k) % 4)
    end

    function mark_diag(s)
        k = 0
        while (!isborder(r, s) && !isborder(r, inverse_side_2(s, 1)))
            move!(r, s)
            move!(r, inverse_side_2(s, 1))
            putmarker!(r)
            k += 1
        end
        for i in 1:k
            move!(r, inverse_side_2(s, 2))
            move!(r, inverse_side_2(s, 3))
        end
    end

    for i in [Nord, Ost, Sud, West]
        mark_diag(i)
    end
    putmarker!(r)
end