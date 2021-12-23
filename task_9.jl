function spiral!(r)
    a = 1
    s = Nord
    while !ismarker(r)
        for i in 1:a
            if ismarker(r)
                break
            end
            move!(r, s)
        end
        s = rotate_right(s)
        for i in 1:a
            if ismarker(r)
                break
            end
            move!(r, s)
        end
        if ismarker(r)
            break
        end
        s = rotate_right(s)
        a += 1
    end
end