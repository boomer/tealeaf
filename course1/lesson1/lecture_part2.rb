# 1. string interpolation vs concat
# 2. extract reptitive logic to methods
# 3. keep track of variable types (class)
# 4. variable scope determined by do...end; outer scope vars are available to inner scope but not vice versa.

# require 'pry'


# def say(msg)
#   puts "=> #{msg}"
# end

# say "What's the first number?"
# num1 = gets.chomp

# say "What's the second number?"
# num2 = gets.chomp

# say "1) add 2) subtract 3) multiple 4) divide"
# operator = gets.chomp

# binding.pry

# if operator == '1'
#   result = num1.to_i + num2.to_i
# elsif operator == '2'
#   result = num1.to_i - num2.to_i
# elsif operator == '3'
#   result = num1.to_i * num2.to_i
# else
#   result = num1.to_f / num2.to_f
# end

# puts "Result is #{result}."
    
