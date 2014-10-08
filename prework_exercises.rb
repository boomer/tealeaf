#Exercise 1

# numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# numbers.each do |number|
# 	puts number 
# end

# #Exercise 2

# numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# numbers.each do | a |
# 	if a > 5
# 		puts a
# 	end 
# end

#Exercise 3

# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# arr2 =[]

# arr.select do | a |
# 	if (a %2 != 0) then
# 		arr2.push(a)
# 	end 
# end

# # puts arr2

# # Exercise 4

# # arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# # arr.push(11)

# # arr.unshift(0)

# # puts arr

#Exercise 5

# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# arr.push(11)

# arr.unshift(0)

# arr.pop

# arr << 3

# puts arr

#Exercise 6

# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# arr.push(11)

# arr.unshift(0)

# arr.pop

# arr << 3

# arr.uniq

# puts arr

#Exercise 7
# hashes are key/value pairs, arrays are lists of values with an index.

# Exercise 8
# hash1 = { color: 'blue', shape: 'square', hue: 'dark'}
# hash2 = { :color => 'blue', :shape => 'square', :hue => 'dark'}

# Exercise 9
#1) h.fetch(:b)
#2) h[:e] = '5'
#3) 
# h = {a:1, b:2, c:3, d:4}
# h.delete_if { | k,v | v < 3.5}
# puts h

# Exercise 10
#arr = [ { name: "Michael", height: "5,7", weight: "145"} , {name: "Michael", height: "5,7", weight: "145"} ]
#h = { color: ["blue", "green", "yellow"], name: ["Michael", "Allyson", "Gina"], weight: ["145", "165", "185"] }

#Exercise 11

#Exercise 12

#contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"], ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

#contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# contacts.zip(contact_data).map{ |e,a,p| }

# contacts["Joe Smith"][:email] = contact_data[0][0]
# contacts["Joe Smith"][:address] = contact_data[0][1]
# contacts["Joe Smith"][:phone] = contact_data[0][2]
# contacts["Sally Johnson"][:email] = contact_data[1][0]
# contacts["Sally Johnson"][:address] = contact_data[1][1]
# contacts["Sally Johnson"][:phone] = contact_data[1][2]

# puts contacts
# puts contacts["Joe Smith"][:email]
# puts contacts["Sally Johnson"][:email]


#Exercise 15

# arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

# arr.delete_if { | w | w.start_with? 's' }

# puts arr

# arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

# arr.delete_if { | w | w.start_with? 's', 'w' }

# puts arr

#Exercise 16
#Aterate through the array and split each element on space into two new elements 
#Add each new element to a new array
# a = ['white snow', 'winter wonderland', 'melting ice',
#      'slippery sidewalk', 'salted roads', 'white trees']

# a = a.map  { | x | x.split(/ /)}

# a = a.flatten

# puts a
