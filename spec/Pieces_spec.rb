require_relative '../lib/Pieces/Rook'
require_relative '../lib/Pieces/Bishop'
require_relative '../lib/Pieces/Pawn'
require_relative '../lib/Board'
describe Board do
  subject(:default_board){ Board.new() }
  let(:empty){default_board.Board}
  describe Rook do
    subject(:rook_attacking){ Rook.new(empty) }
    describe 'display rook_moves' do
      it 'returns display moves for a rook' do
        expect(rook_attacking.display_rook_moves([4,4])).to contain_exactly([4,0],[4,1],[4,2],[4,3],[4,5],[4,6],[4,7],[5,4],[3,4],[2,4])
      end
      it 'returns possible moves for rook' do
        expect(rook_attacking.rook_moves([4,4])).to contain_exactly([4,0],[4,1],[4,2],[4,3],[4,5],[4,6],[4,7],[5,4],[3,4],[2,4],[6,4],[1,4])
      end
    end
  end
  
  describe Bishop do
    subject(:bishop_attacking){ Bishop.new(empty) }
    describe 'display_bishop_moves' do
      it 'returns display moves for bishop' do
        expect(bishop_attacking.display_bishop_moves([4,4])).to contain_exactly([5,5],[3,3],[2,2],[5,3],[3,5],[2,6])
      end
      it 'returns possible moves for bishop' do 
        expect(bishop_attacking.bishop_moves([4,4])).to contain_exactly([5,5],[3,3],[2,2],[5,3],[3,5],[2,6],[6,6],[6,2],[1,1],[1,7])
      end
    end
  end
  describe Pawn do
    subject(:pawn_movement){ Pawn.new(empty) }
    describe 'white moves' do
      it 'returns white pawn possible' do
        expect(pawn_movement.white_moves([6,0])).to contain_exactly([5,0],[4,0])
      end
    end
    describe 'black moves' do
      it 'returns black pawn possible' do
        expect(pawn_movement.black_moves([1,0])).to contain_exactly([2,0],[3,0])
      end
    end
    describe 'white attack' do
      it 'returns white attacks possible' do
        expect(pawn_movement.white_attack([2,2])).to contain_exactly([1,1],[1,3])
      end
    end
    describe 'black moves' do
      it 'returns black attacks possible' do

      end
    end
  end 
end