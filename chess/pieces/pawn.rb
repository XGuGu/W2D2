class Pawn < Piece
  def symbol
    "  #{  :P} ".colorize(color)
  end

  def moves
    result = []
    possible_pos = [[1,0],[2,0]]

    possible_pos.each_with_index do |move, i|
      new_pos = [self.pos[0] + move[0]] + [self.pos[1] + move[1]]
      if is_valid?(new_pos)
        result << new_pos
      end
    end
    result
  end
end
