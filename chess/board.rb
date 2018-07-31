require_relative 'piece'
require 'byebug'
# class Array
#   def deep_dup
#     result = []
#     self.map { |el| el.is_a?(Array) ? el.deep_dup : el}
#
#   end
# end


class Board
  attr_reader :grid
  GRID = Array.new(8) { Array.new(8, NullPiece.instance) }
  def initialize(grid = GRID)
    @grid = grid
    start_board
  end

  def deep_dup
    duped = Board.new
    arr = find_pieces(:white) + find_pieces(:black)

    arr.each do |piece|
      duped[piece.pos] = piece.class.new(piece.color,duped, piece.pos)
    end
    duped
  end

  def find_pieces(color)
    arr = []
    self.grid.each do |row|
      row.each do |piece|
        arr << piece if piece.color == color
      end
    end
    arr
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

  def start_board
    i = 0
    while i < grid.length
      j = 0
      while j < grid.length
        # debugger
        if i == 1
          self[[i, j]] = Pawn.new(:white, grid, [i, j])
        elsif i == 6
          self[[i, j]] = Pawn.new(:black, grid, [i, j])
        end
        j += 1
      end
      i += 1
    end

    self[[0,0]] = Rook.new(:white, grid, [0,0])
    self[[0,1]] = Knight.new(:white, grid, [0,1])
    self[[0,2]] = Bishop.new(:white, grid, [0,2])
    self[[0,3]] = Queen.new(:white, grid, [0,3])
    self[[0,4]] = King.new(:white, grid, [0,4])
    self[[0,5]] = Bishop.new(:white, grid, [0,5])
    self[[0,6]] = Knight.new(:white, grid, [0,6])
    self[[0,7]] = Rook.new(:white, grid, [0,7])


    self[[7,0]] = Rook.new(:black, grid, [7,0])
    self[[7,1]] = Knight.new(:black, grid, [7,1])
    self[[7,2]] = Bishop.new(:black, grid, [7,2])
    self[[7,3]] = Queen.new(:black, grid, [7,3])
    self[[7,4]] = King.new(:black, grid, [7,4])
    self[[7,5]] = Bishop.new(:black, grid, [7,5])
    self[[7,6]] = Knight.new(:black, grid, [7,6])
    self[[7,7]] = Rook.new(:black, grid, [7,7])
  end


  def in_check?(color)
    kings_pos = find_king(color)
    # opp_color == :white ? :black : :white
    i = 0
    while i < grid.length
      j = 0
      while j < grid.length
        if self[[i,j]].is_a?(NullPiece)
          j += 1
          next
        elsif self[[i,j]].color == color
          j += 1
          next
        end
      return true if poss_check_mate(kings_pos,self[[i,j]])
        j += 1
      end
      i += 1
    end
    false
  end

  def poss_check_mate(king_pos, piece)
    piece.moves.include?(king_pos)
  end

  def find_king(color)
    i = 0
    while i < grid.length
      j = 0
      while j < grid.length
        if self[[i,j]].is_a?(King) && self[[i,j]].color == color
          return [i,j]
        end
        j += 1
      end
      i += 1
    end

  end

  def check_mate?(color)

  end




end

p a = Board.new
p a.in_check?(:black)
# p a.move_piece([1,2], [2,1])
# p a
