require_relative 'piece'
require 'matrix'

class Knight < Piece
  def range
    directions = each_direction(Vector[1, 2]) +
                 each_direction(Vector[2, 1])
    directions.map { |d| d + sq }.find_all(&:inside?)
  end

  def possible_moves board
    range.reject { |sq| board[sq]&.color == opposite_color }
  end
end
