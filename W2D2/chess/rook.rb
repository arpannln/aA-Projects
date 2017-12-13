require_relative 'slideable'
require_relative 'piece'
require_relative 'board'
require 'byebug'

class Rook < Piece
  attr_reader :direction, :color, :board
  attr_accessor :pos

  def initialize(color, pos, board)
    @direction = "straight"
    super
  end

  include Slideable

  def symbol
    :Rook
  end

  def to_s
    " \u2656 "
  end


  def moves
    super
  end



end
