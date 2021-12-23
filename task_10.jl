function temperature()
    temp = 0
    num = 0
    side = Ost
    flag = false
    while !flag
        while !isborder(r, side)
            if ismarker(r)
                temp += temperature(r)
                num += 1
            end
            move!(r, side)
        end
        side = inverse_side(side)
        flag = isborder(r, Nord)
        if !flag
            move!(r, Nord)
        end
    end
    if num != 0
        println(temp / num)
    else
        println(0)
    end
end 
