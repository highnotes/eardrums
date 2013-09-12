require 'spec_helper'

describe "Enrollments" do
  it "should list disciplines to staff" do
    FactoryGirl.create(:discipline, name: "Guitar", description: "Guitar")
    login type: "Staff", branch_id: 1
    
    visit new_enrollment_path
    expect(page).to have_content 'Discipline'
    expect(page).to have_content 'Guitar'
  end
end