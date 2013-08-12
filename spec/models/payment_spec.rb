require 'spec_helper'

describe Payment do
  before { @payment = FactoryGirl.build(:payment) }
  subject { @payment }
  
  it { should be_valid }
  
  it { should validate_presence_of(:mode) }
  it { should validate_presence_of(:transaction_type) }
  it { should validate_presence_of(:total) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:created_by) }
  it { should validate_presence_of(:modified_by) }
  
  it { should validate_numericality_of(:registration_fee) }
  it { should validate_numericality_of(:course_fee) }
  it { should validate_numericality_of(:total) }
  
  it { should ensure_inclusion_of(:mode).in_array(Payment::MODES) }
  it { should ensure_inclusion_of(:transaction_type).in_array(Payment::TXN_TYPES) }
  it { should ensure_inclusion_of(:status).in_array(Payment::STATUSES) }
  
  it { should belong_to(:creator) }
  it { should belong_to(:modifier) }
end
