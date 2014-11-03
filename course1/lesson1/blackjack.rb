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

def show_table(deck, player, player_hand, player_total, dealer_hand, dealer_total)
  puts "\e[H\e[2J"
  puts "* * * * * * * * * * * * * * * * * BLACKJACK * * * * * * * * * * * * * * * * *"
  puts "*                         *                       *                         *"
  puts "*#{player.upcase.center(24)} *                       *         DEALER          *"
  puts "*                         *                       *                         *"
  puts "*#{player_hand.to_s.center(24)} *                       *#{dealer_hand.to_s.center(24)} *"
  puts "*                         *                       *                         *"
  binding.pry
  puts "*#{player_total.to_s.center(24)} *                       *#{dealer_total.to_s.center(24)} *"
  puts "*                         *                       *                         *"
  puts "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
  puts ""
  puts ""
end

def get_player_name
  puts "Welcome to Blackjack. What's your name?"
  player = gets.chomp
end

def deal_cards(deck, player, player_hand, player_total, dealer_hand, dealer_total)
  if player_hand.empty? && dealer_hand.empty?
      card = deck.sample
      player_hand << card
      deck.delete(card)
      card = deck.sample
      player_hand << card
      deck.delete(card)
      player_total = update_player_total(player_hand,player_total)
      card = deck.sample
      dealer_hand << card
      deck.delete(card)
      card = deck.sample
      dealer_hand << card
      deck.delete(card)
      dealer_total = update_dealer_total(dealer_hand,dealer_total)
  end

  # puts "HIT OR STAY?" 
  # hit_or_stay = gets.chomp.upcase
  #   if hit_or_stay == "HIT"
  #     card = deck.keys.sample
  #     player_hand.push(card)
  #     deck.delete(:card)
  #   elsif hit_or_stay == "STAY"
  #     dealer_hand = deck.keys.sample
  #   else
  #     nil
  #   end
  # sample two cards from the deck for the player 
  #    add it to the player hand
  #   remove the two cards
  # sample two cards from the deck for the dealer
  #   remove the two cards
  #  puts "HIT AGAIN OR STAY?"
  #  puts "DEALER HITS"
  #  puts "DEALER HITS AGAIN"
  #  puts "#{player.upcase} WINS"
  #  puts "DEALER WINS"
end

def update_player_total(player_hand, player_total)
  temp_array = []
  player_hand.each do |hand|
    temp_array << hand.values
  end
  # http://viarails.net/q/How-to-sum-an-array-of-numbers-in-Ruby
  player_total = (player_total + temp_array.flatten.inject(0) {|sum, i|  sum + i })
end

def update_dealer_total(dealer_hand, dealer_total)
  temp_array = []
  dealer_hand.each do |hand|
    temp_array << hand.values
  end
  dealer_total = (dealer_total + temp_array.flatten.inject(0) {|sum, i|  sum + i })
end

deck = create_deck
player = get_player_name
player_hand = []
dealer_hand = []
player_total = 0
dealer_total = 0
show_table(deck, player, player_hand, player_total, dealer_hand, dealer_total)
deal_cards(deck, player, player_hand, player_total, dealer_hand, dealer_total)
show_table(deck, player, player_hand, player_total, dealer_hand, dealer_total)


