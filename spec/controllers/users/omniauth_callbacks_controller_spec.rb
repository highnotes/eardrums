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
        User.should_receive(:update_from_omniauth).and_return(@user)
        
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
    login_user
  
    it "should add another identity to current user" do
      Identity.should_receive(:from_omniauth).and_return(@identity)
      @identity.should_receive(:user).at_least(1).times
      @identity.should_receive(:update_attributes)
    
      User.should_receive(:update_from_omniauth)
    
      get :twitter
    end
  
    it "should sign in if identity already exists" do
      Identity.should_receive(:from_omniauth).and_return(@identity)
      @identity.should_receive(:user).at_least(1).times.and_return(subject.current_user)
      @identity.should_not_receive(:update_attributes)
    
      User.should_receive(:update_from_omniauth)
    
      get :twitter
    end
  
    it "should change linkage if identity is already linked to another user" do
      user = mock_model(User)
    
      Identity.should_receive(:from_omniauth).and_return(@identity)
      @identity.should_receive(:user).at_least(1).times.and_return(user)
      @identity.should_receive(:update_attributes)
    
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
