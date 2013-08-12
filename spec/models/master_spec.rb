require 'spec_helper'

describe Master do
  before { @master = FactoryGirl.build(:master) }
  subject { @master }
  
  it { should be_valid }
  
  it { should validate_presence_of(:group) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:index) }
  it { should validate_presence_of(:description) }
  
  it { should validate_numericality_of(:index).only_integer }
  it { should validate_uniqueness_of(:index).scoped_to(:group) }
  
  context "Collections" do
    it "should return collections of a group" do
      @master_dup = @master.dup
      @master_dup.save
      expect(Master.get_group_collection('INFORMATION_SOURCES')).to be_kind_of(Array)
      expect(Master.get_group_collection('INFORMATION_SOURCES')).to include(@master_dup)
      expect(Master.get_group_collection('INFORMATION_SOURCES')).to include(@master_dup)
      @master_dup.destroy
    end
    
    it "should be ordered by group and index" do
      @master_dup_4 = @master.dup
      @master_dup_4.index = 4
      @master_dup_4.save
      @master_dup_5 = @master.dup
      @master_dup_5.index = 5
      @master_dup_5.save
      expect(Master.get_group_collection('INFORMATION_SOURCES').first).to eq(@master_dup_4)
    end
  end
end
