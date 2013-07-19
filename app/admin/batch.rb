ActiveAdmin.register Batch do
  filter :discipline
  filter :teacher, :collection => User.where(role: 'teacher')
  filter :status
  filter :created_at
  filter :updated_at
  filter :day, as: :select, collection: Date::DAYNAMES
  
  form do |f|
    f.inputs "Details" do
      f.input :discipline
      f.input :teacher, collection: User.where(role: 'teacher')
      f.input :status
      f.input :day, as: :select, collection: Date::DAYNAMES.each_with_index.map { |x,i| [x, i] }
      f.input :start_time
      f.input :duration, label: "Duration (in hours)"
    end
    f.actions
  end
end
