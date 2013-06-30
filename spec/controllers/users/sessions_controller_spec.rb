require 'spec_helper'

describe Users::SessionsController do
  login_user
  
  it "should have a current_user" do
    subject.current_user.should_not be_nil
  end
  
  it "should be able to login via username or email"
end