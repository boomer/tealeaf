# ttt.rb
# Michael Boomershine
# Edited 10/17/14

# Problem
# draw a grid of 11 rows by 17 columns
# place spaces 1-9 in the right locations in each row
# refresh the screen and replace that number with an "X"
# 
# ask user to pick a number from 1-9
# update that number from the array 
# randomly generate a pick for the computer and replace that number with an ""
# refresh the grid with the correct value in the space
# loop until all the places are filled - or there is a winning combination
# 
# create an array of arrays of winning combinations
# handle ties
# handle mistyped numbers
# show winner
# ask to play again
# player choices
# computer choices

require 'pry'

PLAYER_CHOICES = []
COMPUTER_CHOICES = []
AVAILABLE_CHOICES = [1,2,3,4,5,6,7,8,9]
WINS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
POSITIONS = { 1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ", 6 => " ", 7 => " ", 8 => " ", 9 => " "}



def render_grid

  #clear the screen
  puts "\e[H\e[2J"
  #show the grid
  puts "     |     |     "
  puts "  #{POSITIONS.fetch(1)}  |  #{POSITIONS.fetch(2)}  |  #{POSITIONS.fetch(3)}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{POSITIONS.fetch(4)}  |  #{POSITIONS.fetch(5)}  |  #{POSITIONS.fetch(6)}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{POSITIONS.fetch(7)}  |  #{POSITIONS.fetch(8)}  |  #{POSITIONS.fetch(9)}  "
  puts "     |     |     "
  puts "                 "
  puts "Choose a posiiton (from 1-9) to place a piece:"

  p = gets.chomp.to_i
  PLAYER_CHOICES.push(p)
  AVAILABLE_CHOICES.delete(p)
  POSITIONS.update({ p => "X"})  
  #swap space for p in grid
  
  sleep (1)

  c = AVAILABLE_CHOICES.sample
  COMPUTER_CHOICES.push(c)
  AVAILABLE_CHOICES.delete(c)
  POSITIONS.update({ c => "O"}) 
  #swap space for c in grid

  binding.pry

  #what happens if computer chooses a spot that's already been taken

end

def update_grid

# update display value in 

# show error if player picks a number that has already been chosen


end

render_grid
