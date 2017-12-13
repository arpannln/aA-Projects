require_relative 'slideable'
require_relative 'piece'

class Bishop < Piece
  attr_reader :direction, :color
  attr_accessor :pos

  def initialize(color, pos, board)
    @direction = "diagonal"
    super
  end

  include Slideable

  def symbol
    :Bishop
  end

  def to_s
    " \u2657 "
  end

  def moves
    super
  end



end
