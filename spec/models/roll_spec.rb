require 'spec_helper'

describe Roll do
  before { @roll = FactoryGirl.build(:roll) }
  subject { @roll }
  
  it { should be_valid }
  
  it { should validate_presence_of(:student_id) }
  it { should validate_presence_of(:branch_id) }
  it { should validate_presence_of(:course_id) }
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:attended) }
  it { should validate_presence_of(:to_end_on) }
  
  it { should validate_numericality_of(:student_id).only_integer }
  it { should validate_numericality_of(:branch_id).only_integer }
  it { should validate_numericality_of(:course_id).only_integer }
  it { should validate_numericality_of(:duration).only_integer }
  it { should validate_numericality_of(:attended).only_integer }

  it { should belong_to(:branch) }
  it { should belong_to(:course) }
  it { should belong_to(:student) }
end
