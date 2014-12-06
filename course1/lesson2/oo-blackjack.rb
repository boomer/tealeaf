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

class Hand

  def initialize
    # deal two cards
  end

  def update_hand
  end
  
  def calculate_value
  end

end

class PlayerHand < Hand
  @playerhand = []
end

class DealerHand < Hand
  @playerhand = []
end

class Player

  def initialize
  end

  def hit_or_stay
  end

end

class Dealer

  def initialize
  end

  def hit
  end

end

class Game
  attr_reader :deck

  def initialize
    @deck = Deck.new
  end

  def play
    deck.deal_first_hand
    binding.pry
  end

  def say
  end

  def show
  end

  def check_for_winner
  end

end

class Deck
  attr_reader :deck, :playerhand, :dealerhand

  def initialize
    @deck = [{"2H" => 2}, {"2C" => 2}, {"2S" => 2}, {"2D" => 2},
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

  def deal_first_hand
    2.times do
      card = deck.sample
      playerhand << card
      deck.delete(card)
      card = deck.sample
      dealerhand << card
      deck.delete(card)
      binding.pry
    end
  end

  def deal
    card = deck.sample
    hand << card
    deck.delete(card)
  end

end

Game.new.play
