require 'spec_helper'

describe Identity do
  context "registration" do
    before do
      @mock_auth = OmniAuth.config.mock_auth[:twitter]
    end
    
    it "should create a new identity for first time users" do
      expect{Identity.from_omniauth(@mock_auth)}.to change{Identity.count}.by(1)
    end
    
    it "should NOT create a new identity for already registered users" do
      identity1 = Identity.from_omniauth(@mock_auth) #Create the first time
      expect{Identity.from_omniauth(@mock_auth)}.to_not change{Identity.count} #But not the second time
      expect(Identity.from_omniauth(@mock_auth).uid).to eq(identity1.uid) #Return the second time
    end
  end
end
