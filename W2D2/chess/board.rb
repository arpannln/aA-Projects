require_relative 'nullpiece'

require_relative 'rook'
require_relative 'queen'
require_relative 'knight'
require_relative 'king'
require_relative 'pawn'
require_relative 'bishop'


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



  def move_piece(from_pos, to_pos)
    self[to_pos], self[from_pos] = self[from_pos], self[to_pos]
    self[to_pos].pos = to_pos if !self[to_pos].is_a?(NullPiece)
  end

  def move_piece!(from_pos, to_pos)

  end

  def checkmate?

  end

  def deep_dup(grid) #returns a grid
    result = []
    grid.each do |el|
      if el.is_a?(Array)
        result << deep_dup(el)
      else
        result << el.dup unless el.is_a?(NullPiece)
        result << NullPiece.instance if el.is_a?(NullPiece)
      end
    end
    result
  end

  def in_bounds?(pos)
    pos.none? { |el| el < 0 || el > 7 }
  end

  def in_check?(color)
    king_pos = find_king(color)

    (0..7).each do |x|
      (0..7).each do |y|
        return true if self[[x,y]].color != color && self[[x,y]].moves.include?(king_pos)
      end
    end
    false
  end

  protected

  def find_king(color)
    (0..7).each do |x|
      (0..7).each do |y|
        return [x,y] if self[[x,y]].is_a?(King) && self[[x,y]].color == color
      end
    end

    nil
  end

  def make_starting_grid
    @grid = Array.new(8) {Array.new(8)}



    (0..7).each do |y|
      @grid[1][y] = Pawn.new("black", [1, y], self)
    end

    (0..7).each do |y|
      @grid[6][y] = Pawn.new("white", [6, y], self)
    end

    @grid[0][0], @grid[0][7] = Rook.new("black",@grid[0][0], self), Rook.new("black", @grid[7][0], self)
    @grid[7][0], @grid[7][7] = Rook.new("white",@grid[7][0], self), Rook.new("white", @grid[7][7], self)

    @grid[0][1], @grid[0][6] = Knight.new("black",@grid[0][1], self), Knight.new("black", @grid[0][6], self)
    @grid[7][1], @grid[7][6] = Knight.new("white",@grid[7][1], self), Knight.new("white", @grid[7][6], self)

    @grid[0][2], @grid[0][5] = Bishop.new("black",@grid[0][2], self), Bishop.new("black", @grid[0][5], self)
    @grid[7][2], @grid[7][5] = Bishop.new("white",@grid[7][2], self), Bishop.new("white", @grid[7][5], self)

    @grid[0][4], @grid[7][4] = King.new("black",@grid[0][4], self), King.new("white", @grid[0][5], self)

    @grid[7][3], @grid[0][3] = Queen.new("white",@grid[7][3], self), Queen.new("black", @grid[0][3], self)

    (2..5).each do |x|
      (0..7).each do |y|
        @grid[x][y] = NullPiece.instance
      end
    end





  end

end
