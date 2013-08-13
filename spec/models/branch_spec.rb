require 'spec_helper'

describe Branch do
  before { @branch = FactoryGirl.build(:branch) }
  subject { @branch }
  
  it { should be_valid }
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:subdomain) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:phones) }
  
  it { should belong_to(:franchise) }
  it { should have_and_belong_to_many (:courses) }
  it { should have_many(:staffs) }
  it { should have_many(:enrollments) }
  it { should have_many(:rolls) }
end
