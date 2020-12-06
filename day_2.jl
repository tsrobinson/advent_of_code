using DelimitedFiles

pw_data = readdlm("input/day2.txt")

# Part 1
global possible_1 = 0

for i in 1:size(pw_data)[1]
    local pw_params = pw_data[i,1]
    local search_char = pw_data[i,2][1]
    local pw = pw_data[i,3]
    local char_n = count(i->(i==search_char), pw)

    local param_split = findfirst(isequal('-'),pw_params)

    local min_times = parse(Int, pw_params[1:(param_split-1)])
    local max_times = parse(Int, pw_params[(param_split + 1):length(pw_params)])

    if min_times <= char_n <= max_times
        global possible_1 += 1
    end

end

# Part 2
global possible_2 = 0

for i in 1:size(pw_data)[1]
    local pw_params = pw_data[i,1]
    local param_split = findfirst(isequal('-'),pw_params)
    local indx1 = parse(Int, pw_params[1:(param_split-1)])
    local indx2 = parse(Int, pw_params[(param_split + 1):length(pw_params)])


    local search_char = pw_data[i,2][1]
    local pw = pw_data[i,3]



    if ((pw[indx1] == search_char) + (pw[indx2] == search_char)) == 1
        global possible_2 += 1
    end

end
