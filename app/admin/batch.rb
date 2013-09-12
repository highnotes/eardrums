ActiveAdmin.register Batch do
  # TODO Refer to STATUSES variable within Batch model
  STATUSES = %w[Active Upcoming Inactive Retired]
  
  timings = [ 
              "6.00", "6.15", "6.30", "6.45", "7.00", "7.15", "7.30", "7.45", 
              "8.00", "8.15", "8.30", "8.45", "9.00", "9.15", "9.30", "9.45", 
              "10.00", "10.15", "10.30", "10.45", "11.00", "11.15", "11.30", "11.45", 
              "12.00", "12.15", "12.30", "12.45", "13.00", "13.15", "13.30", "13.45", 
              "14.00", "14.15", "14.30", "14.45", "15.00", "15.15", "15.30", "15.45", 
              "16.00", "16.15", "16.30", "16.45", "17.00", "17.15", "17.30", "17.45", 
              "18.00", "18.15", "18.30", "18.45", "19.00", "19.15", "19.30", "19.45", 
              "20.00", "20.15", "20.30", "20.45", "21.00"
            ]
  
  filter :discipline
  filter :teacher, :collection => User.where(type: 'Teacher')
  filter :status, as: :select, collection: STATUSES
  filter :day, as: :select, collection: Date::DAYNAMES
  filter :start_time, as: :select, collection: timings
  filter :created_at
  filter :updated_at
  
  form do |f|
    f.inputs "Details" do
      f.input :discipline
      f.input :teacher, collection: User.where(type: 'Teacher')
      f.input :status, as: :select, collection: STATUSES.each.map { |x| [x.humanize, x] }
      f.input :day, as: :select, collection: Date::DAYNAMES.each.map { |x| [x, x] }
      f.input :start_time, as: :select, collection: timings.each.map { |x| [x, x] }
      f.input :duration, label: "Duration (in hours)"
    end
    f.actions
  end
  
  controller do
    def create
      @batch = Batch.new(params[:batch].merge(created_by: current_user.id, modified_by: current_user.id))
      create! do |format|
        format.html { redirect_to admin_batches_path }
      end
    end
    
    def update
      @batch = Batch.find(params[:id])
      @batch.modified_by = current_user.id
      update! do |format|
        format.html { redirect_to admin_batches_path }
      end
    end
  end
end
