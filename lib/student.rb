class Student
  attr_reader :name, :age, :scores

  def initialize(info)
    @name = info[:name]
    @age = info[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end

  def grade
    if @scores.empty?
      return nil
    else
      total = @scores.sum
      average = total.to_f / @scores.length
      return average.round(1)
    end
  end
end
