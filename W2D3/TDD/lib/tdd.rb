def remove_dup(array)

  array.uniq
end

def two_sum(array)
  sum = []

  (0...array.length-1).each do |idx1|
    (idx1+1..array.length-1).each do |idx2|
      sum << [idx1, idx2] if array[idx1] + array[idx2] ==0
    end
  end
  sum
end

def my_transpose(arr)
  (0...arr.length).each do |x|
    (x+1...arr.length).each do |y|
      arr[x][y], arr[y][x] = arr[y][x], arr[x][y]
    end
  end
  arr
end

def stock_picker(arr)
  max_profit = 0
  max_diff_bought = 0
  max_diff_sell = 0

  (0..arr.length-1).each do |bought_day|
    (bought_day+1..arr.length-1).each do |sell_day|
      profit =  arr[sell_day] - arr[bought_day]
      if profit > max_profit
        max_profit = profit
        max_diff_bought = bought_day
        max_diff_sell = sell_day
      end
    end
  end
  [max_diff_bought,max_diff_sell]
end
