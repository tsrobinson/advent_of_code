using DelimitedFiles

passports_in = readlines("input/day4.txt")
push!(passports_in, "")
passports = []
complete_passports = []
passport = []

for i in 1:size(passports_in)[1]
    details = passports_in[i]
    if details == ""
        push!(passports, passport)
        global passport = []
    else
        global passport = vcat(passport, split(details," "))
    end
end

for j in 1:length(passports)
    if length(passports[j]) - sum(occursin.("cid:",passports[j])) == 7
        push!(complete_passports, passports[j])
    end
end

println("Complete passports: $(size(complete_passports)[1])")

function valid(passport)

    #byr
    param = passport[occursin.("byr:",passport)][1]
    if match(r"byr:19[2-9][0-9]|byr:200[0-2]", param) == nothing
        return(0)
    end

    # iyr
    param = passport[occursin.("iyr:",passport)][1]
    if match(r"iyr:201[0-9]|iyr:2020", param) == nothing
        return(0)
    end

    # eyr
    param = passport[occursin.("eyr:",passport)][1]
    if match(r"eyr:202[0-9]|eyr:2030", param) == nothing
        return(0)
    end

    #hgt
    param = passport[occursin.("hgt:",passport)][1]
    if match(r"hgt:((1([5-8][0-9]|9[0-3])cm$)|((59|6[0-9]|7[0-6])in$))", param) == nothing
        return(0)
    end

    #hcl
    param = passport[occursin.("hcl:",passport)][1]
    if match(r"hcl:#[a-f0-9]{6}$", param) == nothing
        return(0)
    end

    #ecl
    param = passport[occursin.("ecl:",passport)][1]

    if match(r"ecl:(amb|blu|brn|gry|grn|hzl|oth)$", param) == nothing
        return(0)
    end

    #pid
    param = passport[occursin.("pid:",passport)][1]
    if match(r"pid:[0-9]{9}$", param) == nothing
        return(0)
    end

    return(1)
end

valid_passports = map(valid, complete_passports)

println("Valid passports: $(sum(valid_passports))")
