require "colorize"
require_relative "board"
require_relative "cursor"

class Display

  attr_reader :board, :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end


  def render
      puts "  0  1  2  3  4  5  6  7 "
      @board.grid.each_with_index do |row,idx|
        str = "#{idx} "

        row.each do |ele|
          str += " #{ele.symbol} "
        end
        puts str
      end
  end


end


a = Board.new
b = Display.new(a)
b.render
