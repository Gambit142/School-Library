require './teacher.rb'

describe Teacher do 
  before(:each) do 
     @teacher = Teacher.new(45, 'Morpheus', "Chemistry", id: 325)
  end 
  
  it 'teacher should be able to print a message' do
   message = @teacher.to_s
   expect(message).to eql "[Teacher] Name: Morpheus, ID: 325, Age: 45"
  end 
  
  it 'should have its attributes' do
   expect(@teacher).to have_attributes(specialization: "Chemistry") 
   expect(@teacher).to have_attributes(age: 45)
  end
end