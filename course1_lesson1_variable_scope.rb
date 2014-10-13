# 1 Create a local variable and modify it at an inner scope. 

require 'pry'

a = 5.55

puts "The initial value of a is #{a}."

5.times do |n|
  a = a + 25
  b = a
  puts "The inner scope value of a is #{a}."
end

puts "The final outer scope value of a is #{a}."

puts "The final outer scope value of b is #{b}."

