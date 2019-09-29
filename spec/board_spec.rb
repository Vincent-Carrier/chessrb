require_relative './spec_helpers'
require_relative '../src/board'

describe 'squares can be integer tuples or strings' do
  it 'converts strings to squares' do
    expect(Sq('a8')).to eq Sq(0,0)
    expect(Sq('h1')).to eq Sq(7,7)
  end

  it 'converts squares to strings' do
    expect(Sq('a8').to_s).to eq 'a8'
    expect(Sq('h1').to_s).to eq 'h1'
  end

  it 'can assign a piece to a square' do
    board = Board.empty
    board[Sq(1,2)] = Pawn.new :white
    expected = <<~EOF
      ________
      ________
      _P______
      ________
      ________
      ________
      ________
      ________
    EOF
    compare_board_strings board, expected
  end
end
