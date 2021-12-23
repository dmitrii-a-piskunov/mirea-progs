function mark_kross_2!(r)
    for i in [Nord, West, Sud, Ost]
        go_to_border_and_draw(i)
    end
end