class Employee
  attr_reader :name, :title, :salary, :boss
  
  def initialize(name ,title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = (salary) * multiplier
  end
end

class Manager < Employee
  attr_reader :subordinates
  
  def initialize(name, title, salary, boss, subordinates)
    super(name, title, salary, boss)
    @subordinates = subordinates
  end

  def add_subordinates_salary
    total_salary = 0
    @subordinates.each do |employee|
      total_salary += employee.salary
    end  
    total_salary
  end

  def bonus(multiplier)
    add_subordinates_salary * multiplier
  end
end