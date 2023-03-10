require_relative './Piece'
class King < Piece
  def display_king_moves(position)
    row = position[0]
    col = position[1]
    possible_moves = [[row + 1, col],[row + 1, col - 1], [row + 1, col + 1], [row - 1, col], [row - 1, col + 1], [row - 1, col - 1], [row, col - 1], [row, col + 1]]
    possible_moves.filter{|attack| isValid?(attack[0], attack[1])}
  end
  def king_moves(position)
    row = position[0]
    col = position[1]
    possible_moves = [[row + 1, col],[row + 1, col - 1], [row + 1, col + 1], [row - 1, col], [row - 1, col + 1], [row - 1, col - 1], [row, col - 1], [row, col + 1]]
    possible_moves.filter{|attack| valid?(attack[0], attack[1])}
  end
end