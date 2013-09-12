require 'spec_helper'

describe Users::OmniauthCallbacksController do
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
    @identity = mock_model(Identity)
  end
  
  context "When user has not signed in" do
    context "should successfully sign in with provider" do
      before(:each) do
        @user = mock_model(User)
      end
      
      it "when user already present" do
        Identity.should_receive(:from_omniauth).and_return(@identity)
        @identity.should_receive(:user).at_least(1).times.and_return(@user)
        
        @user.stub(:authenticatable_salt)
        @user.should_receive(:update_from_omniauth)
        
        get :twitter
      end
      
      it "when user not present" do
        @identity.stub(:user)
        
        User.should_receive(:create_from_omniauth).and_return(@user)
        @user.should_receive(:persisted?).and_return(true)
        @user.stub(:authenticatable_salt)
        
        get :twitter
      end
    end
  end
    
  context "when user has signed in" do
    login_student_before_each

    it "should sign in if identity already exists or by adding identity" do
      Identity.should_receive(:from_omniauth).and_return(@identity)
      subject.current_user.should_receive(:update_from_omniauth)
    
      get :twitter
    end
  end

  it "should fail if provider returns failure" do
    pending
    OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
    get :twitter
    response.should redirect_to('/auth/failure?message=invalid_credentials')
  end
end
