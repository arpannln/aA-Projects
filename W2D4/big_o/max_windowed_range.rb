def naive(arr, win_size)
  largest_diff = 0

  (0..(arr.length - win_size)).each do |idx1|

      windowed = arr[idx1..idx1+ win_size - 1]
      p windowed
      range = windowed.max - windowed.min
      largest_diff = range if largest_diff < range
  end

  largest_diff
end

p naive( [1, 2, 3, 5], 3)
