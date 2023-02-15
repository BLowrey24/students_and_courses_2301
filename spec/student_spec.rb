require './lib/student'

RSpec.describe Student do

  let(:student) { Student.new({name: "Morgan" age: 21}) }

  describe '#initialize' do
    it 'exists' do
      expect(student).to be_a Student
    end

    it 'has attributes' do
      expect(student.name).to eq("Morgan")
      expect(student.age).to eq(21)
      expect(student.scores).to eq([])
    end
  end
end