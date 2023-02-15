require './lib/course'
require './lib/student'

RSpec.describe Course do

  let(:course) { Course.new("Calculus", 2) }

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
end