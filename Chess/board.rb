require_relative("piece.rb")

class Board
  attr_reader :grid

  def default_grid
    Array.new(8) {Array.new(8){NullPiece.instance}}
  end

  def initialize(grid = default_grid)
    @grid = grid
    populate
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

  def populate
    grid.each_with_index do |row,i|
      next if i == 2
      next if i == 3
      next if i == 4
      next if i == 5
      if i == 0 || i ==1
        color = "white"
      elsif i == 6 || i == 7
        color = "black"
      end
      row.each_with_index do |col,j|
        grid[i][j] = Piece.new(color, self, [i,j])
      end
    end
    grid[5][5] = Rook.new("white", self, [5,5])
    grid
  end

  def move_piece(start_pos, end_pos)
    raise "Invalid start position" if self[start_pos].class == NullPiece
    raise "Invalid end position" if self[end_pos].class != NullPiece
    self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
  end

  # def valid_pos?(pos)
  #   raise "Invalid start position" if self[pos].class == NullPiece
  #   raise "Invalid end position" if self[pos].class != NullPiece
  # end
end