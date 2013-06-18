require 'spec_helper'

describe Users::RegistrationsController do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  
  describe "GET 'new' and 'edit'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end
  
  context 'logged in user' do
    login_user
    
    it "should be successful" do
      get :edit
      response.should be_success
    end
    
    it "should update email" do
      pending
      @user = subject.current_user
      patch :update, id: @user, user: {:email => "john.doe@example1.com"}
      @user.reload
      expect(@user.email).to eq("john.doe@example1.com")
    end
    
    it "should update names" do
      patch :update, id: subject.current_user.id, :user => {:first_name => "Jane"}
      response.should be_success
    end
  end
end