require_relative './Details/Color'
require_relative './Details/Assests'
<<<<<<< HEAD
class Board 
  include ColorableString
  include Assets
  attr_accessor :Board, :Win
  def initialize ()
    @Board = Array.new(8) { Array.new(8, "a")}
=======
class Board
  using ColorableString
  include Assets
  attr_accessor :Board, :Win

  def initialize
    @Board = [
      [black_rook, black_knight, black_bishop, black_queen, black_king, black_bishop, black_knight,
       black_rook], [black_pawn, black_pawn, black_pawn, black_pawn, black_pawn, black_pawn, black_pawn, black_pawn], [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], [white_pawn, white_pawn, white_pawn, white_pawn, white_pawn, white_pawn, white_pawn, white_pawn], [white_rook, white_knight, white_bishop, white_queen, white_king, white_bishop, white_knight, white_rook]
    ]
    # originally tried @Board Array.new(8){Array.new(8, "")} did not work
>>>>>>> ab00f8a62db034d3e52f405d3ae577470305b647
    @Win = false
  end

  def printBoard
    puts '  abcdefgh '
    @Board.each_with_index do |row, index|
      colored_row = row.map.with_index do |element, e_index|
        color_index = index + e_index
<<<<<<< HEAD
        element.bg_color(:white) if(color_index % 2 == 0)
        element.bg_color(:black) if(color_index % 2 == 1)
      }} #{index}"
=======
        if color_index.even?
          element.to_s.ljust(5).bg_color(:green)
        else
          element.to_s.ljust(5).bg_color(:cyan)
        end
      end
      puts "#{8 - index} #{colored_row.join} #{8 - index}"
>>>>>>> ab00f8a62db034d3e52f405d3ae577470305b647
    end
  end
  def converter(input)
    letter = letter_index(input[0])
    number = input[1]
    chess_row = 8 - number.to_i
    chess_col = letter_index(letter)
    [chess_row, chess_col]
  end
  def letter_index(letter)
    letter.to_s.downcase.ord - "a".ord
  end
  def isValid(row, col)
    if @Board[row].nil? || @Board[row][col].nil?
      false
    else
      true
    end
  end
  def isAdded()

  end
end
