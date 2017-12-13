require_relative 'piece'

class Pawn < Piece

  attr_reader :color
  attr_accessor :pos

  def initialize(color, pos, board)
    super
  end

  def symbol
    :Pawn
  end

  def to_s
    " \u265f "
  end

  def moves
    side_attacks + forward_steps
  end



  protected

  def at_start_row?
    pos[0] == 1 && self.color != "white" || pos[0] == 6 && self.color != "black"
  end

  def forward_dir
    return "up" if color == "white"
    return "down" if color == "black"
  end

  def forward_steps
    result = []
    if forward_dir == "down"
      if at_start_row?
        result << [pos[0]+1,pos[1]]  if in_bounds?([pos[0]+1,pos[1]]) && board[[pos[0]+1,pos[1]]].is_a?(NullPiece)
        result << [pos[0]+2,pos[1]]  if in_bounds?([pos[0]+2,pos[1]]) && board[[pos[0]+2,pos[1]]].is_a?(NullPiece)
      else
        result << [pos[0]+1,pos[1]]  if in_bounds?([pos[0]+1,pos[1]]) && board[[pos[0]+1,pos[1]]].is_a?(NullPiece)
      end
    else
      if at_start_row?
        result << [pos[0]-1,pos[1]] if in_bounds?([pos[0]-1,pos[1]]) && board[[pos[0]-1,pos[1]]].is_a?(NullPiece)
        result << [pos[0]-2,pos[1]] if in_bounds?([pos[0]-2,pos[1]]) && board[[pos[0]-2,pos[1]]].is_a?(NullPiece)
      else
        result << [pos[0]-1,pos[1]] if in_bounds?([pos[0]-1,pos[1]]) && board[[pos[0]-1,pos[1]]].is_a?(NullPiece)
      end
    end
    result
  end

  def side_attacks
    result = []
    if forward_dir == "down"
      result << [pos[0]+1,pos[1]+1] if in_bounds?([pos[0]+1,pos[1]+1]) && self.color != board[[pos[0]+1,pos[1]+1]] && !board[[pos[0]+1,pos[1]+1]].is_a?(NullPiece)
      result << [pos[0]+1,pos[1]-1] if in_bounds?([pos[0]+1,pos[1]-1]) && self.color != board[[pos[0]+1,pos[1]-1]] && !board[[pos[0]+1,pos[1]-1]].is_a?(NullPiece)
    else
      result << [pos[0]-1,pos[1]+1] if in_bounds?([pos[0]-1,pos[1]+1]) && self.color != board[[pos[0]-1,pos[1]+1]] && !board[[pos[0]-1,pos[1]+1]].is_a?(NullPiece)
      result << [pos[0]-1,pos[1]-1] if in_bounds?([pos[0]-1,pos[1]-1]) && self.color != board[[pos[0]-1,pos[1]-1]] && !board[[pos[0]-1,pos[1]-1]].is_a?(NullPiece)
    end
    result
  end

  def in_bounds?(pos)
    pos.none? { |el| el < 0 || el > 7 }
  end
end
