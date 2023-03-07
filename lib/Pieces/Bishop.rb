require_relative './Piece'
require_relative './Validator'
class Bishop < Piece
  include Validator
  def bishop_moves(position)
    # y row
    y = position[0]
    # x col
    x = position[1]
    possible_moves = []

    # upper right
    for i in (0..8)
      break unless isValid?(y+i, x+i)
      possible_moves.push([y+i, x+i])
    end

    # up left
    for i in (0..8)
      break unless isValid?(y-i, x+i)
      possible_moves.push([y-i, x+i])
    end

    # down left
    for i in (0..8)
      break unless isValid?(y-i, x-i)
      possible_moves.push([y-i, x-i])
    end
    # down right
    for i in (0..8)
      break unless isValid?(y+i, x-i)
      possible_moves.push([y+i, x-i])
    end
    possible_moves
  end
end