require 'spec_helper'

describe Franchise do
  before { @franchise = FactoryGirl.build(:franchise) }
  subject { @franchise }
  
  it { should be_valid }
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:franchisees) }
  it { should validate_presence_of(:emails) }
  it { should validate_presence_of(:phones) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:created_by) }
  it { should validate_presence_of(:modified_by) }
  
  it { should have_many(:branches) }
  it { should belong_to(:creator) }
  it { should belong_to(:modifier) }
end
