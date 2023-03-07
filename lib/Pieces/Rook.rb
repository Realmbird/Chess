require_relative './Piece'
class Rook  < Piece
  def rook_moves(position)
    # y
    row = position[0]
    # x
    col = position[1]
    possible_moves = []

    # left
    for x in (1..7)
      left = col - x
      break unless valid?(row,left)

      possible_moves.push([row,left])
      break unless isValid?(row, left)
      
    end

    # right
    for x in (1..7)
      right = col + x
      break unless valid?(row,right)

      possible_moves.push([row,right])
      break unless isValid?(row, right)
    end
    # up
    for y in (1..7)
      up = row - y
      # out of bounds
      break unless valid?(up,col)

      possible_moves.push([up,col])
      # checks if piece is blocking
      break unless isValid?(up, col)
    end
    # down
    for y in (1..7)
      down = row + y
      # out of bounds
      break unless valid?(down,col) 

      possible_moves.push([down,col])
      break unless isValid?(down, col)
    end
    possible_moves
  end
end