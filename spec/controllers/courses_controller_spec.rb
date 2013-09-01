require 'spec_helper'

describe CoursesController do
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
    
    it "renders the :index view" do
      get 'index'
      expect(response).to render_template("index")
    end
    
    it "collects all disciplines" do
      discipline = FactoryGirl.create(:discipline)
      get 'index'
      assigns(:disciplines).should include(discipline)
    end
    
    it "shows a course's details" do
      course = FactoryGirl.create(:course)
      get 'show', id: course.id
      expect(response).to render_template("show")
    end
  end
end
