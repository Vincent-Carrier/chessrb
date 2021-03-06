require './src/pieces/pawn'
require './spec_helpers'

RSpec.describe Pawn do
  context 'A white pawn on e4' do
    let(:pawn) { Pawn.new :white, 'e4' }

    it 'moves towards the opposite side' do
      expected = <<~EOF
        ········
        ········
        ········
        ····X···
        ········
        ········
        ········
        ········
      EOF
      assert_range pawn, expected
    end

    it 'can capture diagonally' do
      skip
    end

    it 'can capture en passant' do
      skip
    end
  end

  context 'A black pawn of a7' do
    it 'can move two squares forward' do
      skip
    end
  end
end
