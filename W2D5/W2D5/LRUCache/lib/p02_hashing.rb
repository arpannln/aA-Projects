class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 0 if self.flatten.empty?
    sum = 0
    each_with_index do |num, idx|
      sum += num if idx % 2 == 0
      sum -= num if idx % 2 == 1
    end
    sum
  end
end

class String
  def hash
    sum = 0
    idx = 0
    each_byte do |num|
      sum += num if idx % 2 == 0
      sum -= num if idx % 2 == 1
      idx += 1
    end
    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    each_value do |value|
      sum += value if value.is_a?(Integer)
      if value.is_a?(String)
        idx = 0
        value.each_byte do |num|
          sum += num if idx % 2 == 0
          sum -= num if idx % 2 == 1
          idx += 1
        end
      end
    end
    sum
  end
end
