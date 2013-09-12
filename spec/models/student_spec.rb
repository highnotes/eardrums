require 'spec_helper'

describe Student do
  context "is not a student" do
    context "with course" do
      before { @user_with_course = FactoryGirl.build(:student, type: 'User') }
      subject { @user_with_course }
    
      context "should not be valid" do
        it { should_not be_valid }
      end
    end
  end
  
  context "is a student" do
    context "without course" do
      before { @student_without_course = FactoryGirl.build(:student_without_course) }
      subject { @student_without_course }
    
      context "should not be valid" do
        it { should_not be_valid }
      end
    end
    
    context "with course linked" do
      before { @student_with_course = FactoryGirl.build(:student) }
      subject { @student_with_course }
  
      context "should be valid" do
        it { should be_valid }
      end
    end
  end
end