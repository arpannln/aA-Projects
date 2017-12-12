require_relative 'slideable'
require_relative 'piece'

class Queen < Piece
  attr_reader :direction, :pos, :color

  def initialize(color, pos)
    @direction = "both"
    super
  end

  include Slideable

  def to_s
    " Q "
  end

  def moves(pos, direction)
    super
  end



end
