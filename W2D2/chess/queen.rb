require_relative 'slideable'
require_relative 'piece'

class Queen < Piece
  attr_reader :direction, :color, :board
  attr_accessor :pos

  def initialize(color, pos, board)
    @direction = "both"
    super
  end

  include Slideable

  def symbol
    :Queen
  end

  def to_s
    " \u2655 "
  end

  def moves
    super
  end



end
