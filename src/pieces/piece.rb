require_relative '../square.rb'
require 'matrix'

class Piece
  ROT_MATRIX = Matrix[[0, -1], [1, 0]]
  COLORS = [:black, :white]

  attr_accessor :color, :sq

  def initialize color = nil, sq = nil
    @color = color
    self.sq = sq
  end

  def sq=(v)
    @sq = case v
          when String then Sq v
          else v
          end
  end

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

  def opposite_color
    color == :white ? :black : :white
  end

  def to_char
    c = self.class.to_s.downcase
    s = c == 'knight' ? c[1] : c[0]
    color == :white ? s.upcase : s
  end

  def == o
    color == o.color && sq == o.sq
  end
end
