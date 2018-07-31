
class King < Piece
  include SteppingPiece
  def symbol
    "  #{  :K} ".colorize(color)
  end

  def moves
    result = []
    possible_pos = MOVES[0..7]

    possible_pos.each_with_index do |move, i|
      new_pos = [self.pos[0] + move[0]] + [self.pos[1] + move[1]]
      if is_valid?(new_pos)
        result << new_pos
      end
    end
    result
  end
end
