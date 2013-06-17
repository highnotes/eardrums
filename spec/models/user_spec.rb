require 'spec_helper'

describe User do
  before { @user = FactoryGirl.build(:user) }
  subject { @user }
  
  it { should be_valid }
  
  context "email" do
    it { should respond_to(:email) }
    
    describe "when email is not present" do
      before { @user.email = "" }
      it { should_not be_valid }
    end
    
    describe "when format is invalid" do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                       foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).not_to be_valid
        end
      end
    end

    describe "when format is valid" do
      it "should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          @user.email = valid_address
          expect(@user).to be_valid
        end
      end
    end
    
    describe "when email address is already taken" do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.email = @user.email.upcase
        user_with_same_email.save
      end

      it { should_not be_valid }
    end
  end
  
  context "password" do
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:encrypted_password) }
    
    describe "when password is not present" do
      before { @user.password = "" }
      it { should_not be_valid }
    end
    
    describe "when password confirmation is not present" do
      before { @user.password_confirmation = "" }
      it { should_not be_valid }
    end
    
    describe "with a password that's too short" do
      before { @user.password = @user.password_confirmation = "a" * 5 }
      it { should be_invalid }
    end
  end
  
  context "name" do
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:full_name) }
  
    it "should return full name when both names are given" do
      expect(@user.full_name).to eq("John Doe")
    end
    
    describe "should return only first name when no second name is given" do
      before { @user.last_name = "" }
      
      it "should return just the first name when no last name" do
        expect(@user.full_name).to eq("John")
      end
    end
  end
  
  context "create" do
    it "should increment the no. of records" do
      expect { @user.save }.to change{User.count}.by(1)
    end
  end
end
