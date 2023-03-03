require_relative './Board'
# plays Chess
class Chess
  def initialize(player_1 = 'player_1', player_2 = 'player_2')
    @player_1 = player_1
    @player_2 = player_2
    @Chess_Board = Board.new
  end

  # gets required info
  def game_setup
    puts "Enter name for player 1"
    @player_1 = gets.chomp
    puts "Enter name for player 2"
    @player_2 = gets.chomp
  end

  #The actual play code
  def run_game
    play while !@Chess_Board.win
    @Chess_Board.reset
  end

  # gets required info and starts game
  def game_start
    game_setup
    run_game
  end
end