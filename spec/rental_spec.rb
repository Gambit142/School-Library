require './rental'
require './book'
require './person'

describe Rental do
  before(:each) do
    @book = Book.new('Merchant of Venice', 'Williams Shakespeare')
    @person = Person.new(325, 40, 'Hector')
    @rental = Rental.new('2019/12/31', @book, @person)
  end

  it 'should print a string with the details of the rental' do
    output = @rental.to_s
    expect(output).to eql 'Date: 2019/12/31, Book: "Merchant of Venice" by Williams Shakespeare'
  end

  it 'should have its own attributes' do
    expect(@rental).to have_attributes(date: '2019/12/31')
  end

  it 'should expect the person renting the book to have permission to use service' do
    permission = @rental.person.can_use_services
    expect(permission).to be true
  end
end
