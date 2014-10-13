# Get a number
# Get another number
# Get the operator - add, subtract, multiply, divide
# Perform the calculation
# Handle errors
# Generate the results

puts "What's your first number?"
a = gets.chomp

puts "What's your second number?"
b = gets.chomp

puts "Pick your calculation - Add (+) | Subtract (-) | Multiply (*) | Divide (/) "
operator = gets.chomp

def calculate(a,b,operator)

  if operator == "+"
    result = a.to_i + b.to_i
    puts "Your result is #{result}"
  elsif operator == "-"
    result = a.to_i - b.to_i
    puts "Your result is #{result}"
  elsif operator == "*"
    result = a.to_i * b.to_i
    puts "Your result is #{result}"
  elsif operator == "/"
    result = a.to_f / b.to_f
    puts "Your result is #{result}"
  else
    puts "Please pick a valid calculation - Add (+) | Subtract (-) | Multiply (*) | Divide (/) "
  end
end

calculate(a,b,operator)