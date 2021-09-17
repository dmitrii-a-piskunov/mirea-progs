function kross!(r)
    for s in (Nord, West, Sud, Ost)
        markers!(r, s)
        moves!(r, inverse(s))
    end
    putmarker!(r)
end

function markers!(r, s)
    while !isborder(r, s)
        move!(r, s)
        putmarker!(r)
    end
end

function moves!(r, s)
    while ismarker(r)
        move!(r, s)
    end
end

function inverse(s)
    HorizonSide((Int(s) + 2) % 4)
end

kross!(r)