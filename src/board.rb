require_relative 'square'
require_relative 'pieces/king'
require_relative 'pieces/large_pieces'
require_relative 'pieces/knight'
require_relative 'pieces/pawn'

class Board
  def initialize arr, history=[]
    @arr = arr
    @history = history
  end

  def self.starting_position
    pieces = [ Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook ]
    black_pieces = pieces.map(&:new).each { |p| p.color = :black }
    white_pieces = pieces.map(&:new).each { |p| p.color = :white }
    black_pawns = Array.new(8, Pawn.new(:black))
    white_pawns = Array.new(8, Pawn.new(:white))
    empty = Array.new(4, Array.new(8))
    arr = [black_pieces, black_pawns, white_pawns, white_pieces]
    arr[2...2] = empty
    Board.new arr
  end

  def [] i
    case i
    when String then self[Sq(i)]
    when Sq then @arr[i.y][i.x]
    else fail
    end
  end

  def []= i, v
    case i
    when String then self[Sq(i)] = v
    when Sq then @arr[i.y][i.x] = v
    else fail
    end
  end

  def squares squares
    str = board.inspect.lines
    squares.each { |sq| str[sq.y][sq.x] = 'X' }
    str.join '\n'
  end

  def inspect
    "\n" + @arr.map do |row|
      row.map { |p| p ? p.to_s : '_' }.join
    end.join("\n")
  end
end
