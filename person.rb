class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand 1..1000
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services
    @age >= 18 || @parent_permission == true
  end

  def of_age?
    @age >= 18
  end
  private :of_age?
end
