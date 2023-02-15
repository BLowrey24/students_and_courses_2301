require './lib/gradebook'
require './lib/course'
require './lib/student'

RSpec.describe Gradebook do

  let(:gradebook) { Gradebook.new("Mr. Lowrey") }

  let(:course1) { Course.new("Calculus", 2) }
  let(:course2) { Course.new("Science", 4) }

  let(:student1) { Student.new({name: "Morgan", age: 21}) }
  let(:student2) { Student.new({name: "Jordan", age: 29}) }
  let(:student3) { Student.new(name: "Bob", age: 19) }
  let(:student4) { Student.new(name: "Alice", age: 16) }

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

  describe '#list_all_students' do
    it 'returns a hash of courses as keys and students as values' do
      course1.enroll(student1)
      course2.enroll(student2)
      course2.enroll(student3)
      gradebook.add_course(course1)
      gradebook.add_course(course2)

      expect(gradebook.list_all_students).to eq({
        course1 => [student1],
        course2 => [student2, student3]
      })
    end
  end

  describe 'students_below' do
    it 'returns an array of students with a grade below a given threshold' do
      student1.log_score(80)
      student2.log_score(60)
      student3.log_score(70)
      student4.log_score(90)
      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student3)
      course2.enroll(student4)
      gradebook.add_course(course1)
      gradebook.add_course(course2)

      expect(gradebook.students_below(75)).to eq(student2, student3)
    end
  end
end