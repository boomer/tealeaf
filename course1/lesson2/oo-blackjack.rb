# oo-blackjack.rb
# Michael Boomershine
# 12/4/14

# The goal of Blackjack is to get as close to 21 as possible without going
# over (busting). A dealer begins the game by dealing two cards to one or
# more players. A player can choose to stay (take no more cards) or hit (take
# a card). If the value of a player's cards is more than 21, she busts and
# loses the game. Once a player decides to stay, the dealer must deal herself
# more cards until she reaches at least 17, at which point the person (player
# with the hi or dealer) with the higher total value of cards wins. If a
# person's cards total 21, then she gets Blackjack and wins the game.

# Number cards have a suit and a value from 1-10. Face cards are Jack, King,
# Queen and Ace and have a value of 10. There are four suits - Clubs, Spades,
# Diamonds and Hearts.

# Nouns - game, player, dealer, card, hand, suit
# Verbs - deal, stay, hit, win, lose

require 'pry'

class Player
  attr_accessor :player_name, :player_hand, :player_total, :player_choice, :deck

  def initialize
    puts "Welcome to Blackjack. What's your name?"
    player_name = gets.chomp
    @player_name = player_name
    player_hand = []    
    @player_hand = player_hand
    player_choice = ' '
    @player_choice = player_choice
    player_total = 0
    @player_total = player_total
  end

  def hit_or_stay
    puts "Hit or stay? (H/S)"
    player_choice = gets.chomp.upcase
    case
    binding.pry
      when player_choice == "H"
        deck.deal_card(deck, player_hand)
        prompt = "Hit or stay?"
      when player_choice == "S"
        deck.deal_card(deck, dealer_hand)
        prompt = "Dealer hits."
    end
  end
end

class Dealer

  attr_accessor :dealer_hand, :dealer_total

    def initialize
    dealer_hand = []
    @dealer_hand = dealer_hand
    dealer_total = 0
    @dealer_total = dealer_total
  end

  def hit
    deal_card(deck, dealer_hand)
    prompt = "Dealer hits again."
    sleep(0.25)
    3.times do 
      puts "." 
      sleep(0.25)
    end
  end

end

class Game
  attr_accessor :cards, :player, :dealer, :player_hand, :dealer_hand, :player_total, :dealer_total, :prompt

  def initialize
    @player = Player.new
    @dealer = Dealer.new
  end

  def play
    begin
      binding.pry
      if player.player_hand == []
        cards.deal_first_hand(player.player_hand, dealer.dealer_hand)
      elsif (player.player_choice == "STAY") & (dealer.dealer_total < 17)
        dealer.hit
      else 
        binding.pry
        player.player_choice = player.hit_or_stay
      end      
      binding.pry
      # deck.update_cards(player.player_hand)
      # deck.update_cards(dealer.dealer_hand)
      player_total = deck.calculate_value(player.player_hand)
      dealer_total = deck.calculate_value(dealer.dealer_hand)
      binding.pry
      show(deck, player.player_name, player.player_hand, player.player_total, dealer.dealer_hand, dealer.dealer_total, prompt)
      win_or_bust = check_for_winner
    end until win_or_bust
  end

  def say
  end

  def show(deck, player_name, player_hand, player_total, dealer_hand, dealer_total, prompt)
    puts "\e[H\e[2J"
    puts "* * * * * * * * * * * * * * * * * BLACKJACK * * * * * * * * * * * * * * * * *"
    puts "*                         *                       *                         *"
    puts "*#{player.player_name.upcase.center(24)} *                       *         DEALER          *"
    puts "*                         *                       *                         *"
    puts "*#{player.player_hand.join(", ").center(24)} *#{prompt.to_s.center(23)}*#{dealer.dealer_hand.join(", ").center(24)} *"
    puts "*                         *                       *                         *"
    puts "*#{player.player_total.to_s.center(24)} *                       *#{dealer.dealer_total.to_s.center(24)} *"
    puts "*                         *                       *                         *"
    puts "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
    puts ""
    puts ">> #{prompt.to_s}"
  end

  def check_for_winner
    binding.pry
    if (player.player_total == 21) & (dealer.dealer_total == 21)
      return "Standoff."
    elsif dealer.dealer_total > 21
      return "Dealer busts!"
    elsif player.player_total == 21
      return "#{player_name.upcase} gets Blackjack!"
    elsif dealer.dealer_total == 21
      return "Dealer gets Blackjack!"
    elsif player.player_total > 21
      return "#{player_name.upcase} busts!"
    elsif (player.player_choice == "STAY") & (player.player_total < dealer.dealer_total)
      return "You deserve to lose."
    else 
      return nil
    end   
  end
end

class Deck
  attr_accessor :cards, :player_hand, :dealer_hand, :player_total, :dealer_total

  def initialize
    @cards = [{"2H" => 2}, {"2C" => 2}, {"2S" => 2}, {"2D" => 2},
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

  def deal_first_hand(player_hand, dealer_hand)
    2.times do
      card = cards.sample
      player_hand << card
      cards.delete(card)
      card = cards.sample
      dealer_hand << card
      cards.delete(card)
    end
  end

  def deal_card(deck,hand)
    card = cards.sample
    hand << card
    cards.delete(card)
  end

  def update_cards(hand)
    unless hand == nil 
      temp_array = []
      hand.each do |card|
        temp_array << card.keys
      end
      binding.pry
      hand = temp_array.flatten
    end
  end
  
  def calculate_value(hand)
    unless hand == nil
      temp_array = []
      hand.each do |card|
        temp_array << card.values
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
  end
end

Game.new.play

