require_relative './Piece'
class Rook  < Piece
  def rook_moves(position)
    # y
    row = position[0]
    # x
    col = position[1]
    possible_moves = []

    for x in (0..7)
      unless x == col
        postion.push([row,x])
        break unless isValid?(row, x)
      end
    end

    for y in (0..7)
      unless y == row
        postion.push([y,col])
        break unless isValid?(y, col)
      end
    end
    possible_moves
  end
end