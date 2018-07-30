require 'Singleton'
class Piece
  attr_accessor :symbol, :board, :pos
  def initialize(symbol, board, pos)
    @symbol = symbol
    @board = board
    @pos = pos
  end
end

class Rook < Piece

end

class NullPiece < Piece

  include Singleton
  def initialize
    @symbol = " "
  end

end
