require './classroom'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Alpha')
    @classroom.students << 'Reginald'
    @classroom.students << 'Xavier'
  end

  it 'should be an instance of Classroom' do
    expect(@classroom).to be_instance_of Classroom
  end

  it 'should have its own attributes' do
    expect(@classroom).to have_attributes(label: 'Alpha')
  end
end
