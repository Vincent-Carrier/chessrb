Dir['src/**/*.rb'].each { |f| require_relative f }
require_relative 'test/test_helpers'

bo = Board.starting_position
empty_board = Board.empty
bishop = Bishop.new :white, Sq('e4')

require 'pry'; binding.pry
