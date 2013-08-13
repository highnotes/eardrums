require 'spec_helper'

describe PaymentSchedule do
  before { @payment_schedule = FactoryGirl.build(:payment_schedule) }
  subject { @payment_schedule }
  
  it { should be_valid }
  
  it { should validate_presence_of(:enrollment_id) }
  it { should validate_presence_of(:due_on) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:created_by) }
  it { should validate_presence_of(:modified_by) }
  
  it { should ensure_inclusion_of(:status).in_array(PaymentSchedule::STATUSES) }
  
  it { should belong_to(:enrollment) }
  it { should belong_to(:payment) }
  it { should belong_to(:creator) }
  it { should belong_to(:modifier) }
end
