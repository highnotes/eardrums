require 'spec_helper'

describe EnrollmentsController do
  before(:all) do
    @branch = FactoryGirl.create(:branch)
    @course = FactoryGirl.create(:course)
    @discipline = FactoryGirl.create(:discipline)
    @batch = FactoryGirl.create(:batch)
    @student = FactoryGirl.create(:student)
    @enrollment_attrs = FactoryGirl.build(:enrollment, branch_id: @branch.id, course_id: @course.id,
                        discipline_id: @discipline.id, batch_id: @batch.id, student_id: @student.id).attributes
  end
  
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
    
      it "collects all disciplines" do
        discipline = FactoryGirl.create(:discipline)
        get 'new'
        assigns(:disciplines).should include(discipline)
      end
      
      it "collects all branches" do
        branch = FactoryGirl.create(:branch)
        get 'new'
        assigns(:branches).should include(branch)
      end
    end
    
    describe "POST 'create'" do
      context "on success" do
        it "saves the enrollment" do
          expect {
            post 'create', enrollment: @enrollment_attrs
          }.to change{Enrollment.count}.by(1)
        end
        
        it "routes to root_url" do
          post 'create', enrollment: @enrollment_attrs
          expect(response).to redirect_to root_url
        end
      end
      
      context "on error" do
        it "does not save the enrollment" do
          expect {
            post 'create', enrollment: @enrollment_attrs.except("name")
          }.not_to change{Enrollment.count}
        end
        
        it "re-renders new template" do
          post 'create', enrollment: @enrollment_attrs.except("name")
          expect(response).to render_template :new
        end
      end
      
    end
    
    describe "GET reverse" do
      before { 
        @enrollment = Enrollment.build(@enrollment_attrs) 
        @enrollment.save!        
      }
      subject { @enrollment }
      
      context "on success" do
        it "calls reverse on enrollment" do
          @enrollment.should_receive(:reverse!).and_return(true)
          @enrollment.reverse!
        end
        
        it "calls reverse on payment" do
          Payment.any_instance.should_receive(:reverse!).and_return(true)
          @enrollment.reverse!
        end
        
        it "should show notification successfully reversed" do
          put :reverse, id: @enrollment.id, enrollment: {}
          expect(response).to be_redirect
          expect(response).to redirect_to enrollments_path
          expect(flash[:notice]).to eq("Successfully reversed!")
        end
      end
      
      context "on failure" do
        it "should show notification Error in Enrollment reversal"
      end
    end
  end
end