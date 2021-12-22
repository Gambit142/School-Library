require 'json'

class BookOptions
  attr_reader :books

  def initialize
    @books = []

    return unless File.exist?('./json/book.json')

    file = File.read('./json/book.json')
    file_data = JSON.parse(file)
    file_data.each do |book|
      @books.push(Book.new(book['title'], book['author']))
    end
  end

  def save_data
    File.write('./json/book.json', JSON.dump(@books))
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp
    book = Book.new(book_title, book_author)
    @books.push(book)
    save_data
    puts 'Book created successfully!'
  end

  def book_list
    @books.each { |book| puts book }
  end
end
