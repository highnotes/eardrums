require 'spec_helper'

describe PaymentsController do
  describe "GET 'index'" do
    login_staff_before_each
    
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
    
    it "renders the :index view" do
      get 'index'
      expect(response).to render_template("index")
    end
    
    it "assigns @payments" do
      payment = FactoryGirl.create(:payment)
      get :index
      expect(assigns(:payments)).to include(payment)
    end
  end
end