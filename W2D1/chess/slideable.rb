module Slideable

def in_bounds?(pos)
  pos.none? { |el| el < 0 || el > 7 }
end

def moves(start_pos, directions)
  case directions
  when "diagonal"
    diagonal(start_pos)
  when "straight"
    straight(start_pos)
  when "both"
    diagonal(start_pos) + straight(start_pos)
  end
end

protected

def diagonal(pos)
  result = []
  x = pos[0]
  y = pos[1]
  (0..7).each do |idx|
    result << [x+idx, y+idx] if in_bounds?([x+idx, y+idx])
    result << [x-idx, y-idx] if in_bounds?([x-idx, y-idx])
    result << [x+idx, y-idx] if in_bounds?([x+idx, y-idx])
    result << [x-idx, y+idx] if in_bounds?([x-idx, y+idx])
  end
  result.delete(pos)
  result
end

def straight(pos)
  result = []
  (0..7).each do |idx|
    result << [pos[0], idx]
    result << [idx, pos[1]]
  end

  result.delete(pos)
  result
end

end
