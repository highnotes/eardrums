require "spec_helper"

describe Permissions do
  describe "as guest" do
    subject { Permissions.permission_for(nil) }
    it "allows courses" do
      should allow_action("courses", "index")
      should allow_action("courses", "show")
      should_not allow_action("courses", "new")
      should_not allow_action("courses", "create") 
      should_not allow_action("courses", "edit")
      should_not allow_action("courses", "update") 
      should_not allow_action("courses", "destroy")
    end
    
    it "allows enrollments" do
      should_not allow_action("enrollments", "index")
      should_not allow_action("enrollments", "show")
      should_not allow_action("enrollments", "new")
      should_not allow_action("enrollments", "create") 
      should_not allow_action("enrollments", "edit")
      should_not allow_action("enrollments", "update") 
      should_not allow_action("enrollments", "destroy")
    end
    
    it "allows users/registrations" do
      should allow_action("users/registrations", "new")
      should allow_action("users/registrations", "create")
      should_not allow_action("users/registrations", "edit")
      should_not allow_action("users/registrations", "update") 
      should_not allow_action("users/registrations", "destroy")
      should_not allow_action("users/registrations", "cancel") 
    end
    
    it "allows devise/confirmations" do
      should allow_action("devise/confirmations", "create")
      should allow_action("devise/confirmations", "new")
      should allow_action("devise/confirmations", "show")
    end
    
    it "allows devise/sessions" do
      should allow_action("devise/sessions", "new")
      should allow_action("devise/sessions", "create") 
      should allow_action("devise/sessions", "destroy")
    end
    
    it { should allow_action("static_pages", "home") }
    
    it "allows devise/passwords" do
      should allow_action("devise/passwords", "new")
      should allow_action("devise/passwords", "create")
      should allow_action("devise/passwords", "edit")
      should allow_action("devise/passwords", "update")
    end
    
    it "allows users/omniauth_callbacks" do
      should allow_action("users/omniauth_callbacks", "pass_thru")
      should allow_action("users/omniauth_callbacks", "twitter")
      should allow_action("users/omniauth_callbacks", "facebook")
      should allow_action("users/omniauth_callbacks", "google_oauth2")
    end
    
    it "allows teachers" do
      should allow_action("teachers", "index")
      should allow_action("teachers", "show")
      should_not allow_action("teachers", "new")
      should_not allow_action("teachers", "create") 
      should_not allow_action("teachers", "edit")
      should_not allow_action("teachers", "update") 
      should_not allow_action("teachers", "destroy")
    end
  end
  
  describe "as user" do
    subject { Permissions.permission_for(FactoryGirl.build(:user)) }
    
    it "allows courses" do
      should allow_action("courses", "index")
      should allow_action("courses", "show")
      should_not allow_action("courses", "new")
      should_not allow_action("courses", "create") 
      should_not allow_action("courses", "edit")
      should_not allow_action("courses", "update") 
      should_not allow_action("courses", "destroy")
    end
    
    it "allows enrollments" do
      should_not allow_action("enrollments", "index")
      should_not allow_action("enrollments", "show")
      should_not allow_action("enrollments", "new")
      should_not allow_action("enrollments", "create") 
      should_not allow_action("enrollments", "edit")
      should_not allow_action("enrollments", "update") 
      should_not allow_action("enrollments", "destroy")
    end
    
    it "allows users/registrations" do
      should allow_action("users/registrations", "new")
      should allow_action("users/registrations", "create")
      should allow_action("users/registrations", "edit")
      should allow_action("users/registrations", "update") 
      should allow_action("users/registrations", "destroy")
      should allow_action("users/registrations", "cancel") 
    end
    
    it "allows devise/confirmations" do
      should allow_action("devise/confirmations", "create")
      should allow_action("devise/confirmations", "new")
      should allow_action("devise/confirmations", "show")
    end
    
    it "allows devise/sessions" do
      should allow_action("devise/sessions", "new")
      should allow_action("devise/sessions", "create") 
      should allow_action("devise/sessions", "destroy")
    end
    
    it { should allow_action("static_pages", "home") }
    
    it "allows devise/passwords" do
      should allow_action("devise/passwords", "new")
      should allow_action("devise/passwords", "create")
      should allow_action("devise/passwords", "edit")
      should allow_action("devise/passwords", "update")
    end
    
    it "allows users/omniauth_callbacks" do
      should allow_action("users/omniauth_callbacks", "pass_thru")
      should allow_action("users/omniauth_callbacks", "twitter")
      should allow_action("users/omniauth_callbacks", "facebook")
      should allow_action("users/omniauth_callbacks", "google_oauth2")
    end
    
    it "allows teachers" do
      should allow_action("teachers", "index")
      should allow_action("teachers", "show")
      should_not allow_action("teachers", "new")
      should_not allow_action("teachers", "create") 
      should_not allow_action("teachers", "edit")
      should_not allow_action("teachers", "update") 
      should_not allow_action("teachers", "destroy")
    end
  end
  
  describe "as staff" do
    subject { Permissions.permission_for(FactoryGirl.build(:staff)) }
    
    it "allows courses" do
      should allow_action("courses", "index")
      should allow_action("courses", "show")
      should_not allow_action("courses", "new")
      should_not allow_action("courses", "create") 
      should_not allow_action("courses", "edit")
      should_not allow_action("courses", "update") 
      should_not allow_action("courses", "destroy")
    end
    
    it "allows enrollments" do
      should allow_action("enrollments", "index")
      should allow_action("enrollments", "show")
      should allow_action("enrollments", "new")
      should allow_action("enrollments", "create") 
      should allow_action("enrollments", "edit")
      should allow_action("enrollments", "update") 
      should allow_action("enrollments", "reverse") 
      should_not allow_action("enrollments", "destroy")
    end
    
    it "allows users/registrations" do
      should allow_action("users/registrations", "new")
      should allow_action("users/registrations", "create")
      should allow_action("users/registrations", "edit")
      should allow_action("users/registrations", "update") 
      should allow_action("users/registrations", "destroy")
      should allow_action("users/registrations", "cancel") 
    end
    
    it "allows devise/confirmations" do
      should allow_action("devise/confirmations", "create")
      should allow_action("devise/confirmations", "new")
      should allow_action("devise/confirmations", "show")
    end
    
    it "allows devise/sessions" do
      should allow_action("devise/sessions", "new")
      should allow_action("devise/sessions", "create") 
      should allow_action("devise/sessions", "destroy")
    end
    
    it { should allow_action("static_pages", "home") }
    
    it "allows devise/passwords" do
      should allow_action("devise/passwords", "new")
      should allow_action("devise/passwords", "create")
      should allow_action("devise/passwords", "edit")
      should allow_action("devise/passwords", "update")
    end
    
    it "allows users/omniauth_callbacks" do
      should allow_action("users/omniauth_callbacks", "pass_thru")
      should allow_action("users/omniauth_callbacks", "twitter")
      should allow_action("users/omniauth_callbacks", "facebook")
      should allow_action("users/omniauth_callbacks", "google_oauth2")
    end
    
    it "allows teachers" do
      should allow_action("teachers", "index")
      should allow_action("teachers", "show")
      should allow_action("teachers", "new")
      should allow_action("teachers", "create") 
      should allow_action("teachers", "edit")
      should allow_action("teachers", "update") 
      should_not allow_action("teachers", "destroy")
    end
  end
  
  describe "as admin" do
    subject { Permissions.permission_for(FactoryGirl.build(:user, type: "Administrator")) }
    it { should allow_action("anything", "here") }
  end
end