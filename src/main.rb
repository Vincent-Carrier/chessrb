require_relative 'cli_game'
require_relative 'move'

game = CLIGame.new
until game.over?
  color = game.active_player.to_s.capitalize
  print "It's #{color}'s turn to play: "
  move = game.parse gets
  require 'pry'; binding.pry
  if move
    if game.legal? move
      game.execute move
      puts game.board
    else
      puts 'Not a legal move'
    end
  else
    case answer
    when 'undo'
      @history.pop
    else
      puts 'A helpful help message'
    end
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
