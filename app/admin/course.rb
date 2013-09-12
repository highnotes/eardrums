ActiveAdmin.register Course do
  STATUSES = %w[Active Upcoming Inactive Retired]
  
  sidebar "Course Details", :only => :show do
    ul do
      li link_to("Installments", admin_course_installments_path(course))
    end
  end
  
  index do
    column :discipline
    column :level
    column :index
    column :name
    column :code
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
      row :code
      row :description
      row :duration
      row :price
      row :status
      row :created_at
      row :updated_at
      row :index
      row :level
      row :discipline
      row :teacher
      row :tag_list
    end
  end
  
  filter :discipline
  filter :teacher, :collection => User.where(type: 'Teacher')
  filter :level
  filter :lessons
  filter :name
  filter :code
  filter :status
  
  form do |f|
    f.inputs "Details" do
      f.input :discipline
      f.input :level
      f.input :index
      f.input :name
      f.input :code
      f.input :description
      f.input :duration, label: "Duration (in weeks)"
      f.input :status, as: :select, collection: STATUSES
      f.input :price
      f.input :tag_list, label: "Tags (separated by commas)"
      f.input :teacher, :collection => User.where(type: 'Teacher')
    end
    f.actions
  end
  
  controller do
    def create
      @course = Course.new(params[:course].merge(created_by: current_user.id, modified_by: current_user.id))
      create! do |format|
        format.html { redirect_to admin_courses_path }
      end
    end
    
    def update
      @course = Course.find(params[:id])
      @course.modified_by = current_user.id
      update! do |format|
        format.html { redirect_to admin_courses_path }
      end
    end
  end 
end