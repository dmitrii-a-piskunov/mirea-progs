function perimeter_2!(r)

    dir = []
    set(Nord, West, dir)

    for i in [Sud, Ost, Nord, West]
        go_forward(i)
    end

    while length(dir) > 0
        move!(r, inverse_side(pop!(dir)))
    end
    
end