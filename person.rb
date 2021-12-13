class Person
  def initialize(name = "Unknown", age, parent_permission = true)
    @id = rand 1..1000
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  attr_reader :id
  attr_accessor :name, :age

  def can_use_services
    @age >= 18 || @parent_permission == true
  end
  
  def is_of_age 
    @age >= 18
  end
  private :is_of_age
end
