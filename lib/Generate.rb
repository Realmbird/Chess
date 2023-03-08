require_relative '../lib/Details/Assests'
require_relative './Validator'
class Generate
  include Assets
  include Validator
  def initialize(board)
    @Board = board
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
      detect_piece(position[0], position[1])
    else
      select_piece
    end
  end
  
  # makes generate_moves array
  def possible_moves()
    piece = select_piece
    case piece
    when 'white king'
      
    else

    end
  end
end