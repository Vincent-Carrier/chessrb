require_relative '../src/game'
require_relative '../src/move'
require_relative 'spec_helpers'

RSpec.describe Game do
  describe 'A new game' do
    let(:game) { Game.new_game }

    it 'allows the white player to play e2-e4' do
      move = Move.parse 'e2-e4'
      expect(game.legal?(move)).to be true
      game.execute move
      expect(game.board['e4']).to eq(Pawn.new(:white, 'e4'))
    end

    it 'disallows moves not targetting a white piece' do
      move = Move.parse 'e7-e5'
      expect(game.legal? move).to be false
      move = Move.parse 'e3-e5'
      expect(game.legal? move).to be false
    end
  end
end
