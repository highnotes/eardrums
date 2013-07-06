module FeatureMacros
  def login(attributes = {})
    @_current_user = FactoryGirl.create(:user, attributes)
    visit new_user_session_path
    within("#new_user") do
      fill_in 'user_login', with: @_current_user.email
      fill_in 'user_password', with: @_current_user.password
    end
    click_button "Login"
  end
end