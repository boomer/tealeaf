require 'pry'

class Student
  def initialize(name,grade)
    @name = name
    @grade = grade
  end

  def to_s    
    binding.pry
    puts "#{@name}'s grade is #{@grade}."
  end

  def better_grade_than?(name)
    binding.pry
    @grade < name.grade
  end

  # protected

  # def grade
  #   @grade
  # end

end

joe = Student.new('Joe', 1)
bob = Student.new('Bob', 2)

puts joe
puts bob
#puts joe.grade
puts "Well done!" if joe.better_grade_than?(bob)