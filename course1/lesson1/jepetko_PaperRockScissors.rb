class PaperRockScissors

  module GameLogic
    TYPES = [:P, :R, :S]
    COMBINATIONS = { [:P, :R] => 'Paper wraps Rock', [:S, :P] => 'Scissors destroys Paper', [:R, :S] => 'Rocks damages Scissors' }

    def valid?(type)
      return false if type.nil?
      TYPES.include? type.to_sym
    end

    def score(human_choice, pc_choice, &message_block)
      human_choice = human_choice.to_sym if not human_choice.is_a? Symbol
      pc_choice = pc_choice.to_sym if not pc_choice.is_a? Symbol
      msg = ''
      if human_choice == pc_choice
        score = 0
      else
        msg = COMBINATIONS[ [human_choice, pc_choice] ]
        score = !msg.nil? ? 1 : 2
        if score == 2
          msg = COMBINATIONS[ [pc_choice, human_choice] ]
        end
      end
      message_block.call score, msg
      score
    end
  end
  extend GameLogic

  def self.say(str)
    puts str
  end

  def self.continue?(type)
    type.upcase == 'Y'
  end

  def self.pick
    loop do
      choice = gets.chomp.upcase
      return choice if valid?(choice)
    end
  end

  private_class_method :say
  private_class_method :valid?
  private_class_method :continue?
  private_class_method :pick
  private_class_method :score

  def self.start
    say 'Play Paper, Rock, Scissors !!!'
    loop do
      say '******************************************'
      say "choose one (#{GameLogic::TYPES.join '/'})"
      human_choice = pick
      pc_choice = GameLogic::TYPES[Random.new.rand(0..2)]
      score human_choice, pc_choice do |score, msg|
        say "You picked #{human_choice} and computer picked #{pc_choice}."
        say msg
        case score
          when 0
            say 'It\'s a tie'
          when 1
            say 'You won!'
          when 2
            say 'You lost... sorry.'
        end
      end
      say 'Repeat the game? Y/N'
      break if not continue?(gets.chomp)
    end
  end
end

PaperRockScissors.start