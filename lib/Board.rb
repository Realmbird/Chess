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
        color_index.even? ?  element.to_s.ljust(5).bg_color(:green) : element.to_s.ljust(5).bg_color(:cyan)
      end
      puts "#{8 - index} #{colored_row.join} #{8 - index}"
    end
  end
  def show_searches(show_moves = [])
    display = @Board.dup
    show_moves.each{|move| display[move[0]][move[1]] = black_circle}
    display
  end
  def generate_moves
    generator = Generate.new(@Board)
    loop do
      dots = generator.display_possible_moves()
      print_board(dots)
      puts 'Are you satisfied viewing moves (y) or (n)'
      puts 'this will end the loop'
      quit = gets.chomp
      break if quit == 'y'
    end
  end
end
b = Board.new
b.generate_moves
