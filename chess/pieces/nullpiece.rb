
class NullPiece < Piece
  attr_reader :symbol
  include Singleton
  def initialize
    @symbol = "    "
    @color = :none
  end

end
