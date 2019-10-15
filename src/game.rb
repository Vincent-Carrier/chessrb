require_relative 'board'

class Game
  attr_reader :board, :history

  def initialize board = Board.starting_position, history = []
    @board = board
    @history = history
  end

  def active_player
    @history.size.odd? ? :black : :white
  end

  def legal? move
    case move
    when StandardMove
      piece = @board[move.from]
      return false unless piece&.color == active_player

      piece.possible_moves(@board).include? move.to
    when CastleMove
      false
    end
  end

  def execute move
    case move
    when StandardMove
      @board[move.to] = @board[move.from]
      @board[move.from] = nil
    end
    @history.push move
  end

  def over?
    false
  end
end
