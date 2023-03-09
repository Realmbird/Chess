require_relative '../lib/Details/Assests'
require_relative './Validator'
Dir[File.join(__dir__, 'Pieces', '*.rb')].each { |file| require file }
class Generate
  include Assets
  include Validator
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
    else
      'error'
    end
    display_moves
  end
end