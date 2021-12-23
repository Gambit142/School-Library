require './person'

describe Person do
  before(:each) do
    @person = Person.new(325, 40, 'Hector')
  end

  it 'should be able to use services' do
    permission = @person.can_use_services
    expect(permission).to be true
  end

  it 'should have its own attributes' do
    expect(@person).to have_attributes(age: 40)
    expect(@person).to have_attributes(name: 'Hector')
  end
end
