class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    boss.add_empolyee(self) unless @boss == nil
  end


  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss)#(info = [])
    # @info
    super
    @info = []
  end

  def add_empolyee(person)
    @info << person
  end

  def bonus(multi)
    total_sub * multi
  end

  def total_sub
    total = 0
    @info.each do |person|
      if person.is_a?(Manager)
        total += person.salary + person.total_sub
      else
        total += person.salary
      end
    end
    total
  end

end

# a = Manager.new("ned", "founder", 1000000, nil)
# b = Manager.new("Darren", "Ta manager", 78000, a)
# c = Employee.new("shawna", "ta", 12000, b)
# d = Employee.new("david", "ta", 10000, b)
