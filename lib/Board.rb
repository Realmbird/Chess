require_relative './Details/Color'
require_relative './Details/Assests'
class Board 
  include ColorableString
  include Assets
  attr_accessor :Board, :Win
  def initialize ()
    @Board = Array.new(8) { Array.new(8, "a")}
    @Win = false
  end
  def printBoard 
    p %w[ ,a, b, c, d, e, f, g, h]
    @Board.each_with_index do |row, index|
      p "#{index} #{row.each_with_index{
        |element,e_index|
        color_index = index + e_index
        element.bg_color(:white) if(color_index % 2 == 0)
        element.bg_color(:black) if(color_index % 2 == 1)
      }} #{index}"
    end
  end
  def converter(input)
    letter = letter_index(input[0])
    number = input[1]
    chess_row = 8 - number.to_i
    chess_col = letter_index(letter)
    [chess_row, chess_col]
  end
  def letter_index(letter)
    letter.to_s.downcase.ord - "a".ord
  end
  def isValid(row, col)
    if @Board[row].nil? || @Board[row][col].nil?
      false
    else
      true
    end
  end
  def isAdded()

  end
end
