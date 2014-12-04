# oo-ttt.rb
# Michael Boomershine
# 12/4/14

# Two players take turns choosing spots on a 3x3 grid until one of the players
# gets three in a row or all nine spots are taken. The first player may choose
# whether to use an "X" or "O". 

require 'pry'

class Grid
  attr_accessor :positions

  def initialize
    positions = {}
    (1..9).each { | position | positions[position] = ' '}
    @positions = positions
  end

  def show
    puts "\e[H\e[2J"
    puts "     |     |     "
    puts "  #{positions[1]}  |  #{positions[2]}  |  #{positions[3]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{positions[4]}  |  #{positions[5]}  |  #{positions[6]}  "
    puts "     |     |     "
    puts "-----+-----+-----"  
    puts "     |     |     "
    puts "  #{positions[7]}  |  #{positions[8]}  |  #{positions[9]}  "
    puts "     |     |     "
  end

end

class Player
  attr_reader :name

  def initialize
    puts "What's your name?"
    name = gets.chomp
    @name = name
  end

  def pick_square(positions)
    begin 
      puts "                 "
      puts "#{name} > choose a position (from 1-9) to place a piece:"
      player_choice = gets.chomp.to_i
      puts "That position is taken." if positions[player_choice] != ' '
    end until positions[player_choice] == ' '
    positions[player_choice] = "X"
  end

end

class Computer

  def pick_square(positions)
    computer_pick = positions.select { |k,v| v == ' ' }.keys.sample
    positions[computer_pick] = 'O'
    sleep(0.5)
  end

end

class Game
  WINS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  attr_reader :grid, :player, :computer

  def initialize
    @grid = Grid.new
    @player = Player.new
    @computer = Computer.new
  end

  def play
    grid.show
    begin
      player.pick_square(grid.positions)
      grid.show
      computer.pick_square(grid.positions)
      grid.show
      winner = check_for_win(grid.positions)
    end until winner || available_positions(grid.positions).empty?
    end_game(winner)

  end

  def available_positions(positions)  
    available_positions = positions.select { |k,v| v == ' ' }.keys
  end

  def check_for_win(positions)
    WINS.each do |win|
      return "You" if positions[win[0]] == "X" && positions[win[1]] == "X" &&  positions[win[2]] == "X"
      return "I" if positions[win[0]] == "O" && positions[win[1]] == "O" &&  positions[win[2]] == "O"
    end
    binding.pry
    nil
  end

  def end_game(winner)
    if winner
      puts "#{winner} won!"
    else
      puts "It's a tie."
    end
  end
end

Game.new.play

