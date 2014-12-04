# ttt.rb
# Michael Boomershine
# Edited 10/29/14

# Problem
# draw a grid of 11 rows by 17 columns
# place spaces 1-9 in the right locations in each row
# refresh the screen and replace that number with an "X"
# 
# ask user to pick a number from 1-9
# update that number from the array 
# randomly generate a pick for the computer and replace that number with an ""
# refresh the grid with the correct value in the space
# loop until all the places are filled or there is a winner
# 

require 'pry'

def create_positions
  p = {}
  (1..9).each {|position| p[position] = ' '}
  p
  binding.pry
end

def render_grid(n)
  binding.pry
  puts "\e[H\e[2J"
  puts "     |     |     "
  puts "  #{n[1]}  |  #{n[2]}  |  #{n[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{n[4]}  |  #{n[5]}  |  #{n[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"  
  puts "     |     |     "
  puts "  #{n[7]}  |  #{n[8]}  |  #{n[9]}  "
  puts "     |     |     "
end

def player_picks(n)
  puts "                 "
  puts "Choose a position (from 1-9) to place a piece:"
  player_choice = gets.chomp.to_i
  check_position(n,player_choice)
end

def check_position(n,p)
  if n[p] != ' '
    puts "That position is taken."
    player_picks(n)
  else
    n[p] = 'X'
  end
end

def computer_picks(n)
  p = n.select { |k,v| v == ' ' }.keys.sample
  n[p] = 'O'
  sleep(0.5)
end

def available_positions(n)  
  positions = n.select { |k,v| v == ' ' }.keys
end

def calculate_wins(n)
  wins = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  wins.each do |win|
    return "Player" if n[win[0]] == "X" && n[win[1]] == "X" &&  n[win[2]] == "X"
    return "Computer" if n[win[0]] == "O" && n[win[1]] == "O" &&  n[win[2]] == "O"
  end
  nil
end

def announce_winner(winner)
 puts "#{winner} won!"
end

grid = create_positions
render_grid(grid)

begin 
  player_picks(grid)
  render_grid(grid)
  computer_picks(grid)
  render_grid(grid)
  winner = calculate_wins(grid)
end until winner || available_positions(grid).empty?

if winner
  announce_winner(winner)
else
  puts "It's a tie."
end

