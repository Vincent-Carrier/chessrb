require_relative '../src/large_pieces'
require_relative 'spec_helpers'

describe "A bishop" do
  subject(:bishop) { Bishop.new :white }
  board = Board.empty
  board['e4']

  it "moves diagonally" do

  end
end
