require_relative './Piece'
require_relative './Bishop'
require_relative './Rook'
class Queen < Piece
  def initialize(board)
    @Board = board
  end
  def queen_moves(current_position)
     # y row
     y = current_position[0]
     # x col
     x = current_position[1]
     possible_moves = []
     #subjects
     bishop = bishop_moves.new(@Board)
     bishop_move = bishop.bishop_moves
     rook = Rook.new(@Board) 
     rook_move = rook.rook_moves
     possible_moves.push(bishop_move)
     possible_moves.push(rook_move)
     possible_moves
  end
  def display_queen_moves(current_position)
    # y row
    y = current_position[0]
    # x col
    x = current_position[1]
    possible_moves = []
    #subjects 
    bishop = bishop_moves.new(@Board)
    bishop_move = bishop.display_bishop_moves
    rook = Rook.new(@Board) 
    rook_move = rook.display_rook_moves
    possible_moves.push(bishop_move)
    possible_moves.push(rook_move)
    possible_moves
 end
end