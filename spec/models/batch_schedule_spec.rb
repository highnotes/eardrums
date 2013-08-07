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
      inactive_batch = FactoryGirl.create(:batch, status: 'Inactive')
      @batch_schedule_of_inactive_batch = FactoryGirl.build(:batch_schedule, batch: inactive_batch)
      expect(@batch_schedule_of_inactive_batch).to_not be_valid
    end
  end
end
