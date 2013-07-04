require 'spec_helper'

describe Material do
  before { @material = FactoryGirl.build(:material) }
  subject { @material }
  
  it { should be_valid }
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:lesson) }
  it { should belong_to(:lesson) }  
end
