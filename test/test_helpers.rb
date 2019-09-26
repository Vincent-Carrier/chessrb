require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new(:color => true)]

def compare_board_strings a, e
  a.inspect.strip.must_equal(e.strip)
end

class Board
  def self.empty
    Board.new(Array.new(8) { Array.new(8) })
  end
end
