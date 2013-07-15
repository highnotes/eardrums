require 'spec_helper'

describe CoursesController do
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    
    it "renders the :index view" do
      get 'index'
      response.should render_template :index
    end
    
    it "collects all disciplines" do
      discipline = FactoryGirl.create(:discipline)
      get 'index'
      assigns(:disciplines).should include(discipline)
    end
    
    it "collects all courses of discipline" do
      course = FactoryGirl.create(:course)
      get 'index'
      assigns(:discipline).courses.should include(course)
    end
  end
end
