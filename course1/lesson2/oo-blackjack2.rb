require 'rubygems'
require 'pry'

# Object Oriented Blackjack

class Card
  attr_accessor :suit, :face_value
  
  def initialize(s, fv)
      @suit = s 
      @face_value = fv
  end

  def pretty_output
    "The #{face_value} of #{find_suit}"
  end

  def to_s
    pretty_output
  end

  def find_suit
    case suit
      when 'H' then 'Hearts'
      when 'D' then 'Diamonds'
      when 'S' then 'Spades'
      when 'C' then 'Clubs'
    end
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    ['H', 'D', 'S', 'C'].each do |suit|
      ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |face_value|
        @cards << Card.new(suit, face_value)
      end
    end
    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end

  def size
    cards.size
  end
end

module Hand  
  def show_hand
    puts "---- #{name}'s Hand ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
  end

  def total
    face_values = cards.map{ |card| card.face_value }

    total = 0
    face_values.each do |val|
      if val == "A"
        total += 11
      else
        total += (val.to_i == 0 ? 10 : val.to_i)
      end
    end

    #correct for Aces
    face_values.select{|val| val == "A"}.count.times do
      break if total <= 21
      total -= 10
    end

    total
  end

  def add_card(new_card)
    cards << new_card
  end

  def is_busted?
    total > 21
  end
end

class Player
  include Hand

  attr_accessor :name, :cards, :choice

  def initialize(n)
    @name = n
    @cards = []
    @choice = ' '
  end

  def hit_or_stay        
    puts "Do you want to hit (H) or stay (S)?"
    choice = gets.chomp.upcase
  end

end

class Dealer
  include Hand

  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end
end

class Game

  attr_accessor :deck

  def initialize
    deck = Deck.new
    player = Player.new("Michael")
    2.times do
      player.add_card(deck.deal_one)
    end

    dealer = Dealer.new
    2.times do
      dealer.add_card(deck.deal_one)
    end
  end

  def play
    begin
      binding.pry
      if (player.choice == 'S') & (dealer.total < 17)
        dealer.add_card(deck.deal_one)
      else
        player.hit_or_stay
      end
      player.show_hand
      dealer.show_hand
      binding.pry
      win_or_bust = self.check_for_winner
    end until win_or_bust
  end


  def check_for_winner
    binding.pry
    if (player.total == 21) & (dealer.total == 21)
      return "Standoff."
    elsif dealer.total > 21
      return "Dealer busts!"
    elsif player.total == 21
      return "#{player.name} gets Blackjack!"
    elsif dealer.total == 21
      return "Dealer gets Blackjack!"
    elsif player.total > 21
      return "#{player.name} busts!"
    elsif (player.choice == "STAY") & (player.total < dealer.total)
      return "You deserve to lose."
    else 
      return nil
    end   
  end
end

game = Game.new
game.play

