class Hanoi
attr_reader :pile1, :pile2, :pile3, :win_pile

def initialize(discs)
  @pile1, @pile2, @pile3 = [], [], []
  @discs = discs

  (1..discs).each do |el|
    pile1.unshift(el)
  end

  @win_pile = pile1
end

def get_move
  puts "Enter from pile, to pile: (Eg: 1,2):"
  gets.chomp.split(",").map(&:to_i)
end

def play

  until won?
    # system("clear")
    render
    move = get_move
    make_move(move)
    render
  end
  p "You won!!"
end

def make_move(move)
  from = move[0]
  to = move[1]

  case from
  when 1
    from_tower = @pile1
  when 2
    from_tower = @pile2
  when 3
    from_tower = @pile3
  end

  case to
  when 1
    to_tower = @pile1
  when 2
    to_tower = @pile2
  when 3
    to_tower = @pile3
  end

  if valid_move?(from_tower, to_tower)

    disc = from_tower.pop
    to_tower << disc

  else
    p "Not a valid move!"
  end
end

def valid_move?(from, to)
  return false if from.empty?
  return false if to.length == @discs
  return true if to.empty?
  return false if from.last > to.last
  true
end

def won?
  return true if @pile2 == win_pile || @pile3 == win_pile
  false
end

def render
  p "Tower 1"
  @pile1.each do |el|
    p el
  end
  p "Tower 2"
  @pile2.each do |el|
    p el
  end
  p "Tower 3"
  @pile3.each do |el|
    p el
  end
end

end

#game = Hanoi.new(3)
#game.play
