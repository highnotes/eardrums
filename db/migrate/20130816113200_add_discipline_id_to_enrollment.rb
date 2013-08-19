class AddDisciplineIdToEnrollment < ActiveRecord::Migration
  def change
    add_column :enrollments, :discipline_id, :integer
  end
end
