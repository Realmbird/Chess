require_relative '../lib/Board'
require_relative '../lib/Generate'
describe Board do
  
  subject(:default_board){ Board.new() }
  let(:empty){default_board.Board}
  describe Generate do
    describe 'detect piece' do
      subject(:letter_detector) { Generate.new(empty) } 
      it 'detects black rook' do
        expect(letter_detector.detect_piece(0,0)).to eq('black rook')
      end
      it 'detects black knight' do
        expect(letter_detector.detect_piece(0,1)).to eq('black knight')
      end
      it 'detects black bishop' do
        expect(letter_detector.detect_piece(0,2)).to eq('black bishop')
      end
      it 'detects black queen' do
        expect(letter_detector.detect_piece(0,3)).to eq('black queen')
      end
      it 'detects black king' do
        expect(letter_detector.detect_piece(0,4)).to eq('black king')
      end
      it 'detects white rook' do
        expect(letter_detector.detect_piece(7,0)).to eq('white rook')
      end
      it 'detects white knight' do
        expect(letter_detector.detect_piece(7,1)).to eq('white knight')
      end
      it 'detects white bishop' do
        expect(letter_detector.detect_piece(7,2)).to eq('white bishop')
      end
      it 'detects white queen' do
        expect(letter_detector.detect_piece(7,3)).to eq('white queen')
      end
      it 'detects white king' do
        expect(letter_detector.detect_piece(7,4)).to eq('white king')
      end
      it 'detect black pawn' do
        expect(letter_detector.detect_piece(1,4)).to eq('black pawn')
      end
      it 'detect white pawn' do
        expect(letter_detector.detect_piece(6,4)).to eq('white pawn')
      end
      it 'detects error' do
        expect(letter_detector.detect_piece(2,2)).to eq('error')
      end
    end
    describe 'select piece' do
      subject(:move_selector){ Generate.new(empty) }
      context 'has normal input first' do
        before do
          allow(move_selector).to receive(:puts).exactly(1).time
          allow(move_selector).to receive(:gets).and_return('a8')
        end
        it 'returns black rook' do
          expect(move_selector.select_piece).to eq('black rook')
        end
      end
      context 'has error input first' do
        before do
          allow(move_selector).to receive(:puts).exactly(2).time
          allow(move_selector).to receive(:gets).and_return('b6', 'a8')
        end
        it 'recieves error' do
          expect(move_selector).to receive(:detect_piece).with(2,1).and_return('error')
          expect(move_selector).to receive(:detect_piece).with(0,0).and_return('black rook').twice()
          move_selector.select_piece
        end
      end
    end

    describe 'display possible moves' do
      subject(:move_generator){ Generate.new(empty) }
      context 'white rook' do
        before do
          allow(move_generator).to receive(:piece).and_return('white rook')
        end
        it 'returns empty array' do
          expect(move_generator).to receive(:display_moves).and_return([])
          move_generator.display_possible_mov
        end
      end
    end

  end
end