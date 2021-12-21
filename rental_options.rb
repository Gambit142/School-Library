require './book_options.rb'
require './people_options.rb'

class RentalOptions
  attr_reader :books, :person_array
  def initialize
    @rental_array = []
  end

  def create_rental(books_array, person_array)
    puts 'Select a book from the following list by number: '
    books_array.each_with_index do |book, index|
      puts "#{index}) #{book[:output]}"
    end
    book_selected = Integer(gets.chomp)
    book_chosen = books_array[book_selected][:object]

    puts 'Select a person from the following list by number (not id): '
    person_array.each_with_index do |person, index|
      puts "#{index}) #{person[:output]}"
    end
    person_selected = Integer(gets.chomp)
    person_chosen = person_array[person_selected][:object]

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