require 'spec_helper'

describe Installment do
  before { @installment = FactoryGirl.build(:installment) }
  subject { @installment }
  
  it { should be_valid }
  
  it { should validate_presence_of(:course) }
  it { should validate_presence_of(:index) }
  it { should validate_presence_of(:no_of_installments) }
  it { should validate_presence_of(:interval) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:created_by) }
  it { should validate_presence_of(:modified_by) }

  it { should validate_numericality_of(:index).only_integer }
  it { should validate_uniqueness_of(:index).scoped_to(:course_id) }
  it { should validate_numericality_of(:no_of_installments).only_integer }
  it { should validate_numericality_of(:interval).only_integer }
  it { should validate_numericality_of(:amount) }
  
  it { should belong_to(:course) }
  it { should belong_to(:creator) }
  it { should belong_to(:modifier) }
end
