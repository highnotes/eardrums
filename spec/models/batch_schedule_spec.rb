require 'spec_helper'

describe BatchSchedule do
  before { @batch_schedule = FactoryGirl.build(:batch_schedule) }
  subject { @batch_schedule }
  
  it { should be_valid }
  
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:batch_id) }
  it { should validate_presence_of(:scheduled_on) }
  it { should ensure_inclusion_of(:status).in_array(BatchSchedule::STATUSES) }
  
  it { should belong_to(:batch) }
  it { should have_many(:student_schedules) }
  
  context "Scheduled on" do
    it "should not be valid if Scheduled in the past" do
      @batch_schedule_in_past = FactoryGirl.build(:batch_schedule, scheduled_on: 7.days.ago )
      expect(@batch_schedule_in_past).to_not be_valid
    end
  end
  
  context "Batch" do
    it "should be active" do
      expect { FactoryGirl.create(:batch, status: 'Inactive') }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
  end
  
  context "Generate" do
    before { @batch = FactoryGirl.create(:batch) }
    
    it "should get 5 schedules for Sep 13" do
      schedules = BatchSchedule.create_from_batch_for_a_month(@batch, Chronic.parse("Aug 31 2013"))
      expect(schedules.count).to eq(5)
    end
    
    it "should get 4 schedules for Oct 13" do
      schedules = BatchSchedule.create_from_batch_for_a_month(@batch, Chronic.parse("Sep 30 2013"))
      expect(schedules.count).to eq(4)
    end
    
    it "should get 4 schedules for Nov 13" do
      schedules = BatchSchedule.create_from_batch_for_a_month(@batch, Chronic.parse("Oct 31 2013"))
      expect(schedules.count).to eq(4)
    end
  end
end
