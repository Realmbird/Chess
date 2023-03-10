require_relative './Piece'
# knight moves
class Knight < Piece
  def display_knight_moves(position)
    row = position[0]
    col = position[1]
    possible_attacks = [[row + 1, col + 2], [row + 2, col + 1], [row - 1, col + 2], [row - 2, col + 1], [row + 1, col - 2], [row + 2, col - 1], [row - 2, col - 1], [row - 1, col - 2]]
    possible_attacks.filter{|attack| isValid?(attack[0], attack[1])}
  end
  def knight_moves(position)
    row = position[0]
    col = position[1]
    possible_attacks = [[row + 1, col + 2], [row + 2, col + 1], [row - 1, col + 2], [row - 2, col + 1], [row + 1, col - 2], [row + 2, col - 1], [row - 2, col - 1], [row - 1, col - 2]]
    possible_attacks.filter{|attack| valid?(attack[0], attack[1])}
  end
end