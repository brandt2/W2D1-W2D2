require_relative('board.rb')
require 'colorize'
require_relative ('cursor.rb')

CHESS_SQUARES = {
  Piece => "P",
  NullPiece => "N"
}

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    puts "   0 1 2 3 4 5 6 7"
    puts "------------------"
    rows
  end

  def display_loop
    while true 
      render
      @cursor.get_input
      puts "#{@cursor.cursor_pos}".blue
      render
    end
  end

  def rows
    board.grid.each_with_index do |row, i|
      puts "#{i}| #{cols(row)}\n"
    end
  end

  def cols(row)
    new_str = ""
    row.each_with_index do |ele, col|
      new_str << CHESS_SQUARES[ele.class]
      new_str << " " unless col == row.length
    end
    new_str
  end

end