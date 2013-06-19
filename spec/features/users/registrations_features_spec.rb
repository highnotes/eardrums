require 'spec_helper'

describe "Registration" do
  it "should have the content 'Sign up'" do
    visit '/users/sign_up'
    expect(page).to have_content 'Sign up'
  end
  
  it "should sign up user" do
    visit '/users/sign_up'
    within("#new_user") do
      fill_in 'user_email', with: 'john.doe@example.com'
      fill_in 'user_password', with: 'johndoe123'
      fill_in 'user_password_confirmation', with: 'johndoe123'
    end
    click_button "Sign up"
    expect(page).to have_content 'signed up successfully'
  end
  
  it "should not sign up user when password is not given" do
    visit '/users/sign_up'
    within("#new_user") do
      fill_in 'user_email', with: 'john.doe@example.com'
    end
    click_button "Sign up"
    expect(page).to have_content "Password can't be blank"
  end
end