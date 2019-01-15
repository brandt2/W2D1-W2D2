require 'singleton'

class Piece
  attr_writer :pos
 
  def initialize
    # @pos = pos
  end

  def inspect
    "#{self.class}"
  end
end

class NullPiece < Piece
  include Singleton
end