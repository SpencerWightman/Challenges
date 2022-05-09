class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select {|key| @squares[key].unmarked?}
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      winner = @squares[line[0]].to_s
      return winner if @squares.values_at(*line).map{|e| e.to_s}.all?(winner) &&
        winner != Square::INITIAL_MARKER
    end
    nil
  end

  def aggressive?
    answer = nil
    WINNING_LINES.each do |line|
      answer = line if @squares.values_at(*line).map{|e| e.to_s}.count(Square::INITIAL_MARKER) == 1 &&
        @squares.values_at(*line).map{|e| e.to_s}.count(TTTGame::COMPUTER_MARKER) == 2
    end
    answer
  end

  def aggressive_move
    WINNING_LINES.each do |line|
      @squares[line.select{|e| @squares[e].to_s == Square::INITIAL_MARKER}[0]].marker = TTTGame::COMPUTER_MARKER if line == aggressive?
    end
  end

  def defensive?
    answer = nil
    WINNING_LINES.each do |line|
      answer = line if @squares.values_at(*line).map{|e| e.to_s}.count(Square::INITIAL_MARKER) == 1 &&
        @squares.values_at(*line).map{|e| e.to_s}.count(TTTGame::COMPUTER_MARKER) == 0
    end
    answer
  end

  def defensive_move
    WINNING_LINES.each do |line|
      @squares[line.select{|e| @squares[e].to_s == Square::INITIAL_MARKER}[0]].marker = TTTGame::COMPUTER_MARKER if line == defensive?
    end
  end

  def five
    @squares[5].marker = TTTGame::COMPUTER_MARKER
  end

  def reset
    (1..9).each {|key| @squares[key] = Square.new}
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts ""
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
    puts ""
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  COMPUTER_MARKER = "O"
  COMPUTER_NAME = ["Sneaky", "Slappy", "Scrappy", "Scrambly"].sample

  attr_reader :board, :human, :computer, :scoreboard
  attr_accessor :human_name, :grand_champion, :human_marker

  def initialize
    @board = Board.new
    @computer = Player.new(COMPUTER_MARKER)
    @human_marker = ''
    @scoreboard = []
    @human_name = ''
    @grand_champion = ''
  end

  private
  def clear_display
    system 'clear'
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts "You will play a First to Five match against #{COMPUTER_NAME}."
    pick_name
    pick_marker
    puts ""
  end

  def pick_name
    puts "What should we call you?"
    loop do
      self.human_name = gets.chomp.to_s
      break if (human_name.size > 2 || human_name.size < 15) &&
        !human_name.chars.all?(" ")
      puts "Try again."
    end
  end

  def pick_marker
    puts "What is your marker? Must be 1 character."
    loop do
      self.human_marker = gets.chomp.to_s
      break if human_marker.size == 1 || human_marker == " "
      puts "Try again."
    end
    @human = Player.new(human_marker)
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear_display
    puts "Round #{@scoreboard.size + 1}! #{human_name.capitalize} vs #{COMPUTER_NAME}"
    display_board
  end

  def human_moves # 12/10
    if board.unmarked_keys.size > 1
      puts "Choose a square (#{board.unmarked_keys[0...-1].join(', ')}, or #{board.unmarked_keys[-1]}):"
    else
      puts "Choose a square (#{board.unmarked_keys[0]}):"
    end
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
    human.marker
  end

  def computer_moves
    if board.aggressive?
      board.aggressive_move
    elsif board.defensive?
      board.defensive_move
    elsif board.unmarked_keys.include?(5)
      board.five 
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def update_scoreboard
    case board.winning_marker
    when human.marker then @scoreboard.push(human_marker)
    when computer.marker then @scoreboard.push(COMPUTER_MARKER)
    end
  end

  def set_grand_champion_name
    @scoreboard.count(human_marker) == 5 ? self.grand_champion = human_name : self.grand_champion = COMPUTER_NAME
  end

  def display_grand_champion
    clear_screen_and_display_board
    puts ""
    puts "~~ #{grand_champion} is the Grand Champion! ~~"
    puts ""
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play a new Best of 5 match? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset_board
    board.reset
    clear_display
  end

  def reset_game
    @scoreboard = []
    reset_board
  end

  def set_first_player
    @current_player = human_marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_player = COMPUTER_MARKER
    else
      computer_moves
      @current_player = human_marker
    end
    clear_screen_and_display_board
  end

  def human_turn?
    @current_player == human_marker
  end

  def game_over?
    board.someone_won? || board.full?
  end

  def grand_champ?
    @scoreboard.count(human_marker) == 5 || @scoreboard.count(COMPUTER_MARKER) == 5
  end

  def display_result
    case board.winning_marker
    when human.marker then puts "#{human_name} won the round!"
    when computer.marker then puts "#{COMPUTER_NAME} won the round!"
    else puts "It's a tie!"
    end
  end

  def display_board
    board.draw
    display_scoreboard
  end

  def display_scoreboard
    puts ""
    puts "+------------+"
    puts "#{human_name}: #{@scoreboard.count(human_marker)}"
    puts "#{COMPUTER_NAME}: #{@scoreboard.count(COMPUTER_MARKER)}"
    puts "+------------+"
    puts ""
  end

  def clear_screen_and_display_board
    clear_display
    puts "Round #{@scoreboard.size + 1}! #{human_name.capitalize} vs #{COMPUTER_NAME}"
    display_board
  end

  def next_round?
    answer = nil
    if game_over? == true
      loop do
        clear_screen_and_display_board
        display_result
        puts ""
        puts "Ready for the next round? (y/n)"
        answer = gets.chomp.downcase
        break if %w(y n).include? answer
        puts "Sorry, must be y or n"
      end
    end
  
    answer == 'y'
  end

  def player_move
    clear_screen_and_display_board
    loop do
      current_player_moves
      update_scoreboard
      set_grand_champion_name
      break if grand_champ? || game_over?
    end
    display_grand_champion if grand_champ?
  end

  def main_game
    loop do
      set_first_player
      player_move
      break if grand_champ?
      break unless next_round?
      reset_board
    end
    puts "Game Over" unless grand_champ?
  end

  public
  def play
    loop do
      clear_display
      display_welcome_message
      main_game
      break unless play_again?
      reset_game
    end
    display_goodbye_message
    abort
  end
end

game = TTTGame.new
game.play
