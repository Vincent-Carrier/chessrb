require_relative 'square'

class Move; end

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

class AmbiguousMove < Move; end
