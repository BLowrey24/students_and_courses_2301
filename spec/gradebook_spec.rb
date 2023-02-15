require './lib/gradebook'
require './lib/course'
require './lib/student'

RSpec.describe Gradebook do

  let(:gradebook) { Gradebook.new("Mr. Lowrey") }

  describe '#initialize' do
    it 'exists' do
      expect(gradebook).to be_a Gradebook
    end

    it 'has attributes' do
      expect(gradebook.instructor).to eq("Mr. Lowrey")
      expect(gradebook.courses).to eq([])
    end
  end
end