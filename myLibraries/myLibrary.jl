using HorizonSideRobots

function move_to_border!(r, s)
    while !isborder(r, s)
        move!(r, s)
    end
end

function move_to_side(s, num)
    for i in 1:num
        move!(r, s)
    end
end

function move_mark!(r, s)
    while !isborder(r, s)
        move!(r, s)
        putmarker!(r)
    end
end

function move_by_marks!(r, s)
    while ismarker(r)
        move!(r, s)
    end
end

function inverse_side(s)
    HorizonSide((Int(s) + 2) % 4)
end

function rotate_left(s)
    HorizonSide((Int(s) + 1) % 4)
end

function rotate_right(s)
    return HorizonSide((Int(s) + 3) % 4)
end 

function mark_move!(r, s)
    while !isborder(r, s)
        putmarker!(r)
        move!(r, s)
    end
end

function go_to_corner!(r, side1, side2)
    h = 0
    w = 0
    while !isborder(r, side1) || !isborder(r, side2)
        if !isborder(r, side1)
            move!(r, side1)
            h += 1
        elseif !isborder(r, side2)
            move!(r, side2)
            w += 1
        end
    end
    return (h, w)
end

sides = []
function go_to_corner_with_walls!(r, side1, side2)
    while !isborder(r, side1) || !isborder(r, side2)
        while !isborder(r, side1)
            move!(r, side1)
            push!(sides, side1)
        end
        while !isborder(r, side2)
            move!(r, side2)
            push!(sides, side2)
        end
    end
end

function putmarker_to_corner(side)
    putmarker!(r)
    while !isborder(r, side)
        move!(r, side)
    end
end

function move_some_steps!(r, s, steps)
    for i in 1:steps
        move!(r, s)
    end
end

function move_mark_some_steps!(r, s, steps)
    putmarker!(r)
    for i in 1:steps
        move!(r, s)
        putmarker!(r)
    end
end

function move_back(r, side1, side2, steps1, steps2)
    move_some_steps!(r, side1, steps1)
    move_some_steps!(r, side2, steps2)
end

function mark_line!(r, s)
    steps = 0
    putmarker!(r)
    while !isborder(r, s)
        move!(r, s)
        putmarker!(r)
        steps += 1
    end
    return steps
end

function mark_snake!(r, s)
    while true
        mark_line!(r, s)
        if isborder(r, Nord)
            break
        end
        move!(r, Nord)
        s = inverse_side(s)
    end
end

function line(side, flag)
    while !isborder(r, side)
        if flag == 1
            putmarker!(r)
            move!(r, side)
            if (!isborder(r, side))
                move!(r, side)
            end
        else
            move!(r, side)
            putmarker!(r)
            if (!isborder(r, side))
                move!(r, side)
            end
        end
    end
    if (flag == 1)
        putmarker!(r)
    end
end

function next(s, num)
    return HorizonSide((Int(s) + num) % 4)
end

function print_line(s, num)
    while !isborder(r, s)
        for i in 1:num
            putmarker!(r)
            if !isborder(r, s)
                move!(r, s)
            end
        end
        for i in 1:num
            if !isborder(r, s)
                move!(r, s)
            end
        end
    end
end

function print_line(s, n, count)
    while !isborder(r, s)
        if trunc(count / n) % 2 == 0
            putmarker!(r)
        end
        move!(r, s)
        count += 1
    end
    if trunc(count / n) % 2 == 0
        putmarker!(r)
    end 
    count += 1 
    while !isborder(r, inverse_side(s))     
        move!(r, inverse_side(s))
    end
end

function go_around(s, dir::AbstractArray)
    num = 0
    flag = true
    while (isborder(r, s) && !isborder(r, next(s, 1)))
        move!(r, next(s, 1))
        num += 1
        push!(dir, next(s, 1))
    end
    if !isborder(r, s)
        move!(r, s)
        push!(dir, s)
    else
        flag = false
    end
    if flag
        while isborder(r, next(s, 3))
            move!(r, s)
            push!(dir, s)
        end
        for i in 1:num
            move!(r, next(s, 3))
            push!(dir, (next(s, 3)))
        end
    end
end

function go_to_border_and_draw(s)
    dir = []
    while true
        if !isborder(r, s)
            putmarker!(r)
            move!(r, s)
            push!(dir, s)
        else
            putmarker!(r)
            go_around(s, dir)
        end
        if (isborder(r, s) && isborder(r, next(s, 1)))
            break
        end
    end

    while length(dir) > 0
        move!(r, next(pop!(dir), 2))
    end
end

function go_forward(s)
    while !isborder(r, s)
        putmarker!(r)
        move!(r, s)
    end
end

function set(side1, side2, dir)
    while !isborder(r, side1) || !isborder(r, side2)
        while !isborder(r, side1)
            move!(r, side1)
            push!(dir, side1)
        end
        while !isborder(r, side2)
            move!(r, side2)
            push!(dir, side2)
        end
    end
end

