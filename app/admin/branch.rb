ActiveAdmin.register Branch do
  index do
    column :name
    column :subdomain
    column :status
    column :email
    column :franchise
    default_actions
  end
  
  filter :name
  filter :subdomain
  filter :status
  filter :email
  filter :address
  filter :city
  filter :state
  filter :country
  filter :phones
  filter :franchise
  
  form do |f|
    f.semantic_errors *f.object.errors.keys
  
    f.inputs "Details" do
      f.input :name
      f.input :subdomain
      f.input :status
      f.input :email
      f.input :franchise
      f.input :address
      f.input :city
      f.input :state
      f.input :country, as: :string
      f.input :phones
    end
    f.actions
  end
  
  controller do
    def create
      @branch = Branch.new(params[:branch].merge(created_by: current_user.id, modified_by: current_user.id))
      create! do |format|
        format.html { redirect_to admin_branches_path }
      end
    end
    
    def update
      @branch = Branch.find(params[:id])
      @branch.modified_by = current_user.id
      update! do |format|
        format.html { redirect_to admin_branches_path }
      end
    end
  end 
end
