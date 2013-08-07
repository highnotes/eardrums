require 'spec_helper'

describe StudentSchedule do
  before { @student_schedule = FactoryGirl.build(:student_schedule) }
  subject { @student_schedule }
  
  it { should be_valid }
  
  it { should validate_presence_of(:student_id) }
  it { should validate_presence_of(:batch_schedule) }
  
  context "BatchSchedule" do
    it "should be active" do
      cancelled_batch_schedule = FactoryGirl.create(:batch_schedule, status: 'Cancelled')
      @student_schedule_of_inactive_batch_schedule = FactoryGirl.build(:student_schedule, batch_schedule: cancelled_batch_schedule)
      expect(@student_schedule_of_inactive_batch_schedule).to_not be_valid
    end
  end
  
  context "Attended On" do
    it "should be today or past" do
      @schedule_of_future_attendance = FactoryGirl.build(:student_schedule, attended_on: 7.days.since)
      expect(@schedule_of_future_attendance).to_not be_valid
    end
  end
end
