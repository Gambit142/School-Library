require './person'
require './book'
require './teacher'
require './rental'
require './student'

class OptionMethods
  def initialize
    @person_array = []
    @books = []
    @rental_array = []
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
      student = Student.new(user_age, user_name, parent_permission: user_permission)
      @person_array.push({
                           output: "[Student] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}",
                           object: student
                         })
      puts 'Person created successfully!'
      puts "\n"
    when 2
      print 'Age: '
      user_age = Integer(gets.chomp)

      print 'Name: '
      user_name = gets.chomp

      print 'Specialization: '
      user_specialization = gets.chomp
      teacher = Teacher.new(user_age, user_name, user_specialization)
      @person_array.push({
                           output: "[Teacher] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}",
                           object: teacher
                         })
      puts 'Person created successfully!'
      puts "\n"
    else
      puts 'Person not created.'
    end
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp
    puts 'Book created successfully!'

    book = Book.new(book_title, book_author)
    @books.push({
                  output: "Title: #{book.title}, Author: #{book.author}",
                  object: book
                })
  end

  def book_list
    @books.each do |book|
      puts book[:output]
    end
  end

  def people_list
    @person_array.each do |person|
      puts person[:output]
    end
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    @books.each_with_index do |book, index|
      puts "#{index}) #{book[:output]}"
    end
    book_selected = Integer(gets.chomp)
    book_chosen = @books[book_selected][:object]

    puts 'Select a person from the following list by number (not id): '
    @person_array.each_with_index do |person, index|
      puts "#{index}) #{person[:output]}"
    end
    person_selected = Integer(gets.chomp)
    person_chosen = @person_array[person_selected][:object]

    print 'Date: '
    rental_date = gets.chomp

    @rental_array.push(Rental.new(rental_date, book_chosen, person_chosen))

    puts 'Rental created successfully!'
  end

  def rental_list
    print 'ID of person: '
    person_id = Integer(gets.chomp)
    puts 'Rental: '

    @rental_array.each do |rental|
      if person_id == rental.person.id
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      else
        puts 'ID does not exist'
      end
    end
  end
end

class ListOptions
  def self.question_page
    puts 'Welcome to the OOP School Library App!'
    puts "\n"
    puts 'Please choose an option by entering a number: '
    option1 = '1 - List all books'
    option2 = '2 - List all people'
    option3 = '3 - Create a person'
    option4 = '4 - Create a book'
    option5 = '5 - Create a rental'
    option6 = '6 - List all rentals for a given person id'
    option7 = '7 - Exit'

    questions_array = [
      option1, option2, option3, option4, option5, option6, option7
    ]

    questions_array.each { |question| puts question }
    Integer(gets.chomp)
  end

  option_method = OptionMethods.new

  loop do
    case question_page
    when 1
      option_method.book_list
    when 2
      option_method.people_list
    when 3
      option_method.create_person
    when 4
      option_method.create_book
    when 5
      option_method.create_rental
    when 6
      option_method.rental_list
    when 7
      puts 'Thank you for using the app!'
      exit
    else
      puts 'Choose a number between 1 to 7'
      exit
    end
  end
end

def main
  ListOptions.new
end

main
