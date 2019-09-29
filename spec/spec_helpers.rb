require 'rspec'
extend RSpec

def compare_board_strings a, e
  expect(a.inspect.strip).to eq(e.strip)
end


class Board
  def self.empty
    Board.new(Array.new(8) { Array.new(8) })
  end
end

def compare_range piece, e
  expect(board.squares(piece.range).strip).to eq(e.strip)
end

