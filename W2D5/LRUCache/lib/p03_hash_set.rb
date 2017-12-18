require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    resize! if count == num_buckets
    @store[key.hash.abs % num_buckets] << key
    @count += 1
    true
  end

  def include?(key)
    @store[key.hash.abs % num_buckets].include?(key)
  end

  def remove(key)
    return nil if !include?(key)
    @store[key.hash.abs % num_buckets].delete(key)
    @count -= 1
  end

  private

  def bucket(key)
    return [key.hash.abs % num_buckets]
  end

  def [](key)
    @store[key.hash.abs % num_buckets]# optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store = @store + Array.new(num_buckets) { Array.new }
  end
end
