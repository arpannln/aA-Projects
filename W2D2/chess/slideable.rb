require 'byebug'

module Slideable

  def in_bounds?(pos)
    pos.none? { |el| el < 0 || el > 7 }
  end

  def moves
    result = []
    case direction
    when "diagonal"
      result = diagonal(pos)
    when "straight"
      result = straight(pos)
    when "both"
      result = diagonal(pos) + straight(pos)
    end
  end

  protected

  def diagonal(pos)
    result = []
    x = pos[0]
    y = pos[1]
    (1..7).each do |idx|
      break if !in_bounds?([x+idx, y+idx]) || self.color == board[[x+idx, y+idx]].color
      result << [x+idx, y+idx]
      break if self.color != board[[x+idx, y+idx]].color && !board[[x+idx, y+idx]].is_a?(NullPiece)
    end
    (1..7).each do |idx|
      break if !in_bounds?([x-idx, y-idx]) || self.color == board[[x-idx, y-idx]].color
      result << [x-idx, y-idx]
      break if self.color != board[[x-idx, y-idx]].color && !board[[x-idx, y-idx]].is_a?(NullPiece)
    end
    (1..7).each do |idx|
      break if !in_bounds?([x+idx, y-idx]) || self.color == board[[x+idx, y-idx]].color
      result << [x+idx, y-idx]
      break if self.color != board[[x+idx, y-idx]].color && !board[[x+idx, y-idx]].is_a?(NullPiece)
    end
    (1..7).each do |idx|
      break if !in_bounds?([x-idx, y+idx]) || self.color == board[[x-idx, y+idx]].color
      result << [x-idx, y+idx]
      break if self.color != board[[x-idx, y+idx]].color && !board[[x-idx, y+idx]].is_a?(NullPiece)
    end
    result.delete(pos)
    result
  end

  def straight(pos)
    
    result = []
    x = pos[0]
    y = pos[1]
    # debugger
    (1..7).each do |idx|
      break if !in_bounds?([x+idx, y]) || self.color == board[[x+idx, y]].color
      result << [x+idx, y]
      break if self.color != board[[x+idx, y]].color && !board[[x+idx, y]].is_a?(NullPiece)
    end
    (1..7).each do |idx|
      break if !in_bounds?([x-idx, y]) || self.color == board[[x-idx, y]].color
      result << [x-idx, y]
      break if self.color != board[[x-idx, y]].color && !board[[x-idx, y]].is_a?(NullPiece)
    end
    (1..7).each do |idx|
      break if !in_bounds?([x, y+idx]) || self.color == board[[x, y+idx]].color
      result << [x, y+idx]
      break if self.color != board[[x, y+idx]].color && !board[[x, y+idx]].is_a?(NullPiece)
    end
    (1..7).each do |idx|
      break if !in_bounds?([x, y-idx]) || self.color == board[[x, y-idx]].color
      result << [x, y-idx]
      break if self.color != board[[x, y-idx]].color && !board[[x, y-idx]].is_a?(NullPiece)
    end

    result.delete(pos)
    result
  end

  def check_collision(moves)
    moves.each do |pos|

    end
  end

end
