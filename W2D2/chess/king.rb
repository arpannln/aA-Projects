require_relative 'stepable'
require_relative 'piece'

class King < Piece
  attr_reader :direction, :color
  attr_accessor :pos
  def initialize(color, pos, board)
    @direction = "both"
    super
  end

  include Stepable

  def symbol
    :King
  end

  def to_s
    " \u2654 "
  end

  def moves
    super
  end



end
