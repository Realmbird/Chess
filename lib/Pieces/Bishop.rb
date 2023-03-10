require_relative './Piece'
class Bishop < Piece
  def display_bishop_moves(current_position)
    # y row
    y = current_position[0]
    # x col
    x = current_position[1]
    possible_moves = []

    # upper right
    for i in (1..7)
      break unless isValid?(y+i, x+i)
      possible_moves.push([y+i, x+i])
    end

    # up left
    for i in (1..7)
      break unless isValid?(y-i, x+i)
      possible_moves.push([y-i, x+i])
    end

    # down left
    for i in (1..7)
      break unless isValid?(y-i, x-i)
      possible_moves.push([y-i, x-i])
    end
    # down right
    for i in (1..7)
      break unless isValid?(y+i, x-i)
      possible_moves.push([y+i, x-i])
    end
    possible_moves
  end
  def bishop_moves(current_position)
    # y row
    y = current_position[0]
    # x col
    x = current_position[1]
    possible_moves = []

    # upper right
    for i in (1..7)
      break unless valid?(y+i, x+i)
      possible_moves.push([y+i, x+i])
      break unless isValid?(y+i, x+i)
    end

    # up left
    for i in (1..7)
      break unless valid?(y-i, x+i)
      possible_moves.push([y-i, x+i])
      break unless isValid?(y-i, x+i)
    end

    # down left
    for i in (1..7)
      break unless valid?(y-i, x-i)
      possible_moves.push([y-i, x-i])
      break unless isValid?(y-i, x-i)
    end
    # down right
    for i in (1..7)
      break unless valid?(y+i, x-i)
      possible_moves.push([y+i, x-i])
      break unless isValid?(y+i, x-i)
    end
    possible_moves
  end
end