class MaxIntSet
  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    raise "Out of bounds" if !is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    num < @store.length && num > 0
  end

  def validate!(num)

  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num%20] << num
  end

  def remove(num)
    @store[num%20].delete(num)
  end

  def include?(num)
    @store[num%20].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if num == num_buckets
    @count += 1 if !include?(num)
    @store[num % num_buckets] << num
  end

  def remove(num)
    return @store if !include?(num)
    @store[num % num_buckets].delete(num)
    @count -= 1
  end

  def include?(num)
    @store[num % num_buckets]
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store = @store + Array.new(num_buckets) { Array.new }
  end
end
