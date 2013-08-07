require 'spec_helper'

describe User do
  context "with its attributes" do
    before { @user = FactoryGirl.build(:user) }
    subject { @user }
  
    it { should be_valid }
    
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:encrypted_password) }
    it { should respond_to(:email) }
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:full_name) }
    
    it { should belong_to(:course) }
    it { should have_and_belong_to_many (:batches) }
    it { should belong_to(:branch) }
  end
  
  context "when created directly" do
    before { @user = FactoryGirl.build(:user) }
    subject { @user }
  
    context "email" do
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
    
      context "when already taken" do
        before {
          @user_with_same_email = @user.dup
          @user_with_same_email.email = @user.email.upcase
          @user_with_same_email.save
        }
        it "should be invalid" do
          expect(@user).to_not be_valid
        end
        after {
          @user_with_same_email.destroy
        }
      end
    end
  
    context "on password on non-Omniauth account" do
      describe "when not present" do
        before { @user.password = "" }
        it { should_not be_valid }
      end
  
      describe "when confirmation is not present" do
        before { @user.password_confirmation = "" }
        it { should_not be_valid }
      end
  
      describe "when too short" do
        before { @user.password = @user.password_confirmation = "a" * 5 }
        it { should be_invalid }
      end
    end
  
    context "name" do
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
    
    context "username" do
      context "when already taken" do
        before {
          @user_with_same_username = @user.dup
          @user_with_same_username.email = "testing_dup@example.com"
          @user_with_same_username.username = @user.username.upcase
          @user_with_same_username.save
        }
        it "should be invalid" do
          expect(@user).to be_invalid
        end
        after {
          @user_with_same_username.destroy
        }
      end
    end
    
    context "is not a student" do
      context "with course" do
        before { @user_with_course = FactoryGirl.build(:student_with_course, role: 'user') }
        subject { @user_with_course }
      
        context "should not be valid" do
          it { should_not be_valid }
        end
      end
    end
    
    context "is a student" do
      context "without course" do
        before { @student = FactoryGirl.build(:student) }
        subject { @student }
      
        context "should not be valid" do
          it { should_not be_valid }
        end
      end
      
      context "with course linked" do
        before { @student_with_course = FactoryGirl.build(:student_with_course) }
        subject { @student_with_course }
    
        context "should be valid" do
          it { should be_valid }
        end
      end
    end
  
    context "create" do
      it "should increment the no. of records" do
        expect { @user.save }.to change{User.count}.by(1)
      end
    end
  
    context "update" do
      it "should update email" do
        @user.update_attributes(email: "jane.doe@gmail.com")
        expect(@user.email).to eq("jane.doe@gmail.com")
      end
    end
  end
  
  context "via Omniauth" do
    before { @omniuser = FactoryGirl.create(:omniauth_user) }
    subject { @omniuser }
  
    context "password" do
      context "on non-Omniauth account" do
        describe "when password is not present" do
          before { @omniuser.password = "" }
          it { should be_valid }
        end
    
        describe "when password confirmation is not present" do
          before { @omniuser.password_confirmation = "" }
          it { should be_valid }
        end
    
        describe "with a password that's too short" do
          before { @omniuser.password = @omniuser.password_confirmation = "a" * 5 }
          it { should be_invalid }
        end
      end
      
      describe "when password is not present" do
        before { @omniuser.password = "" }
        it { should be_valid }
      end
    end
      
    context "create" do
      context "when all details present" do
        before { @auth = OmniAuth.config.mock_auth[:default] }
    
        it "should create from omniauth hash" do
          expect { User.create_from_omniauth(@auth) }.to change{User.count}.by(1)
        end
        
        it "should add an identity if it doesn't exist" do
          expect { User.create_from_omniauth(@auth) }.to change{Identity.count}.by(1)
        end
      end
    
      context "when email is missing" do
        before { @auth = OmniAuth.config.mock_auth[:twitter] }
      
        it "should not create from omniauth hash" do
          @auth["info"].delete("email")
          expect { User.create_from_omniauth(@auth) }.to_not change{User.count}
        end
      
        it "should create after supplying email" do
          @auth["info"]["email"] = "mock.user@example.com"
          expect { User.create_from_omniauth(@auth) }.to change{User.count}.by(1)
        end
      end
    end
    
    context "update" do
      before { @auth = OmniAuth.config.mock_auth[:default] }
      
      it "should update from omniauth hash" do
        user = User.create_from_omniauth(@auth)
        expect { user.update_from_omniauth(@auth) }.to_not change{User.count}
      end
      
      context "when identity already exists" do
        before {
          @auth_user = User.create_from_omniauth(@auth)
          @other_auth = OmniAuth.config.mock_auth[:facebook]
        }
        it "should add second identity if one exists already" do
          expect { @auth_user.update_from_omniauth(@other_auth) }.to change{Identity.count}.by(1)
        end
        it "should not add a user" do
          expect { @auth_user.update_from_omniauth(@other_auth) }.to_not change{User.count}
        end
      end
    end
  end
  
  context "as admin" do
    before { @admin = FactoryGirl.build(:admin) }
    subject { @admin }
  
    it "should return true for admin?" do
      expect(@admin.admin?).to be_true
    end
  end
  
  context "as staff" do
    before { @staff = FactoryGirl.build(:staff) }
    subject { @staff }
  
    it "should be invalid when no branch is associated with staff" do
      @staff.branch_id = nil
      expect(@staff).to_not be_valid
    end
    
    it "should have valid branch when staff" do
      expect(@staff).to be_valid
    end
    
    it "should return true for staff?" do
      expect(@staff.staff?).to be_true
    end
  end
end
