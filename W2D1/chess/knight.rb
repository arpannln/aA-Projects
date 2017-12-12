require_relative 'stepable'
require_relative 'piece'

class Knight < Piece
  attr_reader :direction, :pos, :color

  def initialize(color, pos)
    @direction = "knight"
    super
  end

  include Stepable

  def to_s
    " N "
  end

  def moves(pos, direction)
    super
  end



end
