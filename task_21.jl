function numb!(r)
    function change(side, num)
        return HorizonSide((Int(side) + num) % 4)
    end

    function go_around(side)
        num = 0
        while isborder(r, side)
            if !isborder(r, change(side, 1))
                move!(r, change(side, 1))
                num += 1
            else
                brea
            end
        end
        if isborder(r, side)
            for i in 1:num
                if !isborder(r, change(side, 3))
                    move!(r, change(side, 3))
                end
            end
            return false
        else
            move!(r, side)
            for i in 1:num
                if !isborder(r, change(side, 3))
                    move!(r, change(side, 3))
                end
            end
            return true
        end
    end

    function move_and_num(side, num)
        flag = false
        ok = true
        count = 0
        while true 
            if (isborder(r, change(side, num)) && !flag)
                flag = true
                count += 1
            elseif !isborder(r, change(side, num))
                flag = false
            end
            if (isborder(r, side))
                ok = go_around(side)
            end
            if ok
                if !isborder(r, side)
                    move!(r, side)
                end
            else
                break
            end
        end
        return count
    end

    function num(side, move_side, ok) 
        count = 0
        n = 1
        if ok
            n = 1
        else
            n = 3
        end
        while !isborder(r, side)
            count += move_and_num(move_side, n)
            move_side = change(move_side, 2)
            n = (n + 2) % 4
            move!(r, side)
        end
        return count
    end

    function solve()
        count = 0
        count += num(Nord, Ost, true)
        while !isborder(r, Sud)
            move!(r, Sud)
        end
        count += num(Ost, Nord, false)
        println(count)
    end

    solve()
end