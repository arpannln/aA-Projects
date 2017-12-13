require_relative 'stepable'
require_relative 'piece'

class Knight < Piece
  attr_reader :direction, :color
  attr_accessor :pos

  def initialize(color, pos, board)
    @direction = "knight"
    super
  end

  include Stepable

  def symbol
    :Knight
  end

  def to_s
    " \u2658 "
  end

  def moves
    super
  end



end
