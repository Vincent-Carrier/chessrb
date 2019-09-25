require_relative 'piece'

class RangedPiece < Piece
  def range from
    DIRECTIONS.flat_map do |dir|
      UNIT_VEC.flat_map do |vec|
        (0..7).each do |i|
          from + ((vec * dir) * i)
        end.take_while(&:inside?)
      end
    end
  end
end

class Bishop < RangedPiece
  UNIT_VEC = [Vec(1, 1)]
end

class Rook < RangedPiece
  UNIT_VEC = [Vec(0, 1)]
end

class Queen < RangedPiece
  UNIT_VEC = [Vec(0, 1), Vec(1,1)]
end
