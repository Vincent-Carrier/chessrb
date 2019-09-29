Dir['src/**/*.rb'].each { |f| require_relative f }
require_relative 'spec/spec_helpers'

require 'pry'; binding.pry
bo = Board.starting_position
empty_board = Board.empty
bishop = Bishop.new :white, Sq('e4')
