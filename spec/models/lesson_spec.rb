require 'spec_helper'

describe Lesson do
  before { @lesson = FactoryGirl.build(:lesson) }
  subject { @lesson }
  
  it { should be_valid }
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:course) }
  it { should validate_presence_of(:index) }
  it { should validate_numericality_of(:index).only_integer }
  it { should validate_uniqueness_of(:index).scoped_to(:course_id) }
  it { should belong_to(:course) }
  it { should have_many(:materials) }
end
