module Validator

  # converts string into row and col
  def converter(input)
    letter = input[0]
    number = input[1]
    chess_row = 8 - number.to_i
    chess_col = letter_index(letter)
    [chess_row, chess_col]
  end

  # converts letter into index
  def letter_index(letter)
    letter.downcase.ord - 'a'.ord
  end

  # checks if row and col is not nil and if something is obstructed
  def isValid?(row, col)
    if @Board[row].nil? || @Board[row][col].nil? || row.negative? || col.negative? || @Board[row][col] != ' '
      false
    else
      true
    end
  end
  # checks if row and col is not nil
  def valid?(row, col)
    if @Board[row].nil? || @Board[row][col].nil? || row.negative? || col.negative? || @Board[row][col] != ' '
      false
    else
      true
    end
  end
end