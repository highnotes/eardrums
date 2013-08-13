ActiveAdmin.register Franchise do
  index do
    column :name
    column :franchisees
    column :phones
    column :emails
    column :address
    column :city
    column :state
    column :country
    default_actions
  end
  
  filter :name
  filter :franchisees
  filter :phones
  filter :emails
  filter :address
  filter :city
  filter :state
  filter :country
  
  form do |f|
    f.semantic_errors *f.object.errors.keys
  
    f.inputs "Details" do
      f.input :name
      f.input :franchisees
      f.input :phones
      f.input :emails
      f.input :address
      f.input :city
      f.input :state
      f.input :country, as: :string
    end
    f.actions
  end
  
  controller do
    def create
      @franchise = Franchise.new(params[:franchise].merge(created_by: current_user.id, modified_by: current_user.id))
      create! do |format|
        format.html { redirect_to admin_franchises_path }
      end
    end
    
    def update
      @franchise = Franchise.find(params[:id])
      @franchise.modified_by = current_user.id
      update! do |format|
        format.html { redirect_to admin_franchises_path }
      end
    end
  end
end
