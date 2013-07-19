ActiveAdmin.register Course do
  index do
    column :discipline
    column :level
    column :name
    column :description
    column :duration
    column :status
    column :price
    column :tag_list
    default_actions
  end
  
  show do |ad|
    attributes_table do
      row :id
      row :name
      row :description
      row :duration
      row :price
      row :status
      row :created_at
      row :updated_at
      row :level
      row :discipline
      row :teacher
      row :tag_list
    end
  end
  
  filter :discipline
  filter :teacher, :collection => User.where(role: 'teacher')
  filter :level
  filter :lessons
  filter :name
  filter :status
  
  form do |f|
    f.inputs "Details" do
      f.input :discipline
      f.input :level
      f.input :name
      f.input :description
      f.input :duration, label: "Duration (in weeks)"
      f.input :status
      f.input :price
      f.input :tag_list, label: "Tags (separated by commas)"
      f.input :teacher, :collection => User.where(role: 'teacher')
    end
    f.actions
  end
end
