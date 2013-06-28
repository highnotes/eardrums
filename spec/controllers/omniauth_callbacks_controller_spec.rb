require 'spec_helper'

describe OmniauthCallbacksController do
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end
  
  context "When user has not signed in" do
    it "should successfully sign in with provider" do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
      get :twitter
      response.should be_redirect
    end
  
    it "should fail if provider returns failure"
    it "should add another identity to current user"
    it "should show failure if identity is already linked to another user"
    it "should sign in if identity already exists"
    it "should sign in after creating and linking identity if it doesn't exist"
  end
end
