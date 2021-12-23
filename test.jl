number = 21

include("myLibraries/myLibrary.jl")
include("task_$number.jl")

r = Robot("startPositions/pos_task_$number/untitled.sit", animate = true)

numb!(r)