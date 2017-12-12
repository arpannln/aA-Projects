require_relative 'nullpiece'
require_relative 'piece'
require_relative 'rook'
class Board

  attr_accessor :grid

  def initialize
    @grid
    make_starting_grid
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def dup

  end

  def move_piece(color, from_pos, to_pos)
    self[to_pos] = self[from_pos]
    self[from_pos] = NullPiece.new
  end

  def move_piece!(from_pos, to_pos)

  end

  def checkmate?

  end

  def in_bounds?(pos)
    pos.none? { |el| el < 0 || el > 7 }
  end

  protected

  def find_king(color)

  end

  def make_starting_grid
    @grid = Array.new(8) {Array.new(8)}
    (0..1).each do |x|  #set black pieces on top
      (0..7).each do |y|
        @grid[x][y] = Rook.new("black", [x, y])
      end
    end

    (2..5).each do |x|
      (0..7).each do |y|
        @grid[x][y] = NullPiece.new
      end
    end

    (6..7).each do |x|  #set black pieces on top
      (0..7).each do |y|
        @grid[x][y] = Piece.new("white", [x, y])
      end
    end


  end

end
