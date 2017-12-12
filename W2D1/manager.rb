require_relative 'employee'
require 'byebug'
class Manager < Employee

  attr_accessor :employees

  def initialize(name, salary, title, boss)
    super
    @employees = []

  end

  def employeeSum
    sum = 0
    employees.each do |el|
      if el.is_a?(Manager)
        sum += el.salary + el.employeeSum
      else
        sum += el.salary
      end
    end
    sum
  end

  def bonus(multiplier)

   employeeSum * multiplier
  end



end

if __FILE__ == $0
  ned = Manager.new("Ned",1000000,"Founder",nil)
  darren = Manager.new("Darren",78000,"TA Manager", ned)
  shawna = Employee.new("Shawna",12000,"TA",darren)
  david = Employee.new("David",10000,"TA",darren)

  p ned.bonus(5) # => 500_000
  p darren.bonus(4) # => 88_000
  p david.bonus(3)

end
