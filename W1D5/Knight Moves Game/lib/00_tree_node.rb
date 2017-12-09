require 'byebug'
class PolyTreeNode
  attr_reader :value, :children, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []

  end

  def parent= (new_parent = nil)
    if new_parent != nil
      @parent.children.delete(self) unless parent == nil
      @parent = new_parent
      @parent.children << self unless @parent.children.include?(self)
    else
      # debugger
      @parent.children.delete(self)
      @parent = new_parent
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child)
    raise "Node is not child" if !self.children.include?(child)
    self.children.delete(child)
    child.parent = nil
  end

  def dfs(target)
    return self if self.value == target
    self.children.each do |child|
      potential_target = child.dfs(target)
      return potential_target if potential_target != nil
    end
    return nil
  end

  def bfs(target)
    array = []
    array << self
    until array.empty?
      return array[0] if array[0].value == target
      array += array[0].children unless array[0] == nil
      array.shift
    end
    return nil
  end

end
