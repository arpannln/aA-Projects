class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next, @head.prev = @tail, @tail
    @tail.next, @tail.prev = @head, @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return nil if empty?
    @head.next
  end

  def last
    return nil if empty?
    @tail.prev
  end

  def empty?
   @head.next == @tail
  end

  def get(key)
    root = @head
    while root != @tail
      root = root.next
      return root.val if root.key == key
    end
    nil
  end

  def include?(key)
    root = @head
    while root != @tail
      root = root.next
      return true if root.key == key
    end
    false
  end

  def append(key, val)
    if include?(key)
      update(key,val)
      true 
    else
      prev_node = @tail.prev
      @tail.prev = Node.new(key,val)
      @tail.prev.next = @tail
      @tail.prev.prev = prev_node
      prev_node.next = @tail.prev
      false
    end
  end

  def update(key, val)
    root = @head
    while root != @tail
      root = root.next
      root.val = val if root.key == key
    end
  end

  def remove(key)
    root = @head
    removal_node = nil
    while root != @tail
      root = root.next
      if root.key == key
        removal_node = root
        break
      else
        removal_node = nil
      end
    end

    return nil if removal_node == nil

    removal_node.prev.next = removal_node.next
    removal_node.next.prev = removal_node.prev
       # removal_node.next.prev
    # removal_node.prev.next

    removal_node.val = nil

  end

  def each(&prc)
    root = @head
    while root != @tail
      root = root.next
      prc.call(root) unless root == @tail
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
