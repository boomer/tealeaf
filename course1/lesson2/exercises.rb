# Lesson 2
# Chapter 1
# 11/17/14
# Created by Michael Boomershine

# Exercise 1

# class BottleOfWine
#   include ShowVintage
#   puts self
# end

# merlot = BottleOfWine.new

# Exercise 2

module ShowVintage
  def vintage(year)
    puts "It's a #{year}."
  end
end

class BottleOfWine
  include ShowVintage
  puts self
end

merlot = BottleOfWine.new
merlot.vintage(2000)

