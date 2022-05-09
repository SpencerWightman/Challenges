module Displayable
  def display_welcome_message
    puts <<~FORMAT

    Welcome to Rock, Paper, Scissors, Spock, Lizard!
    You will play a first to #{RPSGame::WINNING_SCORE} match against a robot.\n\n
    Use the following commands during your turn:\n\n
    => 1 for rock
    => 2 for paper
    => 3 for scissors
    => 4 for spock
    => 5 for lizard\n\n
    ~~ Rules ~~
    Rock > Lizard, Scissors
    Paper > Rock, Spock
    Scissors > Paper, Lizard
    Spock > Rock, Scissors
    Lizard > Paper, Spock
    FORMAT
  end

  def display_play_again_message(answer)
    if answer.downcase == 'y'
      system("clear")
      human.reset_score
      computer.reset_score
      play
    else
      display_goodbye_message
    end
  end

  def display_grand_champion
    puts ""
    display_scores
    if human.read_score == RPSGame::WINNING_SCORE
      puts "++ #{human.name} is the Grand Champion! ++"
    else
      puts "++ #{computer.name} is the Grand Champion! ++"
    end
    tracker.read_tracker(computer.name, human.name)
    play_again?
  end

  def display_goodbye_message
    puts ""
    puts "Thanks for playing RPSSL. Good bye!"
  end

  def display_scores
    puts <<-ONELINE.gsub(/^[\s\t]*/, '').gsub(/[\s\t]*\n/, ' ').strip
        #{human.read_score} - #{human.name} ||
        #{computer.name} - #{computer.read_score}
      ONELINE
  end

  def display_moves
    puts "=> #{human.name} chose #{human.move}"
    puts "=> #{computer.name} chose #{computer.move}"
    increment_round
    display_winner
  end

  def display_winner
    case increment_winner
    when true then puts "++ #{human.name} won! ++"
    when false then puts "++ #{computer.name} won! ++"
    when "zilch" then puts "It's a tie!"
    end
  end

  def display_round
    puts ""
    if round < 10
      puts "~~ Round #{format('%02d', round)} ~~"
    else
      puts "~~ Round #{round} ~~"
    end
    display_scores
  end
end

class Tracker
  def initialize
    @tracker = {}
  end

  def read_tracker(cname, hname)
    puts ""
    puts "~~ Move History ~~"
    @tracker.each_pair do |k, v|
      puts "#{k} => #{cname}: #{v[1]}
      #{hname}: #{v[0]}"
    end
  end

  def add_history(round, cmove, hmove)
    if @tracker.key?(round)
      @tracker[round] << hmove
      @tracker[round] << cmove
    else
      @tracker[round] = [hmove, cmove]
    end
  end
end

class Move
  VALUES = { 1 => 'rock', 2 => 'paper', 3 => 'scissors',
             4 => 'spock', 5 => 'lizard' }

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def spock?
    @value == 'spock'
  end

  def lizard?
    @value == 'lizard'
  end

  # rubocop:disable Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
  def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?)) ||
      (paper? && (other_move.rock? || other_move.spock?)) ||
      (scissors? && (other_move.paper? || other_move.lizard?)) ||
      (spock? && (other_move.rock? || other_move.scissors?)) ||
      (lizard? && (other_move.paper? || other_move.spock?))
  end
  # rubocop:enable Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def increment_score
    @score += 1
  end

  def read_score
    @score
  end

  def reset_score
    @score = 0
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "First, let's get your name:"
      n = gets.chomp
      break unless n.empty? || n.chars.count(" ") > 1 || n.size < 2 ||
                   Computer::NAMES.include?(n.capitalize)
      puts "Sorry, that name is not available. Please enter a different name."
      puts ""
    end
    self.name = n.capitalize
  end

  def choose
    choice = nil
    loop do
      puts ""
      puts "Choose rock(1), paper(2), scissors(3), spock(4), or lizard(5):"
      choice = gets.chomp.to_i
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(Move::VALUES[choice])
  end
end

class Computer < Player
  NAMES = ['Terminator', 'Sparky', 'Chromatic']

  def set_name
    self.name = NAMES.sample
  end

  def choose
    max = Move::VALUES.size - 1
    chaos = (1..max).to_a.sample
    case name
    when 'Terminator' then self.move = Move.new(Move::VALUES[1])
    when 'Sparky'     then self.move = Move.new(Move::VALUES[chaos])
    when 'Chromatic'  then
      self.move = Move.new(Move::VALUES.to_a[chaos..chaos].sample[1])
    end
  end
end

# Game Orchestration Engine

class RPSGame
  attr_reader :human, :computer, :tracker
  attr_accessor :round

  WINNING_SCORE = 3

  include Displayable

  def initialize
    display_welcome_message
    puts ""
    @human = Human.new
    @computer = Computer.new
    @tracker = Tracker.new
    @round = 1
  end

  def increment_winner
    if human.move > computer.move
      human.increment_score
      return true
    elsif computer.move > human.move
      computer.increment_score
      return false
    end
    "zilch"
  end

  def increment_round
    if @round < 10
      tracker.add_history(format('%02d', @round), computer.move, human.move)
    else
      tracker.add_history(@round, computer.move, human.move)
    end
    @round += 1
  end

  def game_over?
    human.read_score == WINNING_SCORE || computer.read_score == WINNING_SCORE
  end

  def play_again?
    answer = nil
    puts ""
    puts "Play another match against #{computer.name}? (y/n)"
    loop do
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end
    display_play_again_message(answer)
  end

  def play
    @round = 1
    loop do
      display_round
      human.choose
      computer.choose
      display_moves
      break if game_over?
    end
    display_grand_champion
  end
end

RPSGame.new.play
