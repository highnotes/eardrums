ActiveAdmin.register Installment do
  belongs_to :course
  
  index title: proc { "#{Course.find(params[:course_id]).name} - Installments" } do
    column :index
    column :no_of_installments
    column :interval
    column :amount
    default_actions
  end
  
  filter :index
  filter :no_of_installments
  filter :interval
  filter :amount
  
  form do |f|
    f.inputs "Details" do
      f.input :course
      f.input :index
      f.input :no_of_installments
      f.input :interval, label: "Interval (in weeks)"
      f.input :amount
    end
    f.actions
  end
  
  controller do
    def create
      @installment = Installment.new(params[:installment].merge(created_by: current_user.id, modified_by: current_user.id))
      create! do |format|
        format.html { redirect_to admin_course_installments_path(@installment.course) }
      end
    end
    
    def update
      @installment = Installment.find(params[:id])
      @installment.modified_by = current_user.id
      update! do |format|
        format.html { redirect_to admin_course_installments_path(@installment.course) }
      end
    end
  end 
end
