class Gradebook
  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    students_by_course = {}
    
    @courses.each do |course|
      students_by_course[course] = course.students
    end
    
    students_by_course
  end

  def students_below(threshold)
    students = []

    @courses.each do |course|
      course.students.each do |student|
        students << student if student.grade < threshold
      end
    end
    
    students
  end
end
