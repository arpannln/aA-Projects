require_relative "00_tree_node.rb"

class KnightPathFinder

  def initialize(pos)
    @current_pos = pos
    @current_node = PolyTreeNode.new(pos)

    @visited_positions = [pos]
  end

  def find_path(pos)
    result = []
    result
  end

  def self.valid_moves(pos)
    x, y = pos
    return false if x > 7 || x < 0 || y > 7 || y < 0

  end

  def new_move_positions
    current_moves = self.class.valid_moves.select { |move| visited_positions.include?(move) }
    @visited_positions += current_moves
    return current_moves
  end

  def build_move_tree
    self.new_move_positions.each do |pos|
      PolyTreeNode.new(pos)
    end
  end

  private

  def self.valid_move?(pos)
    x, y = pos
    return false if x > 7 || x < 0 || y > 7 || y < 0
    true
  end

  def self.valid_moves(pos)

    movement = [[1,2], [2,1], [-1,2], [-1,-2], [-2,1], [2,-1], [-2, -1], [1, -2]]
    moves = movement.map do |el|
      [(pos[0]+el[0]), (pos[1]+el[1])]
    end

    moves.select {|ea| valid_move?(ea)}

  end

end

k = KnightPathFinder.new([2,3])
