# blackjack.rb
# Michael Boomershine
# Edited 11/16/14    

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
  puts "*#{player_cards.join(", ").center(24)} *#{prompt.to_s.center(23)}*#{dealer_cards.join(", ").center(24)} *"
  puts "*                         *                       *                         *"
  puts "*#{player_total.to_s.center(24)} *                       *#{dealer_total.to_s.center(24)} *"
  puts "*                         *                       *                         *"
  puts "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
  puts ""
  puts ">> #{prompt.to_s}"
end

def get_player_name
  puts "Welcome to Blackjack. What's your name?"
  player_name = gets.chomp
end

def say(msg)
  puts msg
  sleep(0.25)
  3.times do 
    puts "." 
    sleep(0.25)
  end
end

def deal_first_cards(deck, player_hand, dealer_hand)
  2.times do
    card = deck.sample
    player_hand << card
    deck.delete(card)
    card = deck.sample
    dealer_hand << card
    deck.delete(card)
  end
end

def deal_cards(deck, hand)
  card = deck.sample
  hand << card
  deck.delete(card)
end

def update_cards(cards)
  temp_array = []
  cards.each do |cards|
    temp_array << cards.keys
  end
  cards = temp_array.flatten
end

def update_total(cards)
  temp_array = []
  cards.each do |cards|
    temp_array << cards.values
    temp_array.flatten!
  end
  if temp_array.include?(1)
    temp_array.delete(1)
    total = temp_array.inject(0) {|sum, i|  sum + i }
    if total < 10
      total = total + 1
    else
      total = total + 11
    end
    else total = temp_array.inject(0) {|sum, i|  sum + i }      
  end
end

def get_player_choice
  player_choice = gets.chomp.upcase
  # add error checking for user input
end

def calculate_win(player_name, player_choice, player_total, dealer_total)
  binding.pry
  if (player_total == 21) & (dealer_total == 21)
    return "Standoff."
  elsif dealer_total > 21
    return "Dealer busts!"
  elsif player_total == 21
    return "#{player_name.upcase} gets Blackjack!"
  elsif dealer_total == 21
    return "Dealer gets Blackjack!"
  elsif player_total > 21
    return "#{player_name.upcase} busts!"
  elsif (player_choice == "STAY") & (player_total < dealer_total)
    return "You deserve to lose."
  else 
    return nil
  end   
  # binding.pry
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

begin 
  # binding.pry
  if player_hand.empty?
    deal_first_cards(deck, player_hand, dealer_hand)
  elsif (player_choice == "STAY") & (dealer_total < 17)
    deal_cards(deck, dealer_hand)
    prompt = "Dealer hits again."
    sleep(0.25)
    3.times do 
      puts "." 
      sleep(0.25)
    end
  else
    player_choice = get_player_choice
    case
      when player_choice == "HIT"
        deal_cards(deck, player_hand)
        prompt = "Hit or stay?"
      when player_choice == "STAY"
        deal_cards(deck, dealer_hand)
        prompt = "Dealer hits."
    end
  end
  # binding.pry
  player_total = update_total(player_hand)
  dealer_total = update_total(dealer_hand)
  player_cards = update_cards(player_hand)
  dealer_cards = update_cards(dealer_hand) 
  show_table(deck, player_name, player_hand, player_total, player_cards, dealer_hand, dealer_total, dealer_cards, prompt)  
  # binding.pry
  win_or_bust = calculate_win(player_name, player_choice, player_total, dealer_total)
end until win_or_bust 

prompt = win_or_bust
show_table(deck, player_name, player_hand, player_total, player_cards, dealer_hand, dealer_total, dealer_cards, prompt)  
# puts "Would you like to play another hand?"
# replay = gets.chomp

