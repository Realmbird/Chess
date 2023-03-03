require_relative './Details/Color'
require_relative './Details/Assests'
class Board 
  using ColorableString
  include Assets
  attr_accessor :Board, :Win
  def initialize ()
    @Board = [['','','','','','','',''],['','','','','','','','']]
    @Win = false
  end
  def printBoard 
    p %w[ ,a, b, c, d, e, f, g, h]
    @Board.each_with_index do |row, index|
      p "#{index} #{row.each_with_index{
        |element,e_index|
        color_index = index + e_index
        element.bg_color(:white) if(color_index %2 == 0)
        element.bg_color(:black) if(color_index %2 == 1)
      }} #{index}"
    end
  end
end
board = Board.new
board.printBoard