require 'spec_helper'

describe StudentsController do
  context "as Staff" do
    login_staff_before_each
    
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
        student = FactoryGirl.create(:student)
        get 'index'
        assigns(:students).should include(student)
      end
    end
  end
  
  context "as Guest or User" do
    describe "GET 'show'" do
      it "returns http success" do
        @student = FactoryGirl.create(:student)
        get 'show', id: @student.id
        expect(response).to render_template("show")
      end
    end
  end
end