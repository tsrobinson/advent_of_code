using DelimitedFiles

track = readdlm("input/day3.txt")

function race(track, right, down)

    width = length(track[1])
    trees = 0
    x = y = 1

    while y <= size(track)[1]
        if track[y][x] == '#'
            trees += 1
        end

        y += down
        x += right
        if x % width == 0
            x = width
        else
            x %= width
        end
    end

    println("Completed course")
    println("There were $trees trees en route.")

    return(trees)
end

# Part 1
race(track, 3, 1)

# Part 2
routes = [race(track,1,1),
          race(track,3,1),
          race(track,5,1),
          race(track,7,1),
          race(track,1,2)]

reduce(*, routes)
