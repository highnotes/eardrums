require 'spec_helper'

describe TeachersController do
  context "as Staff" do
    login_staff_before_each
  
    describe "GET 'new'" do
      it "returns http success" do
        get 'new'
        response.should be_success
      end
    
      it "renders the :new view" do
        get 'new'
        response.should render_template :new
      end
    end
  end
  
  context "as Guest or User", focus: true do
    describe "GET 'show'" do
      it "returns http success" do
        @teacher = FactoryGirl.create(:teacher)
        get 'show', id: @teacher.id
        expect(response).to render_template("show")
      end
    end
  end
end