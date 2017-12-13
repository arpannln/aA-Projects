require_relative 'piece'
require "singleton"

class NullPiece < Piece
  include Singleton

  attr_reader :color

  def initialize
    @color = "none"
  end

  def empty?

  end

  def symbol
    :NullPiece
  end

  def valid_moves

  end

  def to_s
    "   "
  end

  def moves
    []
  end

  private
  def move_into_check(to_pos)

  end
end
