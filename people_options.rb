require 'json'

class PeopleOptions
  attr_reader :person_array

  def initialize
    @person_array = []

    return unless File.exist?('./json/person.json')

    file = File.read('./json/person.json')
    file_data = JSON.parse(file)
    file_data.each do |person|
      if person['specialization']
        @person_array.push(Teacher.new(person['age'], person['name'], person['specialization'], id: person['id']))
      else
        @person_array.push(Student.new(person['age'], person['name'], id: person['id'],
                                                                      parent_permission: person['parent_permission']))
      end
    end
  end

  def save_data
    File.write('./json/person.json', JSON.dump(@person_array))
  end

  def create_student(age, name, permission)
    student = Student.new(age, name, parent_permission: permission)
    @person_array.push(student)
    save_data
    puts 'Person created successfully!'
    puts "\n"
  end

  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, name, specialization)
    @person_array.push(teacher)
    save_data
    puts 'Person created successfully!'
    puts "\n"
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_option = Integer(gets.chomp)
    case person_option
    when 1
      print 'Age: '
      user_age = Integer(gets.chomp)

      print 'Name: '
      user_name = gets.chomp

      print 'Has parent permission? [Y/N]: '
      user_permission = gets.chomp.to_s.upcase

      case user_permission
      when 'Y'
        user_permission = true
      when 'N'
        user_permission = false
      end
      create_student(user_age, user_name, user_permission)

    when 2
      print 'Age: '
      user_age = Integer(gets.chomp)

      print 'Name: '
      user_name = gets.chomp

      print 'Specialization: '
      user_specialization = gets.chomp
      create_teacher(user_age, user_name, user_specialization)
    else
      puts 'Person not created.'
    end
  end

  def people_list
    @person_array.each do |person|
      puts person
    end
  end
end
