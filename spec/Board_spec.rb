require_relative '../lib/Board'
describe Board do
  
  describe "#isValid" do
    subject(:validator){ described_class.new()}
    it 'returns false when column is false' do
      expect(validator.valid?(8,8)).to eq(false)
    end
    it 'return false when row is false' do
      expect(validator.valid?(0,8)).to eq(false)
    end
    it 'returns true when row and column is valid' do
      expect(validator.valid?(0,0)).to eq(true)
    end
  end
  describe 'letter index' do
    subject(:index_finder){described_class.new}
    it 'returns 0' do
      expect(index_finder.letter_index('a')).to eq(0)
    end
  end
  describe 'letter converter' do
    subject(:letter_converter) {described_class.new}
    it 'returns [0,0]' do
      expect(letter_converter.converter('a8')).to eq([0,0])
    end
  end
end