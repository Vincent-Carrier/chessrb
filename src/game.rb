class Game
  attr_reader :board, :history

  def initialize board, history
    @board = board
    @history = history
  end

  def self.new_game
    Game.new(Board.starting_position, [])
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

if $PROGRAM_NAME == __FILE__
  game = Game.new
  until game.over?
    color = game.active_player.to_s.capitalize
    answer = gets "It's #{color}'s turn to play: "
    case answer
    when Move.VALID_REGEX then move = Move.parse answer
    when 'undo'
      @history.pop
      next
    else
      puts 'A helpful help message'
      next
    end
    if game.legal? move
      game.execute move
    else
      puts 'Not a legal move'
    end
  end

  case game.outcome
  when :white
    puts 'White wins!'
  when :black
    puts 'Black takes the game!'
  when :tie
    puts "It's a tie!"
  end
end
