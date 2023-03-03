require_relative '../lib/Chess'

describe Chess do
  describe '#Game_Setup' do
    subject(:intro_game){described_class.new() }
    before do
      allow(intro_game).to receive(:puts).exactly(2).time
      allow(intro_game).to receive(:gets).and_return('Jhammer')
      
    end
    it 'prompts the user for a players names' do
      expect(intro_game).to receive(:gets).exactly(2).time
      
      intro_game.game_setup
    end
  end
  describe "#run_game" do
    subject(:demo_game){described_class.new()}
  end
end