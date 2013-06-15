require 'spec_helper'

describe User do
  before { @user = User.new(email: 'subhash.bhushan@gmail.com') }
  
  subject { @user }
  
  it { should respond_to(:email) }
end
