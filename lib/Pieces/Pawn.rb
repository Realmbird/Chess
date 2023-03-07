require_relative './Piece'
# the pawn movment
class Pawn < Piece
  def white_moves(position)
    row = position[0]
    col = position[1]
    [row - 1, col]
  end

  def black_moves(postion)
    row = position[0]
    col = position[1]
    [row + 1, col]
  end

  def white_attack(position)
    row = position[0]
    col = position[1]
    possible_attacks = [[row - 1,col + 1], [row - 1, col - 1]]
    possible_attacks
  end

  def black_attack(position)
    row = position[0]
    col = position[1]
    possible_attacks = [[row + 1, col + 1], [row + 1, col - 1]]
    possible_attacks
  end
end