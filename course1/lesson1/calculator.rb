# Get a number
# Get another number
# Get the operator - add, subtract, multiply, divide
# Perform the calculation
# Handle errors
# Generate the results

def calculate(a,b,operator)

  if operator == "+"
    result = a.to_i + b.to_i
    puts "#{a}+#{b}=#{result}"
  elsif operator == "-"
    result = a.to_i - b.to_i
    puts "#{a}-#{b}=#{result}"
  elsif operator == "*"
    result = a.to_i * b.to_i
    puts "#{a}*#{b}=#{result}"
  elsif operator == "/"
    result = a.to_f / b.to_f
    puts "#{a}/#{b}=#{result}"
  end
end

puts "What's your first number?"
a = gets.chomp

puts "What's your second number?"
b = gets.chomp

puts "Pick your calculation - Add (+) | Subtract (-) | Multiply (*) | Divide (/)"
operator = gets.chomp

if ['+','-','*','/'].include?operator
  calculate(a,b,operator)
else
  puts "You've got fat fingers. Try again. Pick your calculation - Add (+) | Subtract (-) | Multiply (*) | Divide (/) "
  operator = gets.chomp
  calculate(a,b,operator)
end



# calculate(a,b,operator)
# puts "You've got fat fingers. Try again. Pick your calculation - Add (+) | Subtract (-) | Multiply (*) | Divide (/) "
# ['a', 'b', 'c'].include?('a')
