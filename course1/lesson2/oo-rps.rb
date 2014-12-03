# oo-rps.rb
# Michael Boomershine
# Edited 12/2/14   

# As user to pick a play - p/r/s.
# Handle a different input if given.
# Computer generates a random choice.
# Calculate the winner.
# Show the choices and the winner.
# Ask to play again. 
# If yes, then invoke the method again.

# Game (begins, ends, repeats)
# Player (user, computer), (plays)
# Choices (rock, paper, scissors)
# Verbs - pick, calculate, show

require 'pry'

class Game

  CHOICES = {'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors' } 
  
  attr_reader :person, :computer

  def initialize
    @person = Person.new
    @computer = Computer.new
  end

  def play
    person.choose
    computer.choose
    check_for_win
  end

  def check_for_win
    if person.choice == 'r' && computer.choice == 'r'
    puts "We both chose rock, so it's a tie."
    elsif person.choice == 's' && computer.choice == 's'
      puts "We both chose scissors, so it's a tie. Play again!"
    elsif person.choice == 'p' && computer.choice == 'p'
      puts "We both chose paper, so it's a tie. Play again!"
    elsif person.choice == 'r' && computer.choice == 'p'
      puts "You chose rock, I chose paper. Paper covers rock so you lose!"
    elsif person.choice == 'r' && computer.choice == 's'
      puts "You chose rock, I chose scissors. Rock breaks scissors. You win!"
    elsif person.choice == 'p' && computer.choice == 'r'
      puts "You chose paper, I chose rock. Paper covers rock so you win!"
    else person.choice == 'p' && computer.choice == 's'
      puts "You chose paper, I chose scissors. Scissors cut paper so you lose!"
    end
  end
end

class Player  
  attr_accessor :choice
end

class Person < Player
  def choose
    begin
      puts "Choose Rock, Paper or Scissors: (R/P/S)"
      self.choice = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(self.choice)
  end
end

class Computer < Player
  def choose
    self.choice = Game::CHOICES.keys.sample
  end
end

game = Game.new.play 
