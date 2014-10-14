# As user to pick a play - p/r/s.
# Handle a different input if given.
# Computer generates a random choice.
# Calculate the winner.
# Show the choices and the winner.
# Ask to play again. 
# If yes, then invoke the method again.

def calculate_winner

  puts "Would you like to play a game?"
  puts "Choose Rock, Paper or Scissors: (R/P/S)"
  player = gets.chomp.upcase!

  computer = ['R','P','S'].sample
  puts "I choose #{computer}."

  if player == 'r' && computer == 'r'
    puts "We both chose rock, so it's a tie."
  elsif player == 's' && computer == 's'
    puts "We both chose scissors, so it's a tie. Play again!"
  elsif player == 'p' && computer == 'p'
    puts "We both chose paper, so it's a tie. Play again!"
  elsif player == 'r' && computer == 'p'
    puts "You chose rock, I chose paper. Paper covers rock so you lose!"
  elsif player == 'r' && computer == 's'
    puts "You chose rock, I chose scissors. Rock breaks scissors. You win!"
  elsif player == 'p' && computer == 'r'
    puts "You chose paper, I chose rock. Paper covers rock so you win!"
  else player == 'p' && computer == 's'
    puts "You chose paper, I chose scissors. Scissors cut paper so you lose!"
  end
end

calculate_winner

puts "Play again? (Y/N)"
replay = gets.chomp

if replay == 'Y'
  calculate_winner
else
  puts "Thanks for playing! Maybe some other time."
end




