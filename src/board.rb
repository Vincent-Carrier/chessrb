require_relative 'square'
require_relative 'pieces/king'
require_relative 'pieces/large_pieces'
require_relative 'pieces/knight'
require_relative 'pieces/pawn'

class Board
  def initialize arr, history = []
    @arr = arr
    @history = history
    @black_pieces, @white_pieces = [], []
    @arr.each.with_index do |row, y|
      row.each.with_index do |piece, x|
        if piece
          piece.sq = Vector[x,y]
          pieces = piece.color == :white ? @white_pieces : @black_pieces
          pieces << piece
        end
      end
    end
  end

  def self.starting_position
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    black_pieces = pieces.map(&:new).each { |p| p.color = :black }
    white_pieces = pieces.map(&:new).each { |p| p.color = :white }
    black_pawns = Array.new(8) { Pawn.new :black }
    white_pawns = Array.new(8) { Pawn.new :white }
    empty = Array.new(4) { Array.new 8 }
    arr = [black_pieces, black_pawns, white_pawns, white_pieces]
    arr[2...2] = empty
    Board.new arr
  end

  def [] i
    case i
    when String then self[Sq i]
    when Vector then @arr[i.y][i.x]
    end
  end

  def []= sq, v
    case sq; when String then sq = Sq(sq); end
    @arr[sq.y][sq.x] = v
    v.sq = sq if v.is_a? Piece
  end

  def self.squares squares
    str = Board.empty.inspect.lines
    squares.each { |sq| str[sq.y][sq.x] = 'X' }
    str.join ''
  end

  def inspect
    "\n" + @arr.map do |row|
      row.map { |p| p ? p.to_char : '_' }.join
    end.join("\n")
  end
end
