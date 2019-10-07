require 'matrix'

class Vector
  def x; self[0]; end
  def y; self[1]; end

  def to_coord
    (97 + x).chr + (8 - y).to_s
  end

  def inside?
    all? { |n| (0..7).include? n }
  end
end

def Sq s
  Vector[s[0].ord - 97, 8 - s[1].to_i]
end
