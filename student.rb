require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, id: nil, classroom: 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def to_s
    "[Student] Name: #{@name}, ID: #{@id}, Age: #{@age}"
  end

  def to_json(generator)
    generator.generate({
                         age: @age,
                         name: @name,
                         parent_permission: @parent_permission,
                         id: @id
                       })
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    @classroom.students.push(self) unless @classroom.students.include?(self)
  end
end
