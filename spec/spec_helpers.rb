require 'rspec'
require 'pry-rescue/rspec'
require_relative '../src/board'
extend RSpec

def compare_board_strings a, e
  expect(a.inspect.strip).to eq(e.strip)
end

class Board
  def self.empty
    Board.new(Array.new(8) { Array.new(8) })
  end
end

def assert_range piece, exp
  expect(Board.squares(piece.range).strip).to eq(exp.strip)
end
