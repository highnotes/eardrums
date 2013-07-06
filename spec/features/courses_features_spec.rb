require 'spec_helper'

describe "Courses" do
  it "should list courses to guests" do
    FactoryGirl.create(:course, name: "Beginner - Carnatic", description: "Beginner - Carnatic")
    FactoryGirl.create(:course, name: "Beginner - Guitar", description: "Beginner - Guitar")
    visit courses_path
    expect(page).to have_content 'Beginner - Carnatic'
    expect(page).to have_content 'Beginner - Guitar'
  end
  
  it "cannot edit course as non-admin" do
    login role: "user"
    course = FactoryGirl.create(:course)
    visit edit_course_path(course)
    expect(page).to have_content 'Not authorized'
  end
  
  it "can edit course as admin" do
    login role: "admin"
    course = FactoryGirl.create(:course)
    visit edit_course_path(course)
    expect(page).to have_content 'Edit Course'
  end
end
