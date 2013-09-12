require 'spec_helper'

describe Users::RegistrationsController do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end
  
  context "create" do
    it "should create a new user"
  end
  
  context 'logged in user' do
    login_student_before_each
    
    before(:each) { @user = subject.current_user }
    
    it "editing is possible" do
      get :edit
      response.should be_success
    end
    
    it "can update first name" do
      user = mock_model(User)
      User.stub(:find).and_return(user)
      user.should_receive(:update_without_password)
      patch :update, id: user, user: { name: "John Not Doe" }
    end
    
    it "can update with password" do
      user = mock_model(User)
      User.stub(:find).and_return(user)
      user.should_receive(:update_with_password)
      patch :update, id: user, user: { password: "password123" }
    end
  end
  
  context "mailers" do
    it "should send confirmation mail after signing up"
    it "should resend confirmation mail from profile page"
  end
end