using DelimitedFiles

tickets = readdlm("input/day5.txt")

function binary_space(code)
    divisions = length(code)
    total_options = 2^divisions
    row_choice = 0
    for c = 1:divisions
        if code[c] == 'B' || code[c] == 'R'
            row_choice += total_options/(2^c)
        end
    end
    return(row_choice)
end

function seat_id(token)
    row = binary_space(token[1:7])
    column = binary_space(token[8:10])

    id = (row*8)+column

    return(id)
end

# Part 1
ids = map(seat_id, tickets)
println("Largest seat id: $(findmax(ids)[1])")

# Part 2
sorted_ids = sort(vec(ids))

for i = 1:(length(sorted_ids)-1)
    if sorted_ids[i+1] == sorted_ids[i]+2
        println("Your code: $(sorted_ids[i] + 1)")
    end
end
