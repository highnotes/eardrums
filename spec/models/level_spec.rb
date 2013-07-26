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
  
  context "display levels", focus: true do
    it "should return beginner level" do
      @level1 = FactoryGirl.create(:level, index: 1)
      expect(Level.beginner_levels).to include(@level1.id)
    end
    
    it "should return intermediate level" do
      @level5 = FactoryGirl.create(:level, index: 5)
      expect(Level.intermediate_levels).to include(@level5.id)
    end
    
    it "should return advanced level" do
      @level9 = FactoryGirl.create(:level, index: 9)
      expect(Level.advanced_levels).to include(@level9.id)
    end
    
    it "should return specialities" do
      @levelSpecial = FactoryGirl.create(:level, index: -1)
      expect(Level.special_levels).to include(@levelSpecial.id)
    end
  end
end
