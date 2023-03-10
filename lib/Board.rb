require 'yaml'
require_relative './Details/Color'
require_relative './Details/Assests'
require_relative './Validator'
require_relative './Generate'
class Board 
  using ColorableString
  include Assets
  include Validator
  attr_accessor :Board, :Win
  def initialize
    @Board = [
      [black_rook, black_knight, black_bishop, black_queen, black_king, black_bishop, black_knight,
       black_rook], [black_pawn, black_pawn, black_pawn, black_pawn, black_pawn, black_pawn, black_pawn, black_pawn], [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], [white_pawn, white_pawn, white_pawn, white_pawn, white_pawn, white_pawn, white_pawn, white_pawn], [white_rook, white_knight, white_bishop, white_queen, white_king, white_bishop, white_knight, white_rook]
    ]
    
    # originally tried @Board Array.new(8){Array.new(8, "")} did not work
    @Win = false
  end

  def print_board(show_moves = [])
    display = show_searches(show_moves)
    puts '    a    b    c    d    e    f    g    h    '
    display.each_with_index do |row, index|
      colored_row = row.map.with_index do |element, e_index|
        color_index = index + e_index
        if element == black_circle 
          color_index.even? ?  element.to_s.ljust(4).bg_color(:green) : element.to_s.ljust(4).bg_color(:cyan)
        else
          color_index.even? ?  element.to_s.ljust(5).bg_color(:green) : element.to_s.ljust(5).bg_color(:cyan)
        end
        
      end
      puts "#{8 - index} #{colored_row.join} #{8 - index}"
    end
  end
  def show_searches(show_moves = [])
    display = YAML.load(YAML.dump(@Board))
    show_moves.each{|move| display[move[0]][move[1]] = black_circle}
    display
  end
  def generate_moves
    generator = Generate.new(@Board)
    data = []
    loop do
      # [display_moves, piece, @position]
      data = generator.display_possible_moves()
      dots = data[0]
      print_board(dots)
      puts 'Are you satisfied viewing moves (y) or (n)'
      puts 'this will end the loop'
      quit = gets.chomp
      break if quit == 'y'
    end
    moves = data[0]
    piece = data[1]
    original_position = data[2]
    puts "You are now moving #{piece} from #{original_position}"
    choice_index = choosing_move(data[0])
    choice = moves[choice_index]
    symbol = @Board[original_position[0]][original_position[1]]
    @Board[original_position[0]][original_position[1]] = " "
    @Board[choice[0]][choice[1]] = symbol
    print_board
  end
  def choosing_move(moves) 
    p moves
    puts 'Enter index you wish to do'
    location_input = gets.chomp.to_i
  end
  def reset()
    @Board = [
      [black_rook, black_knight, black_bishop, black_queen, black_king, black_bishop, black_knight,
       black_rook], [black_pawn, black_pawn, black_pawn, black_pawn, black_pawn, black_pawn, black_pawn, black_pawn], [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], [white_pawn, white_pawn, white_pawn, white_pawn, white_pawn, white_pawn, white_pawn, white_pawn], [white_rook, white_knight, white_bishop, white_queen, white_king, white_bishop, white_knight, white_rook]
    ]
    
    # originally tried @Board Array.new(8){Array.new(8, "")} did not work
    @Win = false
  end
  def save()
    File.open('board.yml', 'w'){|file| file.write(YAML.dump(@Board))}
  end
  def load()
    prev = File.open('board.yml', 'r')
    @Board = YAML.load(prev)
  end
end
