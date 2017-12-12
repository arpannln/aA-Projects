require_relative 'stepable'
require_relative 'piece'

class King < Piece
  attr_reader :direction, :pos, :color

  def initialize(color, pos)
    @direction = "both"
    super
  end

  include Stepable

  def to_s
    " K "
  end

  def moves(pos, direction)
    super
  end



end
