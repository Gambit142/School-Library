class PeopleOptions
  attr_reader :person_array
  def initialize
    @person_array = []
  end

  def create_student(age, name, permission)
    student = Student.new(age, name, parent_permission: permission)
    @person_array.push({
                          output: "[Student] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}",
                          object: student
                        })
    puts 'Person created successfully!'
    puts "\n"
  end

  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, name, specialization)
      @person_array.push({
                           output: "[Teacher] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}",
                           object: teacher
                         })
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
      puts person[:output]
    end
  end
end
