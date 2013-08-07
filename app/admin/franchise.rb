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
end
