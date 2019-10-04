require_relative 'piece'
require 'matrix'

class RangedPiece < Piece
  def _range(unit_vec)
    each_direction(unit_vec) do |dir|
      (1..7).map do |i|
        sq + (dir * i)
      end.take_while(&:inside?)
    end.to_a.flatten
  end
end

class Bishop < RangedPiece
  def range
    _range Vector[1,1]
  end
end

class Rook < RangedPiece
  def range
    _range Vector[0,1]
  end
end

class Queen < RangedPiece
  def range
    _range(Vector[0,1]) + _range(Vector[1,1])
  end
end
