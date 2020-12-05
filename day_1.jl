using DelimitedFiles

numbers = readdlm("input/day1.txt")

# Part 1
found = false
i = 1

while !found
   target = 2020 - numbers[i]

   located = findall(numbers .== target)

   if size(located) == (1,)
      global answer = numbers[i]*numbers[located[1]]
      global found = true
   end

   global i += 1
end

# Part 2
using IterTools

combinations_3 = subsets(numbers, 3)

for i in combinations_3
   if sum(i) == 2020
      @show i[1]*i[2]*i[3]
      break
   end
end
