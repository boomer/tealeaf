require 'pry'

class Vehicle
  attr_accessor :model, :color, :year
  
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "You have #{@@number_of_vehicles} vehicles."
  end

  def initialize(y, c, m)
    self.year = y
    self.color = c
    self.model = m
    @speed = 0
    @@number_of_vehicles += 1
  end

  def self.calculate_mileage(d,g)
    mileage = (d / g)
    puts "Your mileage is #{mileage} miles per gallon."
  end

   def speed_up(number)
    @speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @speed -= number
    puts "You push the gas and decelerate #{number} mph."
  end

  def speed
    @speed -= 0
    puts "You are now going 0 mph."
  end

  def shut_off
    @speed = 0
    puts "Parking..."
  end

  def spray_paint(c)
    self.color = c
    puts "This is now a #{c} #{model}."
  end

  def show_year
    puts "This is a #{year} #{model}."
    calculate_age(year)
  end

  def to_s
    "This is a #{color} #{year} #{model}. "
  end

  private

  def calculate_age(y)
    vehicle_year = Time.new(y)
    age = Time.now.year - vehicle_year.year
    puts "The car is #{age} years old."
  end

end

class MyCar < Vehicle

  NUMBER_OF_DOORS = 4

end

module Towable
  def tow
    puts "I'm towing a boat!"
  end
end


class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  include Towable
end

car = MyCar.new(2007, "Silver", "Acura MDX")
car2  = MyCar.new(2007, "Red", "Ford")
truck = MyTruck.new(2007, "Green", "Honda")
# acura.speed_up(20)
# acura.speed
# acura.speed_up(20)
# acura.speed
# acura.brake(20)
# acura.speed
# acura.brake(20)
# acura.speed
# acura.shut_off
# acura.spray_paint("Red")
# acura.show_year
#MyCar.calculate_mileage(350,18)
puts car
puts car2
puts truck
puts Vehicle.number_of_vehicles
puts truck.tow
puts truck.show_year
puts MyTruck.ancestors
