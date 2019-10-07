require_relative 'piece'

class Pawn < Piece
  def initialize color, sq = nil
    super
    @forward = (color == :white ? -1 : 1)
  end

  def first_row?
    first_row = (color == :white ? 6 : 1)
    @sq.y == first_row
  end

  def range
    rng = first_row? ? 2 : 1
    (1..rng).map { sq + (Vector[0, 1] * @1 * @forward) }
  end

  def possible_moves board
    range
  end

  def en_passant; end
end
