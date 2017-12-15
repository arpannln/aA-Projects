list = [ 0, 3, 5, 4, 5, 10, 1, 90, -5 ]

def my_min_slow(list)
  list.each_index do |idx1|
    list.each_index do |idx2|
      break if list[idx1] > list[idx2]
      return list[idx1] if idx2 == list.length - 1
    end
  end
end

p my_min_slow(list)  # =>  -5

def my_min_fast(list)
  min = list.first

  list.each do |el|
    min = el if el < min
  end
  min
end

p my_min_fast(list)

def largest_contiguous_subsum_slow(list)
  largest = list.first

  list.each_index do |idx1|
    list.each_index do |idx2|
      next if idx1 >= idx2
      sum = list[idx1..idx2].reduce(:+)
      largest = sum if sum > largest
    end
  end

  largest
end

list2 = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_slow(list2)


def largest_contiguous_subsum_fast(list)
  largest = list[0]
  current_largest = list[0]

  list.drop(1).each do |el1|
    current_largest = 0 if current_largest < 0
    current_largest += el1
    largest = current_largest if current_largest > largest
  end

  largest
end

list2 = [2, 3, -6, 7, -6, 7]

p largest_contiguous_subsum_fast(list2)
