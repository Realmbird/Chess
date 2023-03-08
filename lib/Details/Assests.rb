module Assets
  def  white_king
    "\u2654"
  end

  def white_queen
    "\u2655"
  end

  def white_rook
    "\u2656"
  end

  def white_bishop
    "\u2657"
  end

  def white_knight
    "\u2658"
  end

  def white_pawn
    "\u2659"
  end

  def black_king
    "\u265A"
  end

  def black_queen
    "\u265B"
  end

  def black_rook
    "\u265C"
  end

  def black_bishop
    "\u265D"
  end

  def black_knight
    "\u265E"
  end

  def black_pawn
    "\u265F"
  end

  def blank_circle
    "\u25cb"
  end

  def white_circle
    "\u26AA"
  end

  def black_circle
    "\u26AB"
  end
  def piece_name(sprite)
    case sprite
    when white_pawn
      'white pawn'
    when black_pawn
      'black pawn'
    when white_king
      'white king'
    when black_king
      'black king'
    when white_rook
      'white rook'
    when black_rook
      'black rook'
    when white_bishop
      'white bishop'
    when black_bishop
      'black bishop'
    when white_knight
      'white knight'
    when black_knight
      'black knight'
    when white_queen
      'white queen'
    when black_queen
      'black queen'
    else
      'error'
    end
  end
end

