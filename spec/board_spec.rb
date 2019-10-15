require 'rspec'
require './src/board'
require './spec/spec_helpers'

RSpec.describe 'squares can be integer tuples or strings' do
  it 'converts strings to squares' do
    expect(Sq('a8')).to eq Vector[0, 0]
    expect(Sq('h1')).to eq Vector[7, 7]
  end

  it 'converts squares to strings' do
    expect(Sq('a8').to_coord).to eq 'a8'
    expect(Sq('h1').to_coord).to eq 'h1'
  end

  it 'can assign a piece to a square' do
    board = Board.empty
    board << Pawn.new(:white, 'b6')
    expected = <<~EOF
      ········
      ········
      ·P······
      ········
      ········
      ········
      ········
      ········
    EOF
    compare_board_strings board, expected
  end
end
