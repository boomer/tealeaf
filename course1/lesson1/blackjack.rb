# blackjack.rb
# Michael Boomershine
# Edited 10/30/14

# Create the deck - 4 suits, 2-10, J, Q, K, A and values (Ace can be 1 or 11)
#   like deck = { "2H" => [2, "2 of Hearts"], "2C" => [2, "2 of Clubs"], "AS" => [1, "Ace of Spades"] }
#   or like deck = { "2H" => 2, "2C" => 2, "AS" => 1 }
# Ask the players name
# Show the table with two hands - player and dealer
# Shuffling the deck...
# Deal the first two cards (remove cards from deck)
# Player chooses hit or stay
# Check player hand for win or loss
#  blackjack if 21, bust if more than 21, player chooses if less than 21  
# If player stays, then dealer must hit.
# Check dealer hand.
#  blackjack if 21, bust if more than 21, takes another card if less than 21
# Should only show the value of the dealers first card, then "x" for every card after that.

require 'pry'

def create_deck
  deck = [{"2H" => 2}, {"2C" => 2}, {"2S" => 2}, {"2D" => 2},
    {"3H" => 3}, {"3C" => 3}, {"3S" => 3}, {"3D" => 3},
    {"4H" => 4}, {"4C" => 4}, {"4S" => 4}, {"4D" => 4},
    {"5H" => 5}, {"5C" => 5}, {"5S" => 5}, {"5D" => 5},
    {"6H" => 6}, {"6C" => 6}, {"6S" => 6}, {"6D" => 6},
    {"7H" => 7}, {"7C" => 7}, {"7S" => 7}, {"7D" => 7},
    {"8H" => 8}, {"8C" => 8}, {"8S" => 8}, {"8D" => 8},
    {"9H" => 9}, {"9C" => 9}, {"9S" => 9}, {"9D" => 9},
    {"10H" => 10}, {"10C" => 10}, {"10S" => 10}, {"10D" => 10},
    {"JH" => 10}, {"JC" => 10}, {"JS" => 10}, {"JD" => 10},
    {"QH" => 10}, {"QC" => 10}, {"QS" => 10}, {"QD" => 10},
    {"KH" => 10}, {"KC" => 10}, {"KS" => 10}, {"KD" => 10},
    {"AH" => 1}, {"AC" => 1}, {"AS" => 1}, {"AD" => 1}]
end

def show_table(deck, player_name, player_hand, player_total, player_cards, dealer_hand, dealer_total, dealer_cards, prompt)
  puts "\e[H\e[2J"
  puts "* * * * * * * * * * * * * * * * * BLACKJACK * * * * * * * * * * * * * * * * *"
  puts "*                         *                       *                         *"
  puts "*#{player_name.upcase.center(24)} *                       *         DEALER          *"
  puts "*                         *                       *                         *"
  # binding.pry
  puts "*#{player_cards.join(", ").center(24)} *#{prompt.to_s.center(23)}*#{dealer_cards.join(", ").center(24)} *"
  puts "*                         *                       *                         *"
  puts "*#{player_total.to_s.center(24)} *                       *#{dealer_total.to_s.center(24)} *"
  puts "*                         *                       *                         *"
  puts "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
  puts ""
  puts ""
end

def get_player_name
  puts "Welcome to Blackjack. What's your name?"
  player_name = gets.chomp
end

def say(msg)
  puts msg
  sleep(0.25)
  puts "." 
  sleep(0.25)
  puts "."
  sleep(0.25)
  puts "."
  sleep(0.25)
end

def deal_first_cards(deck, player_hand, dealer_hand)
  card = deck.sample
  player_hand << card
  deck.delete(card)
  card = deck.sample
  player_hand << card
  deck.delete(card)
  card = deck.sample
  dealer_hand << card
  deck.delete(card)
  card = deck.sample
  dealer_hand << card
  deck.delete(card)
end

def update_total(hand,total)
  temp_array = []
  hand.each do |hand|
    temp_array << hand.values
  end
  total = temp_array.flatten.inject(0) {|sum, i|  sum + i }
end

def update_cards(hand)
  temp_array = []
  hand.each do |hand|
    temp_array << hand.keys
  end
  hand = temp_array.flatten
end

def get_player_choice(player_choice, player_total, dealer_total, prompt)
  return player_choice = "Hit"
  # case 
  # when player_choice == " " 
  #   player_choice = gets.chomp
  #   binding.pry
  # # elsif player_choice == "Stay"
  # #   prompt = "Dealer hits."
  # end
end

def calculate_win(player_total, dealer_total, prompt)
  # case player_total, dealer_total
  #   when player_total == 21
  # case player_total, dealer_total
  #   when dealer_total == 21 
  # return nil
end

deck = create_deck
player_hand = []
dealer_hand = []
player_cards = []
dealer_cards = []
player_total = 0
dealer_total = 0
player_choice = " "
prompt = "Hit or stay?"
player_name = get_player_name
say("Hi #{player_name}. Dealing your first two cards.")
deal_first_cards(deck, player_hand, dealer_hand)

begin 
  player_total = update_total(player_hand,player_total)
  dealer_total = update_total(dealer_hand,dealer_total)
  player_cards = update_cards(player_hand)
  dealer_cards = update_cards(dealer_hand)  
  show_table(deck, player_name, player_hand, player_total, player_cards, dealer_hand, dealer_total, dealer_cards, prompt)
  get_player_choice(player_choice, player_total, dealer_total, prompt)
  binding.pry
  win_or_bust = calculate_win(player_total, dealer_total, prompt)
end until win_or_bust 


