class Sq < Struct.new(:x, :y)
  def to_s
    (97 + x).chr + (8 - y).to_s
  end

  def + o
    Sq(x + o.x, y + o.y)
  end

  def - o
    Sq(x - o.x, y - o.y)
  end

  def * o
    case o
    when Integer then Sq(x * o, y * o)
    when Sq then Sq(x * o.x, y * o.y)
    end
  end

  def inside?
    all? { |n| (0..7).include? n }
  end
end

def Sq x, y = nil
  case x
  when Integer then Sq.new x, y
  when String then Sq.new(x[0].ord - 97, 8 - x[1].to_i)
  end
end

def Vec x, y
  Sq.new x, y
end
