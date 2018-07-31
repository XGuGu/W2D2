require 'Singleton'
require 'colorize'
require_relative 'module'
require_relative 'pieces/bishop'
require_relative 'pieces/king'
require_relative 'pieces/knight'
require_relative 'pieces/pawn'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'pieces/nullpiece'

class Piece
  attr_accessor :color, :board, :pos
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def is_valid?(pos)
    pos.all? { |coord| coord.between?(0,7) }
  end

  def move_into_check?(end_pos)

  end

end
