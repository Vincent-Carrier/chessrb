class Game
  def initialize board, history
    @board = board
    @history = history
  end

  def self.new_game
    @board = Board.starting_position
    @history = []
  end

  def active_player
    @history.size.odd? ? :black : :white
  end

  def legal? move
    true
  end

  def execute move
    @history.push move
  end

  def over?
    false
  end
end

if __FILE__ == $0
  game = Game.new
  until game.over?
    color = game.active_player.to_s.capitalize
    answer = gets "It's #{color}'s turn to play: "
    case answer
    when /[a-h][1-8]/ then move = Move.parse answer
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
      puts "Not a legal move"
    end
  end

  case game.outcome
  when :white
    puts "White wins!"
  when :black
    puts "Black takes the game!"
  when :tie
    puts "It's a tie!"
  end
end
