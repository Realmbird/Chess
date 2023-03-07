require_relative './Piece'
# the pawn movment
class Pawn < Piece
  def white_moves(position)
    row = position[0]
    col = position[1]
    possible_moves = []
    for i in (1 .. 2)
      break unless isValid?(row - i, col)
      possible_moves.push([row - i, col])
    end
    possible_moves
  end

  def black_moves(position)
    row = position[0]
    col = position[1]
    possible_moves = []
    for i in (1 .. 2)
      break unless isValid?(row + i, col)
      possible_moves.push([row + i, col])
    end
    possible_moves
  end

  def white_attack(position)
    row = position[0]
    col = position[1]
    possible_moves = []
    
    possible_attacks = [[row - 1,col + 1], [row - 1, col - 1]]
    possible_attacks.filter{|attack| attack.pawn_attack?(attack[0], attack[1])}
    possible_attacks
  end

  def black_attack(position)
    row = position[0]
    col = position[1]
    possible_moves = []
    possible_attacks = [[row + 1, col + 1], [row + 1, col - 1]]
    possible_attacks.filter{|attack| attack.pawn_attack?(attack[0], attack[1])}
    possible_attacks
  end
end