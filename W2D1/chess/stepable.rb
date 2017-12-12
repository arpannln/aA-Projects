module Stepable
  def in_bounds?(pos)
    pos.none? { |el| el < 0 || el > 7 }
  end

  def moves(start_pos, directions)
    case directions
    when "knight"
      knight(start_pos)
    when "both"
      diagonal(start_pos) + straight(start_pos)
    end
  end


  protected

  def diagonal(pos)
    result = []
    x = pos[0]
    y = pos[1]

    result << [x+1, y+1] if in_bounds?([x+1, y+1])
    result << [x-1, y-1] if in_bounds?([x-1, y-1])
    result << [x+1, y-1] if in_bounds?([x+1, y-1])
    result << [x-1, y+1] if in_bounds?([x-1, y+1])

    result.delete(pos)
    result
  end

  def straight(pos)
    result = []

    result << [pos[0], pos[1]+1] if in_bounds?([pos[0], pos[1]+1])
    result << [pos[0]+1, pos[1]] if in_bounds?([pos[0]+1, pos[1]])
    result << [pos[0]-1, pos[1]] if in_bounds?([pos[0]-1, pos[1]])
    result << [pos[0], pos[1]-1] if in_bounds?([pos[0], pos[1]-1])


    result.delete(pos)
    result
  end

  def knight(pos)
    result = []
    
    result << [pos[0]+2,pos[1]+1] if in_bounds?([pos[0]+2,pos[1]+1])
    result << [pos[0]+2,pos[1]-1] if in_bounds?([pos[0]+2,pos[1]-1])
    result << [pos[0]-2,pos[1]+1] if in_bounds?([pos[0]-2,pos[1]+1])
    result << [pos[0]-2,pos[1]-1] if in_bounds?([pos[0]-2,pos[1]-1])
    result << [pos[0]+1,pos[1]+2] if in_bounds?([pos[0]+1,pos[1]+2])
    result << [pos[0]+1,pos[1]-2] if in_bounds?([pos[0]+1,pos[1]-2])
    result << [pos[0]-1,pos[1]+2] if in_bounds?([pos[0]-1,pos[1]+2])
    result << [pos[0]-1,pos[1]-2] if in_bounds?([pos[0]-1,pos[1]-2])

    result
  end




end
