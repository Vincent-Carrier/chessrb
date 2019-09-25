require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new(:color => true)]

class Board
  def self.empty
    Board.new Array.new(8, Array.new(8))
  end
end
