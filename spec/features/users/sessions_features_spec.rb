require 'spec_helper'

describe "Session" do
  it "should have the content 'Login'" do
    pending
    visit '/users/sign_in'
    expect(page).to have_content 'Login'
  end
  
  it "should sign in user" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', with: 'subhash.bhushan@stratalabs.in'
      fill_in 'user_password', with: 'Password123'
    end
    save_and_open_page
    click_button "Login"
    expect(page).to have_content 'Signed in successfully'
  end
  
  it "should not sign in user when password is not given" do
    pending
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', with: 'subhash.bhushan@gmail.com'
    end
    click_button "Login"
    expect(page).to have_content "Invalid email or password"
  end
end