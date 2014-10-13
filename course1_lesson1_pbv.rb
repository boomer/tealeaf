# Create an array
# Create a mehtod that takes that array as a paramter
# Add an element to the array in the method

require "pry"

def select(arr)
  arr.select {|i| i > 2}
  puts "Here's the new array (outside the method): #{arr}."
end

def convert(arr)
  puts "Give me a number."
  n = gets.chomp
  n = n.to_i
  arr << n
  puts "Here's the new array (inside the method): #{arr}."
end

arr = [1,2,3]

select(arr)

convert(arr)


# def mutate(arr)
#   arr.pop
# end

# def not_mutate(arr)
#   arr.select { |i| i > 3 }
# end

# a = [1, 2, 3, 4, 5, 6]
# not_mutate(a)

# puts a

# mutate(a)

# puts a

