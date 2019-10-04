require_relative 'piece'
require 'matrix'

class Knight < Piece
  def range
    directions = each_direction(Vector[1,2]) +
      each_direction(Vector[2,1])
    directions.map { |d| d + sq }.find_all(&:inside?)
  end
end
