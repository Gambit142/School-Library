require './person'

class Teacher < Person
  def initialize(age, name, specialization, id: nil, parent_permission: true)
    super(id, age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def to_s
    "[Teacher] Name: #{@name}, ID: #{@id}, Age: #{@age}"
  end

  def to_json(generator)
    generator.generate({
                         age: @age,
                         name: @name,
                         specialization: @specialization,
                         id: @id
                       })
  end

  def can_use_services
    true
  end
end
