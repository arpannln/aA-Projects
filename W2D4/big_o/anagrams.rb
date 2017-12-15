
def anagram_slow?(string1, string2)
  combos = string1.chars.permutation(string1.length)
  array = combos.map {|el| el.join("")}
  array.each do |word|
    return true if word == string2
  end
  return false
end

p  anagram_slow?("gizmo", "sally")    #=> false
p anagram_slow?("elvis", "lives")    #=> true

def anagram_fast?(string1, string2)
  string1.chars.each do |char|
    string1.delete!(char)
    string2.delete!(char)
  end
  string1 == string2
end

p anagram_fast?("gizmo", "sally")    #=> false
p anagram_fast?("elvis", "lives")    #=> true


def anagram_faster?(string1, string2)
  string1.chars.sort == string2.chars.sort
end

p anagram_faster?("gizmo", "sally")    #=> false
p anagram_faster?("elvis", "lives")    #=> true

def anagram_fastest?(string1, string2)
  string1_hash = Hash.new(0)
  string2_hash = Hash.new(0)

  string1.chars.each do |ch|
    string1_hash[ch] += 1
  end

  string2.chars.each do |ch|
    string2_hash[ch] += 1
  end

  string1_hash == string2_hash
end

p anagram_fastest?("gizmo", "sally")    #=> false
p anagram_fastest?("elvis", "lives")    #=> true

def anagram_faster_fastest?(string1, string2)
  string1_hash = Hash.new(0)

  string1.chars.each do |ch|
    string1_hash[ch] += 1
  end

  string2.chars.each do |ch|
    string1_hash[ch] -= 1
  end

  string1_hash.values.all? {|el| el == 0}
end

p anagram_faster_fastest?("gizmo", "sally")    #=> false
p anagram_faster_fastest?("elvis", "lives")    #=> true
