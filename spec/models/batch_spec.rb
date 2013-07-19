require 'spec_helper'

describe Batch do
  before { @batch = FactoryGirl.build(:batch) }
  subject { @batch }
  
  it { should be_valid }
  
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:discipline) }
  it { should validate_presence_of(:teacher) }
  it { should validate_presence_of(:day) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:duration) }
  
  it { should validate_numericality_of(:day).only_integer }
  it { should validate_numericality_of(:duration).only_integer }
  
  it { should belong_to(:discipline) }
  it { should belong_to(:teacher) }
  it { should have_and_belong_to_many (:students) }
  
  context "timings" do
    it "should return correct day" do
      t = Time.now
      expect(@batch.timings).to include("Sat")
      expect(@batch.timings).to include("#{t.strftime "%l:%M %p"}")
      expect(@batch.timings).to include("#{(t + @batch.duration*60*60).strftime "%l:%M %p"}")
    end
  end
end
