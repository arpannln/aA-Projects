
arr1 = [0, 1, 5, 7]

def two_sum_slow?(arr, target_sum)
  (0...arr.length-1).each do |idx1|
    (idx1+1..arr.length-1).each do |idx2|
      return true if arr[idx1] + arr[idx2] == target_sum
    end
  end
  false
end

p two_sum_slow?(arr1, 6)
p two_sum_slow?(arr1, 400)

def two_sum_faster?(arr, target_sum)
  sorted = arr.sort.select {|el| el <= target_sum}

  (0...sorted.length-1).each do |idx1|
    (idx1+1..sorted.length-1).each do |idx2|
      return true if sorted[idx1] + sorted[idx2] == target_sum
    end
  end

  false
end

p two_sum_faster?(arr1, 6)
p two_sum_faster?(arr1, 400)

def two_sum_fastest?(arr, target_sum)
  predictor = Hash.new
  arr.each do |num|
    return true if predictor.has_value?(num)
    predictor[num] = target_sum - num
  end

  return false
end

p two_sum_fastest?(arr1, 6)
p two_sum_fastest?(arr1, 400)
