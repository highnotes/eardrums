require 'spec_helper'

describe StaffsController do
  context "as Admin" do
    login_admin_before_each
  
    describe "GET 'show'" do
      it "returns http success" do
        @staff = FactoryGirl.create(:staff)
        get 'show', id: @staff.id
        expect(response).to render_template("show")
        assigns(:staff).should eq(@staff)
      end
    end
  end
end