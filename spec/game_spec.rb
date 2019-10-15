require './src/cli_game'
require './src/move'
require './spec/spec_helpers'

RSpec.describe Game do
  describe 'A new game' do
    let(:game) { CLIGame.new }

    it 'allows the white player to play e4' do
      move = game.parse 'e4'
      expect(game.legal?(move)).to be true
      game.execute move
      expect(game.board['e4']).to eq(Pawn.new(:white, 'e4'))
      expect(game.board['e2']).to be nil
    end

    it 'allows the white player to play Nf3' do
      move = game.parse 'Nf3'
      expect(game.legal?(move)).to be true
      game.execute move
      expect(game.board['f3']).to eq(Knight.new(:white, 'f3'))
    end

    it 'disallows moves not targetting a white piece' do
      move = game.parse 'e7-e5'
      expect(game.legal? move).to be false
      move = game.parse 'e3-e5'
      expect(game.legal? move).to be false
    end
  end
end
