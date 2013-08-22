require 'spec_helper'

describe Enrollment do
  let(:enrollment) { FactoryGirl.build(:enrollment) }
  subject { enrollment }
  
  it { should be_valid }
  
  it { should validate_presence_of(:branch_id) }
  it { should validate_presence_of(:course_id) }
  it { should validate_presence_of(:discipline_id) }
  it { should validate_presence_of(:batch_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:enrolled_on) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:registration_fee) }
  it { should validate_presence_of(:course_fee) }
  it { should validate_presence_of(:total) }
  it { should validate_presence_of(:mode) }
  it { should validate_presence_of(:created_by) }
  it { should validate_presence_of(:modified_by) }
  it { should validate_presence_of(:txn_status) }
  it { should validate_presence_of(:source_id) }
  
  it { should validate_numericality_of(:branch_id).only_integer }
  it { should validate_numericality_of(:course_id).only_integer }
  it { should validate_numericality_of(:batch_id).only_integer }
  it { should validate_numericality_of(:created_by).only_integer }
  it { should validate_numericality_of(:modified_by).only_integer }
  it { should validate_numericality_of(:reversal_reason_id).only_integer }
  it { should validate_numericality_of(:source_id).only_integer }
  
  it { should validate_numericality_of(:registration_fee) }
  it { should validate_numericality_of(:course_fee) }
  it { should validate_numericality_of(:total) }
  
  it { should validate_uniqueness_of(:application_no) }
  it { should validate_uniqueness_of(:membership_no).scoped_to(:course_id).with_message("can enroll only once for each course") }
  
  it { should_not allow_value('john@example').for(:email) }
  it { should_not allow_value('john.doe@example').for(:email) }
  it { should_not allow_value('john.doe@.com').for(:email) }
  it { should allow_value('john.doe@example.com').for(:email) }
  
  it { should_not allow_value('9880592342').for(:phone) }
  it { should_not allow_value('23442344').for(:phone) }
  it { should allow_value('080-23442344').for(:phone) }
  it { should allow_value('91-80-23442344').for(:phone) }
  it { should allow_value('91-080-23442344').for(:phone) }
  it { should allow_value('091-080-23442344').for(:phone) }
  it { should allow_value('091-9880592342').for(:phone) }
    
  it { should ensure_inclusion_of(:status).in_array(Enrollment::STATUSES) }
  it { should ensure_inclusion_of(:txn_status).in_array(Enrollment::TXN_STATUSES) }
  it { should ensure_inclusion_of(:mode).in_array(Enrollment::MODES) }
  
  it { should belong_to(:creator) }
  it { should belong_to(:modifier) }
  it { should belong_to(:branch) }
  it { should belong_to(:course) }
  it { should belong_to(:discipline) }
  it { should belong_to(:student) }
  it { should belong_to(:batch) }
end
