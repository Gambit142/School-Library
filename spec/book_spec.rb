require './book'

describe Book do
  before(:each) do
    @book = Book.new('Merchant of Venice', 'Williams Shakespeare')
  end

  it 'should print a string with the title and author' do
    output = @book.to_s
    expect(output).to eql 'Title: Merchant of Venice, Author: Williams Shakespeare'
  end

  it 'should have its own attributes' do
    expect(@book).to have_attributes(title: 'Merchant of Venice')
    expect(@book).to have_attributes(author: 'Williams Shakespeare')
  end
end
