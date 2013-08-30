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
  it { should validate_presence_of(:created_by) }
  it { should validate_presence_of(:modified_by) }
  
  it { should validate_numericality_of(:duration).only_integer }
  it { should ensure_inclusion_of(:status).in_array(Batch::STATUSES) }
  
  it { should belong_to(:discipline) }
  it { should belong_to(:teacher) }
  it { should have_and_belong_to_many (:students) }
  it { should have_many(:batch_schedules) }
  it { should have_many(:enrollments) }
  it { should belong_to(:creator) }
  it { should belong_to(:modifier) }
  
  context "timings" do
    it "should return correct day" do
      @batch_now = FactoryGirl.build(:batch, day: "Sunday", start_time: "14:30")
      expect(@batch_now.timings).to include("Sunday")
      expect(@batch_now.timings).to include("2:30 PM")
      expect(@batch_now.timings).to include("3:30 PM")
    end
  end
  
  context "create" do
    it "should spawn schedules for the month" do
      @batch_dup = @batch.dup
      expect{ @batch_dup.save }.to change{ BatchSchedule.count }
    end
  end
  
  context "update" do
    it "should not re-spawn the same schedule" do
      @batch_dup = @batch.dup
      @batch_dup.save
      expect{ @batch_dup.save }.not_to change{ BatchSchedule.count }
    end
    
    it "should re-spawn if day or time has changed"
    
    it "should generate newer schedules ad-hoc" do
      @batch_dup = @batch.dup
      @batch_dup.save
      expect{ @batch_dup.generate_schedules_from(Chronic.parse("01 Jun 2020")) }.to change{ BatchSchedule.count }
    end
    
    it "should generate new schedules on touch" do
      @batch_dup = @batch.dup
      @batch_dup.save
      @batch_dup.should_receive(:generate_schedule)
      @batch_dup.touch
    end
  end
  
  context "Change day or time" do
    it "should generate new schedules on touch" do
      cancel_count = 0
      @batch_dup = @batch.dup
      @batch_dup.save
      @batch_dup.day = "Friday"
      BatchSchedule.any_instance.stub(:cancel!) { cancel_count += 1 }
      @batch_dup.save
      cancel_count.should > 0
    end
  end
end
