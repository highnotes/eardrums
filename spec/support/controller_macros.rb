module ControllerMacros
  def login_student_before_each(attributes = {})
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      student = FactoryGirl.create(:student, attributes)
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in student
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
  
  def login_teacher_before_each(attributes = {})
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      teacher = FactoryGirl.create(:teacher, attributes)
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in teacher
    end
  end
  
  def login_admin_before_each(attributes = {})
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      admin = FactoryGirl.create(:administrator, attributes)
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in admin
    end
  end
end