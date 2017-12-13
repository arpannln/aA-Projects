module Stepable
  def in_bounds?(pos)
    pos.none? { |el| el < 0 || el > 7 }
  end

  def moves
    case direction
    when "knight"
      knight(pos)
    when "both"
      diagonal(pos) + straight(pos)
    end
  end


  protected

  def diagonal(pos)
    result = []
    x = pos[0]
    y = pos[1]

    result << [x+1, y+1] if in_bounds?([x+1, y+1]) && self.color != board[[x+1, y+1]].color
    result << [x-1, y-1] if in_bounds?([x-1, y-1]) && self.color != board[[x-1, y-1]].color
    result << [x+1, y-1] if in_bounds?([x+1, y-1]) && self.color != board[[x+1, y-1]].color
    result << [x-1, y+1] if in_bounds?([x-1, y+1]) && self.color != board[[x-1, y+1]].color

    result.delete(pos)
    result
  end

  def straight(pos)
    result = []
    x = pos[0]
    y = pos[1]

    result << [x+1, y] if in_bounds?([x+1, y]) && self.color != board[[x+1, y]].color
    result << [x-1, y] if in_bounds?([x-1, y]) && self.color != board[[x-1, y]].color
    result << [x, y-1] if in_bounds?([x, y-1]) && self.color != board[[x, y-1]].color
    result << [x, y+1] if in_bounds?([x, y+1]) && self.color != board[[x, y+1]].color

    result.delete(pos)
    result
  end

  def knight(pos)
    result = []
    x = pos[0]
    y = pos[1]

    result << [x+2,y+1] if in_bounds?([x+2,y+1])  && self.color != board[[x+2, y+1]].color
    result << [x+2,y-1] if in_bounds?([x+2,y-1])  && self.color != board[[x+2, y-1]].color
    result << [x-2,y+1] if in_bounds?([x-2,y+1])  && self.color != board[[x-2, y+1]].color
    result << [x-2,y-1] if in_bounds?([x-2,y-1])  && self.color != board[[x-2, y-1]].color
    result << [x+1,y+2] if in_bounds?([x+1,y+2])  && self.color != board[[x+1, y+2]].color
    result << [x+1,y-2] if in_bounds?([x+1,y-2])  && self.color != board[[x+1, y-2]].color
    result << [x-1,y+2] if in_bounds?([x-1,y+2])  && self.color != board[[x-1, y+2]].color
    result << [x-1,y-2] if in_bounds?([x-1,y-2])  && self.color != board[[x-1, y-2]].color

    result
  end




end
