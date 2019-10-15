require_relative 'game'
require_relative 'move'
require_relative 'board'

class CLIGame < Game
  SQ = /([a-h][1-8])/.freeze

  def parse str
    case str
    when /#{SQ}-#{SQ}/ then StandardMove.new(Sq($1), Sq($2))
    when /([KQRBN])#{SQ}/ then large_piece_move Sq($1), Sq($2)
    when /#{SQ}/ then pawn_move Sq($1)
    when /O-O/ then CastleMove.new :king
    when /O-O-O/ then CastleMove.new :queen
    end
  end

  def large_piece_move char, sq
    type = case char
           when 'K' then King
           when 'Q' then Queen
           when 'R' then Rook
           when 'B' then Bishop
           when 'N' then Knight
           end
    candidates = board.each_piece(active_player).find_all { |p| p.is_a? type }
    return StandardMove.new(candidates.first.sq, sq) if candidates.size == 1

    require 'pry'; binding.pry
    candidates.filter { |p| p.possible_moves(board).include? sq }
    return StandardMove.new(candidates.first.sq, sq) if candidates.size == 1

    AmbiguousMove.new
  end

  def execute! str
    execute(parse(str))
  end
end
