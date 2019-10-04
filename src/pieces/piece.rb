require_relative '../square.rb'
require 'matrix'

class Piece < Struct.new(:color, :sq)
  ROT_MATRIX = Matrix[[0,-1], [1,0]]

  COLORS = [:black, :white]

  def each_direction unit_vec
    directions = 3.times.reduce([unit_vec]) do |arr, _|
      arr << (ROT_MATRIX * arr.last)
    end
    if block_given?
      directions.map { |dir| yield dir }
    else
      directions
    end
  end

  def to_char
    c = self.class.to_s.downcase
    s = c == 'knight' ? c[1] : c[0]
    color == :white ? s.upcase : s
  end
end
