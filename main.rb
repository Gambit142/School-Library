require './person'
require './book'
require './teacher'
require './rental'
require './student'
require './people_options'
require './book_options'
require './rental_options'

puts 'Welcome to the OOP School Library App!'
class ListOptions
  def self.question_page
    Dir.mkdir'json' unless Dir.exist? 'json'
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

  people_options = PeopleOptions.new
  book_options = BookOptions.new
  rental_options = RentalOptions.new

  loop do
    case question_page
    when 1
      book_options.book_list
    when 2
      people_options.people_list
    when 3
      people_options.create_person
    when 4
      book_options.create_book
    when 5
      rental_options.create_rental(book_options.books, people_options.person_array)
    when 6
      rental_options.rental_list
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
