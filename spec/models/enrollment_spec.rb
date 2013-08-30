require 'spec_helper'

describe Enrollment do
  before(:all) do
    @branch = FactoryGirl.create(:branch)
    @course = FactoryGirl.create(:course)
    @discipline = FactoryGirl.create(:discipline)
    @batch = FactoryGirl.create(:batch)
    @student = FactoryGirl.create(:student)
    @enrollment_attrs = FactoryGirl.build(:enrollment, branch_id: @branch.id, course_id: @course.id,
                        discipline_id: @discipline.id, batch_id: @batch.id, student_id: @student.id).attributes
  end
  
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
  
  context "Validations" do
    before { @enrollment = FactoryGirl.build(:enrollment) }
    subject { @enrollment }
    
    context "Application No." do
      before {
        @enrollment_with_dup_app_no = @enrollment.dup
        @enrollment_with_dup_app_no.membership_no = "something valid"
        @enrollment_with_dup_app_no.save
      }
      it "should be invalid" do
        expect(@enrollment).not_to be_valid
      end
      after {
        @enrollment_with_dup_app_no.destroy
      }
    end
    
    context "Membership No." do
      before {
        @enrollment_with_dup_mem_no = @enrollment.dup
        @enrollment_with_dup_mem_no.application_no = "something valid"
        @enrollment_with_dup_mem_no.save
      }
      it "should be invalid" do
        expect(@enrollment).not_to be_valid
      end
      after {
        @enrollment_with_dup_mem_no.destroy
      }
    end
  end
  
  context "Defaults" do
    before { @enrollment = FactoryGirl.build(:enrollment) }
    subject { @enrollment }
    
    it { should be_course_in_progress }
    its(:txn_status) { should == "Active" }
    its(:enrolled_on) { should == Date.today }
    its(:reversal_reason_id) { should == 0}
  end
  
  context "Build" do
    before { @enrollment = FactoryGirl.build(:enrollment) }
    subject { @enrollment }
    
    it "should call set_defaults once" do
      Enrollment.any_instance.should_receive(:set_defaults)
      Enrollment.new
    end
    
    it "should call User.build_from_enrollment once" do
      User.should_receive(:build_from_enrollment).with(an_instance_of(Enrollment)).and_return(FactoryGirl.build(:student))
      Enrollment.build(@enrollment_attrs)
    end
    
    it "should call Roll.build_from_enrollment once" do
      Roll.should_receive(:build_from_enrollment).with(an_instance_of(Enrollment)).and_return(FactoryGirl.build(:roll))
      Enrollment.build(@enrollment_attrs)
    end
    
    it "should call StudentSchedule.build_from_enrollment once"
  end
  
  it "should return course_completed? true after course is completed"
end
