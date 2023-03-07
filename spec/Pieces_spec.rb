require_relative '../lib/Pieces/Rook'
require_relative '../lib/Pieces/Bishop'
require_relative '../lib/Board'
describe Board do
  subject(:default_board){ Board.new() }
  let(:empty){default_board.Board}
  describe Rook do
    subject(:rook_attacking){ Rook.new(empty) }
    describe 'rook_moves' do
      it 'returns possible moves for a rook' do
        expect(rook_attacking.rook_moves([4,4])).to contain_exactly([4,0],[4,1],[4,2],[4,3],[4,5],[4,6],[4,7],[5,4],[3,4],[2,4])
      end
    end
  end
  
  describe Bishop do
    subject(:bishop_attacking){ described_class.new(empty) }
    describe 'bishop_moves' do

    end
  end
end