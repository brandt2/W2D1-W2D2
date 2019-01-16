require 'singleton'

class Piece
  attr_reader :color, :board
  attr_accessor :pos
 
  def initialize(color, board, pos)
    @pos = pos
    @color = color
    @board = board
  end

  def to_s
  end

  def valid_moves
  end

  def pos=(value)
  end

  def symbol
  end

  def inspect
    "#{self.class}"
  end

  private

  def move_into_check?(end_pos)
  end
end

module Slideable
  def horizontal_dirs
    i = 0
    8.times do 
      HORIZONTAL_DIRS << [self.pos[0],i]
      i += 1
    end
    i = 0
    8.times do 
      HORIZONTAL_DIRS << [i, self.pos[1]]
      i += 1
    end
    HORIZONTAL_DIRS.delete(self.pos)
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
  end

  private

  HORIZONTAL_DIRS = []
  DIAGONAL_DIRS = []
end

class Rook < Piece
  include Slideable
end

class Queen < Piece
  include Slideable
end

class Bishop < Piece
  include Slideable
end

class NullPiece < Piece
  include Singleton
  def initialize
  end
end