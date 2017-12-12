require_relative 'slideable'
require_relative 'piece'

class Bishop < Piece
  attr_reader :direction, :pos, :color

  def initialize(color, pos)
    @direction = "diagonal"
    super
  end

  include Slideable

  def to_s
    " B "
  end

  def moves(pos, direction)
    super
  end



end
