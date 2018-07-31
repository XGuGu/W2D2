require "colorize"
require_relative "board"
require_relative "cursor"

class Display

  attr_reader :board, :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def build_grid
    @board.grid.map.with_index do |row,i|
      row.map.with_index do |piece,j|
        color = colors_for(i,j)
        piece.symbol.colorize(color)
      end
    end
  end

  def colors_for(i,j)
    if @cursor.cursor_pos == [i,j] && @cursor.selected
      bg = :red
    elsif @cursor.cursor_pos == [i,j]
      bg = :blue
    elsif (i + j).odd?
      bg = :yellow
    else
      bg = :brown
    end
     {background: bg}
  end

  def test(cursor)
    while true#cursor.cursor_pos == :ctrl_c
      system("clear")
      render
      cursor.get_input
      # render
    end
  end


  def render
      build_grid.each { |row| puts row.join("")}

  end


end


a = Board.new
b = Display.new(a)
b.render
