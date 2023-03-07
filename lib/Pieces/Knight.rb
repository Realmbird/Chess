require_relative './Piece'
# knight moves
class Knight < Piece

  def knight_moves(position)
    row = position[0]
    col = position[1]
    possible_attacks = [[row + 1, col + 2], [row + 2, col + 1], [row - 1, col + 2], [row - 2, col + 1], [row + 1, col - 2], [row + 2, col - 1], [row - 2, col - 1], [row - 1, col - 2]]
    possible_attacks
  end
end