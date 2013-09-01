require 'spec_helper'

describe Payment do
  before { @payment = FactoryGirl.build(:payment) }
  subject { @payment }
  
  it { should be_valid }
  
  it { should validate_presence_of(:mode) }
  it { should validate_presence_of(:total) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:branch_id) }
  it { should validate_presence_of(:created_by) }
  it { should validate_presence_of(:modified_by) }
  
  it { should validate_numericality_of(:registration_fee) }
  it { should validate_numericality_of(:course_fee) }
  it { should validate_numericality_of(:total) }
  
  it { should ensure_inclusion_of(:mode).in_array(Payment::MODES) }
  it { should ensure_inclusion_of(:status).in_array(Payment::STATUSES) }
  
  it { should belong_to(:branch) }
  it { should belong_to(:creator) }
  it { should belong_to(:modifier) }
  
  context "scoped for today" do
    it "should return today's payments" do
      payment = FactoryGirl.create(:payment)
      expect(Payment.today).to include(payment) 
    end
  end
end
