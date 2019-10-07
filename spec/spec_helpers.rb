require 'rspec'
require_relative '../src/board'

def compare_board_strings a, e
  expect(a.inspect.strip).to eq(e.strip)
end

class Board
  def self.empty
    Board.new(Array.new(8) { Array.new(8) })
  end
end

def assert_range piece, exp
  expect(Board.squares(piece.range.flatten).strip).to eq(exp.strip)
end

def assert_possible_moves piece, board, exp
  squares = Board.squares(piece.possible_moves(board)).strip
  expect(squares).to eq(exp.strip)
end
