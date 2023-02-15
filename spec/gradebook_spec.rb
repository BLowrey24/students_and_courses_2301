require './lib/gradebook'
require './lib/course'
require './lib/student'

RSpec.describe Gradebook do

  let(:gradebook) { Gradebook.new("Mr. Lowrey") }
  let(:course1) { Course.new("Calculus", 2) }
  let(:course2) { Course.new("Science", 4) }

  describe '#initialize' do
    it 'exists' do
      expect(gradebook).to be_a Gradebook
    end

    it 'has attributes' do
      expect(gradebook.instructor).to eq("Mr. Lowrey")
      expect(gradebook.courses).to eq([])
    end
  end

  describe '#add_course' do
    it 'add courses to the courses array' do
      gradebook.add_course(course1)
      
      expect(gradebook.courses).to eq([course1])
      
      gradebook.add_course(course2)
      
      expect(gradebook.courses).to eq([course1, course2])
    end
  end
end