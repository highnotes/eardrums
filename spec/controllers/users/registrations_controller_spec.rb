require 'spec_helper'

describe Users::RegistrationsController do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
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
      expect(@user.reload.email).to eq("john.doe@example1.com")
    end
    
    it "should update names" do
      patch :update, id: subject.current_user.id, :user => {:first_name => "Jane"}
      response.should be_success
    end
  end
  
  it "can sign up user with Twitter Account" do
    pending
    get user_omniauth_authorize_path(:twitter)
    puts @request.env
  end
end