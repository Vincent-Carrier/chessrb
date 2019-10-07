require_relative '../../src/pieces/large_pieces'
require_relative '../../src/board'
require_relative '../spec_helpers'

RSpec.describe 'A bishop on e4' do
  let(:bishop) { Bishop.new :white, Sq('e4') }

  it 'moves diagonally' do
    expected = <<~EOF
      X_______
      _X_____X
      __X___X_
      ___X_X__
      ________
      ___X_X__
      __X___X_
      _X_____X
    EOF
    assert_range bishop, expected
  end

  it 'stops when it meets another piece' do
    expected = <<~EOF
      ________
      _X_____X
      __X___X_
      ___X_X__
      ________
      ___X_X__
      ________
      ________
    EOF
    board = Board.starting_position
    assert_possible_moves bishop, board, expected
  end
end

RSpec.describe 'A rook on e4' do
  let(:rook) { Rook.new :white, Sq('e4') }

  it 'moves straight' do
    expected = <<~EOF
      ____X___
      ____X___
      ____X___
      ____X___
      XXXX_XXX
      ____X___
      ____X___
      ____X___
    EOF
    assert_range rook, expected
  end
end

RSpec.describe 'A queen on e4' do
  let(:queen) { Queen.new :white, Sq('e4') }

  it 'moves straight and diagonally' do
    expected = <<~EOF
      X___X___
      _X__X__X
      __X_X_X_
      ___XXX__
      XXXX_XXX
      ___XXX__
      __X_X_X_
      _X__X__X
    EOF
    assert_range queen, expected
  end
end

