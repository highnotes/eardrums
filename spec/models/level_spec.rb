require 'spec_helper'

describe Level do
  before { @level = FactoryGirl.build(:level) }
  subject { @level }
  
  it { should be_valid }
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  
  it { should validate_presence_of(:index) }
  it { should validate_numericality_of(:index).only_integer }
  it { should validate_uniqueness_of(:index) }
  
  it { should have_many(:courses) }
end
