using DelimitedFiles

numbers = readdlm("input/day1.txt")

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
