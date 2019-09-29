require_relative '../square.rb'

class Piece < Struct.new(:color, :sq)
  DIRECTIONS = [Vec(1, 1), Vec(-1, -1),
                Vec(1, -1), Vec(-1, 1)]

  COLORS = [:black, :white]

  def each_direction
    fail unless self.respond_to? :UNIT_VEC
  end

  def to_char
    c = self.class.to_s.downcase
    s = c == 'knight' ? c[1] : c[0]
    color == :white ? s.upcase : s
  end
end
