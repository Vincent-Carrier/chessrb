require_relative 'piece'

class RangedPiece < Piece
  def range(from = nil)
    DIRECTIONS.flat_map do |dir|
      (1..7).map do |i|
        (from ? from : sq) + ((self.class::UNIT_VEC * dir) * i)
      end.take_while(&:inside?)
    end
  end
end

class Bishop < RangedPiece
  UNIT_VEC = Vec(1, 1)
end

class Rook < RangedPiece
  UNIT_VEC = Vec(0, 1)
end

class Queen < RangedPiece
  UNIT_VEC = Vec(1, 1)
  DIRECTIONS = DIRECTIONS.dup << [Vec(0,1), Vec(1,0),
                                  Vec(0,-1), Vec(-1,0)]
end
