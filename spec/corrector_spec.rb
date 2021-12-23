require './corrector'

describe Corrector do
  before(:each) do
    @corrector = Corrector.new
    @corrected_name = @corrector.correct_name('alexandriasss')
  end

  it 'should be an instance of Classroom' do
    expect(@corrector).to be_instance_of Corrector
  end

  it 'should correct a name that is loneger than ten characters' do
    expect(@corrected_name).to eql 'Alexandria'
  end
end
