require './lib/course'
require './lib/student'

RSpec.describe Course do

  let(:course) { Course.new("Calculus", 2) }
  let(:student1) { Student.new({name: "Morgan", age: 21}) }
  let(:student2) { Student.new({name: "Jordan", age: 29}) }

  describe '#initialize' do
    it 'exists' do
      expect(course).to be_a Course
    end

    it 'has attributes' do
      expect(course.name).to eq ('Calculus')
      expect(course.capacity).to eq (2)
      expect(course.students).to eq ([])
    end
  end

  describe '#full?' do
    it 'shows if the course is full or not' do
      expect(course.full?).to be false
    end
  end

  describe '#enroll' do
    it 'can add a student to the students array' do
      course.enroll(student1)
      course.enroll(student2)

      expect(course.students).to eq ([student1, student2])
      expect(course.full?).to be true
    end
  end
end