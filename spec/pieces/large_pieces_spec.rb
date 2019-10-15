require './src/pieces/large_pieces'
require './src/board'
require './spec_helpers'

RSpec.describe 'A bishop on e4' do
  let(:bishop) { Bishop.new :white, Sq('e4') }

  it 'moves diagonally' do
    expected = <<~EOF
      X·······
      ·X·····X
      ··X···X·
      ···X·X··
      ········
      ···X·X··
      ··X···X·
      ·X·····X
    EOF
    assert_range bishop, expected
  end

  it 'stops when it meets another piece' do
    expected = <<~EOF
      ········
      ·X·····X
      ··X···X·
      ···X·X··
      ········
      ···X·X··
      ········
      ········
    EOF
    board = Board.starting_position
    assert_possible_moves bishop, board, expected
  end
end

RSpec.describe 'A rook on e4' do
  let(:rook) { Rook.new :white, Sq('e4') }

  it 'moves straight' do
    expected = <<~EOF
      ····X···
      ····X···
      ····X···
      ····X···
      XXXX·XXX
      ····X···
      ····X···
      ····X···
    EOF
    assert_range rook, expected
  end
end

RSpec.describe 'A queen on e4' do
  let(:queen) { Queen.new :white, Sq('e4') }

  it 'moves straight and diagonally' do
    expected = <<~EOF
      X···X···
      ·X··X··X
      ··X·X·X·
      ···XXX··
      XXXX·XXX
      ···XXX··
      ··X·X·X·
      ·X··X··X
    EOF
    assert_range queen, expected
  end
end

