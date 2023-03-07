require_relative '../Validator'
class Piece
  include Validator
  def initialize(board)
      @Board = board
  end
end