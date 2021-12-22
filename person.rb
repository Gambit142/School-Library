require_relative './corrector'
require './rental'
require './book'

class Person
  attr_reader :id, :parent_permission
  attr_accessor :name, :age, :rentals

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    @id = id
    @id = rand 1..1000 if @id.nil?
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def can_use_services
    @age >= 18 || @parent_permission == true
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def of_age?
    @age >= 18
  end
  private :of_age?
end
