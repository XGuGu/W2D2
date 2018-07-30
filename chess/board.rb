require_relative 'piece'
require 'byebug'

class Board
  attr_reader :grid
  GRID = Array.new(8) { Array.new(8, NullPiece.instance) }
  def initialize(grid = GRID)
    @grid = grid
  end

  def move_piece(start_pos, end_pos)
    if valid_play?(end_pos) == false
      raise "No piece here"
    elsif self[start_pos].is_a?(NullPiece)
      raise "Out of board!"
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = NullPiece.instance
    end
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos,val)
    x,y = pos
    @grid[x][y] = val
  end

  def valid_play?(pos)
    pos.all? { |coord| coord.between?(0,7) }
  end


end

# a = Board.new
# a.move_piece([1,2], [2,1])
