require_relative '../lib/Details/Assests'
require_relative './Validator'
Dir[File.join(__dir__, 'Pieces', '*.rb')].each { |file| require file }
class Generate
  include Assets
  include Validator
  attr_accessor :position
  def initialize(board)
    @Board = board
    @position = nil
  end
  # gonna move piece
  def detect_piece(row,col)
    location = @Board[row][col]
    piece_name(location)
  end

  # ask for position until detect piece works
  def select_piece
    puts 'Enter location you wish to select chess Notation'
    location_input = gets.chomp
    position = converter(location_input)
    if detect_piece(position[0], position[1]) != 'error'
      @position = position
      detect_piece(position[0], position[1])
    else
      select_piece
    end
  end
  
  # makes generate_moves array
  def display_possible_moves()
    piece = select_piece
    display_moves = nil
    case piece
    when 'white rook'
      white_rook = Rook.new(@Board)
      display_moves = white_rook.display_rook_moves(@position)
    when 'white bishop'
      white_bishop = Bishop.new(@Board)
      display_moves = white_bishop.display_bishop_moves(@position)
    when 'white pawn'
      white_pawn = Pawn.new(@Board)
      display_moves = white_pawn.display_white_moves(@position)
    when 'white_knight'
      white_knight = Knight.new(@Board)
      display_moves = white_knight.display_knight_moves(@position)
    when 'white_king'
      white_king = King.new(@Board)
      display_moves = white_king.display_king_moves(@position)
    when 'white_queen'
      white_queen = Queen.new(@Board)
      display_moves = white_queen.display_queen_moves(@position)
    when 'black rook'
      black_rook = Rook.new(@Board)
      display_moves = black_rook.display_rook_moves(@position)
    when 'black bishop'
      black_bishop = Bishop.new(@Board)
      display_moves = black_bishop.display_bishop_moves(@position)
    when 'black pawn'
      black_pawn = Pawn.new(@Board)
      display_moves = black_pawn.display_black_moves(@position)
    when 'black_knight'
      black_knight = Knight.new(@Board)
      display_moves = black_knight.display_knight_moves(@position)
    when 'black_king'
      black_king = King.new(@Board)
      display_moves = black_king.display_king_moves(@position)
    when 'black_queen'
      black_queen = Queen.new(@Board)
      display_moves = black_queen.display_queen_moves(@position)
    else
      'error'
    end
    display_moves
  end
end