require_relative('board.rb')
require 'colorize'
require_relative ('cursor.rb')

class Display
  attr_reader :board, :cursor

  def initialize(board)
    
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    puts "0 1 2 3 4 5 6 7"
    rows
  end

  def display_loop
    5.times do 
      render
      @cursor.get_input
      puts "#{@cursor.cursor_pos}".blue
      render
    end
  end

  def rows
    board.grid.map.with_index do |row, idx|
      p "#{idx} #{row}"
    end
  end

  # def inspect
  #   ""
  # end

end