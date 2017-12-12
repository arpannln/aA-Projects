require_relative 'slideable'
require_relative 'piece'

class Rook < Piece
  attr_reader :direction, :pos, :color

  def initialize(color, pos)
    @direction = "straight"
    super
  end

  include Slideable

  def to_s
    " R "
  end

  def moves(pos, direction)
    super
  end



end
