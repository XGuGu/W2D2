
class Queen < Piece
  include SlidingPiece
  def symbol
    "  #{  :Q} ".colorize(color)
  end

  def move_dirs
    MOVES
  end

  def moves
    result = []
    possible_pos = []
    move_dirs.each do |dir|
      # [dir[0] * 2, dir[1] * 2]
      i = 1
      while i < 8
        possible_pos << [dir[0] * i, dir[1] * i]
        i += 1
      end
    end
    possible_pos

    possible_pos.each_with_index do |move, i|
      new_pos = [self.pos[0] + move[0]] + [self.pos[1] + move[1]]
      if is_valid?(new_pos)
        result << new_pos
      end
    end
    result
  end

end
