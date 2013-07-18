require 'spec_helper'

describe "Courses" do
  it "should list courses to guests" do
    FactoryGirl.create(:course, name: "Beginner - Guitar", description: "Beginner - Guitar")
    visit courses_path
    expect(page).to have_content 'Courses'
    expect(page).to have_content 'Guitar'
  end
  
  it "cannot edit course as non-admin" do
    pending
    login role: "user"
    course = FactoryGirl.create(:course)
    visit edit_course_path(course)
    expect(page).to have_content 'Not authorized'
  end
  
  it "can edit course as admin" do
    pending
    login role: "admin"
    course = FactoryGirl.create(:course)
    visit edit_course_path(course)
    expect(page).to have_content 'Edit Course'
  end
end
