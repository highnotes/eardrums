module ControllerMacros
  def login_user_before_each(attributes = {})
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user, attributes)
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in user
    end
  end
  
  def login_staff_before_each(attributes = {})
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      staff = FactoryGirl.create(:staff, attributes)
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in staff
    end
  end
end