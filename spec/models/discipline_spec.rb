require 'spec_helper'

describe Discipline do
  before { @discipline = FactoryGirl.build(:discipline) }
  subject { @discipline }
  
  it { should be_valid }
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should have_many(:courses) }
end