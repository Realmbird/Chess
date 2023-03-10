require_relative './Piece'
# the pawn movment
class Pawn < Piece
  def display_white_moves(position)
    row = position[0]
    col = position[1]
    possible_moves = []
    # basic movement
    for i in (1 .. 2)
      break unless isValid?(row - i, col)
      possible_moves.push([row - i, col])
    end
    # attacks
    attacks = white_attack(position)
    possible_moves.push(attacks) if attacks != []
    possible_moves
  end

  def white_moves(position)
    row = position[0]
    col = position[1]
    possible_moves = []
    # basic movement
    for i in (1 .. 2)
      break unless isValid?(row - i, col)
      possible_moves.push([row - i, col])
    end
    # attacks
    attacks = white_attack(position)
    possible_moves.push(attacks) if attacks != []
    possible_moves.filter{|attack| isValid?(attack[0], attack[1])}
  end
  def display_black_moves(position)
    row = position[0]
    col = position[1]
    possible_moves = []
    # basic movement
    for i in (1 .. 2)
      break unless isValid?(row + i, col)
      possible_moves.push([row + i, col])
    end
    # attack
    attacks = black_attack(position)
    possible_moves.push(attacks) if attacks != []
    possible_moves.filter{|attack| isValid?(attack[0], attack[1])}
  end
  def black_moves(position)
    row = position[0]
    col = position[1]
    possible_moves = []
    # basic movement
    for i in (1 .. 2)
      break unless isValid?(row + i, col)
      possible_moves.push([row + i, col])
    end
    # attack
    attacks = black_attack(position)
    possible_moves.push(attacks) if attacks != []
    possible_moves
  end

  def white_attack(position)
    row = position[0]
    col = position[1]
    possible_moves = []
    
    possible_attacks = [[row - 1,col + 1], [row - 1, col - 1]]
    possible_attacks.filter{|attack| pawn_attack?(attack[0], attack[1])}
  end

  def black_attack(position)
    row = position[0]
    col = position[1]
    possible_moves = []
    possible_attacks = [[row + 1, col + 1], [row + 1, col - 1]]
    possible_attacks.filter{|attack| pawn_attack?(attack[0], attack[1])}
  end
end