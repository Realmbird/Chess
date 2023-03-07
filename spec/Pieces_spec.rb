require_relative '../lib/Pieces/Rook'
require_relative '../lib/Pieces/Bishop'
require_relative '../lib/Board'
describe Board do
  subject(:default_board){ described_class.new() }
  let(:empty){default_board.Board}
  describe Rook do
    subject(:rook_attacking){ described_class.new(empty) }
    describe 'rook_moves' do
      expect(rook_attacking.rook_moves([4,4])).to eq([[4,0],[4,1]])
    end
  end
  
  describe Bishop do
    subject(:bishop_attacking){ described_class.new(empty) }
    describe 'bishop_moves' do

    end
  end
end