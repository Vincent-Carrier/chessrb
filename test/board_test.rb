require 'minitest/autorun'
require_relative 'test_helpers'
require_relative '../src/board'

describe "squares can be integer tuples or strings" do
  it "converts strings to squares" do
    Sq('a8').must_equal Sq(0,0)
    Sq('h1').must_equal Sq(7,7)
  end
  it "converts squares to strings" do
    Sq('a8').to_s.must_equal 'a8'
    Sq('h1').to_s.must_equal 'h1'
  end
end
