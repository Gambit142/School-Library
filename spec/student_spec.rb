require './student'

describe Student do
  before(:each) do
    @student = Student.new(18, 'Trojan', id: 325)
  end

  it 'student should be able to use services' do
    permission = @student.can_use_services
    expect(permission).to be true
  end

  it 'should have its own attributes' do
    expect(@student).to have_attributes(id: 325)
    expect(@student).to have_attributes(name: 'Trojan')
  end
end
