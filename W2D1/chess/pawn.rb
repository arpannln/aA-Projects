require 'piece'

class Pawn

  def initialize(color, pos)
    super
  end

  def symbol
    :Pawn
  end

  def moves
    result = []
    if forward_dir == "up"
      if at_start_row
        result << [pos[0]+1,pos[1]]
        result << [pos[0]+2,pos[1]]
      else
        result << [pos[0]+1,pos[1]]
      end
    else
      if at_start_row
        result << [pos[0]-1,pos[1]]
        result << [pos[0]-2,pos[1]]
      else
        result << [pos[0]-1,pos[1]]
      end
    end


    result
  end




  protected

  def at_start_row?
    pos[0] == 1 || pos[0] == 6
  end

  def forward_dir
    return "up" if color == "white"
    return "down" if color == "black"
  end

  def forward_steps

  end

  def side_attacks

  end

  def in_bounds?(pos)
    pos.none? { |el| el < 0 || el > 7 }
  end
end
