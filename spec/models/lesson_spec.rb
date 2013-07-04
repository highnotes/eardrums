require 'spec_helper'

describe Lesson do
  before { @lesson = FactoryGirl.build(:lesson) }
  subject { @lesson }
  
  it { should be_valid }
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:course) }
  it { should belong_to(:course) }
  it { should have_many(:materials) }
end
