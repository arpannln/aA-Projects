class Piece
  # CONVERSION = {:Knight => " N ",
  #               :King => " K " ,
  #               :Queen => " Q " ,
  #               :NullPiece => " _ "
  #
  #
  #
  #
  #
  #
                    # }
  attr_reader :direction, :color, :board
  attr_accessor :pos

  def initialize(color, pos, board)
    @board = board
    @color = color
    @pos = pos
  end

  def to_s

  end

  def empty?

  end

  def symbol

  end

  def valid_moves

    total = @board[pos].moves

    result = []
    total.each do |el|

      result << el if !@board[el].is_a?(NullPiece) && !move_into_check?(el)

    end

    result
  end


  def move_into_check?(to_pos)
    # fake_grid = @board.deep_dup(board.grid)
    # fake = Board.new
    # fake.grid = fake_grid
    #
    # fake.
    old_pos = pos
    board.move_piece(old_pos, to_pos)
    bool = board.in_check?(color) #checks if player is in check
    board.move_piece(to_pos, old_pos)
    return bool
  end


end
