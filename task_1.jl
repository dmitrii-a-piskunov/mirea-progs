function mark_kross!(r)
    for s in (Nord, West, Sud, Ost)
        move_mark!(r, s)
        move_by_marks!(r, inverse_side(s))
    end
    putmarker!(r)
end
