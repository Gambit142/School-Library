class RentalOptions
  def initialize
    @rental_array = []

    return unless File.exist?('./json/rental.json')

    file = File.read('./json/rental.json')
    file_data = JSON.parse(file)
    file_data.each do |rental|
      book = Book.new(rental['book']['title'], rental['book']['author'])
      person = if rental['person']['specialization']
                 Teacher.new(rental['person']['age'], rental['person']['name'], rental['person']['specialization'],
                             id: rental['person']['id'])
               else
                 Student.new(
                   rental['person']['age'],
                   rental['person']['name'],
                   id: rental['person']['id'],
                   parent_permission: rental['person']['parent_permission']
                 )
               end
      @rental_array.push(Rental.new(rental['date'], book, person))
    end
  end

  def save_data
    File.write('./json/rental.json', JSON.dump(@rental_array))
  end

  def create_rental(books_array, person_array)
    puts 'Select a book from the following list by number: '
    books_array.each_with_index do |book, index|
      puts "#{index}) #{book}"
    end
    book_selected = Integer(gets.chomp)
    book_chosen = books_array[book_selected]

    puts 'Select a person from the following list by number (not id): '
    person_array.each_with_index do |person, index|
      puts "#{index}) #{person}"
    end
    person_selected = Integer(gets.chomp)
    person_chosen = person_array[person_selected]

    print 'Date: '
    rental_date = gets.chomp

    @rental_array.push(Rental.new(rental_date, book_chosen, person_chosen))
    save_data
    puts 'Rental created successfully!'
  end

  def rental_list
    print 'ID of person: '
    person_id = Integer(gets.chomp)
    puts 'Rental: '

    @rental_array.each do |rental|
      puts rental if person_id == rental.person.id
    end
  end
end