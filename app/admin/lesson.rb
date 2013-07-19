ActiveAdmin.register Lesson do
  index do
    column :course
    column :index
    column :name
    column :updated_at
    default_actions
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :course_id, :label => 'Course', :as => :select, :collection => Course.all.map{|c| ["#{c.discipline.name}-#{c.name}", c.id]}
      f.input :index
      f.input :name
      f.input :description
    end
    f.actions
  end
end
