# a = [1, 2, 3, 3]
# b = a
# c = a.uniq

# What if c = a.uniq!? I'm surprised that this mutates a as well as c. Seems like the purpose of the statement is to define c, not a.


def test(b)
  b.map! {|letter| puts "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']

puts a
test(a)
puts a
