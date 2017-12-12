class Employee
attr_reader :name, :title, :salary, :boss

def initialize(name, salary, title, boss)
  @name, @title, @salary, @boss = name, title, salary, boss
  if boss
    boss.employees << self
  end
end

def bonus(multiplier)
  bonus = salary * multiplier
end
end
