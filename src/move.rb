require_relative 'square'

class Move
  def self.parse str
    case str
    when /([a-h][1-8])-([a-h][1-8])/ then StandardMove.new(Sq($1), Sq($2))
    when /O-O/ then CastleMove.new :king
    when /O-O-O/ then CastleMove.new :queen
    end
  end
end

class StandardMove < Move
  attr_reader :from, :to

  def initialize from, to
    @from = from
    @to = to
  end

  def to_s
    "#{@from.to_coord}-#{@to.to_coord}"
  end
end

class CastleMove < Move
  def initialize side
    @side = side
  end

  def to_s
    @side == :king ? 'O-O' : 'O-O-O'
  end
end
