require_relative("piece.rb")

class NoStartPosError < StandardError; end
class InvalidEndPosError < StandardError; end

class Board
  attr_reader :grid

  def default_grid
    Array.new(8) {Array.new(8)}
  end

  def initialize(grid = default_grid)
    @grid = grid
  end

  def populate
    grid.each_with_index do |row,i|
      next if i == 3
      next if i == 4
      next if i == 5
      next if i == 2
      row.each_with_index do |col,j|
        grid[i][j] = Piece.new([i,j])
      end
    end
    grid
  end

  def move_piece(start_pos, end_pos)
    begin
      piece = @grid[start_pos[0]][start_pos[1]]
    rescue NoStartPosError
      puts "Please pick a start position that has a piece"
      retry
    end
    new_row = end_pos[0]
    new_col = end_pos[1]
    @grid[new_row][new_col] = piece
    piece.pos = end_pos
    @grid[start_pos[0]][start_pos[1]] = nil
  end

  def get_starting_pos()

  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end
end