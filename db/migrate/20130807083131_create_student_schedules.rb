class CreateStudentSchedules < ActiveRecord::Migration
  def change
    create_table :student_schedules do |t|
      t.integer :student_id, index: true
      t.references :batch_schedule, index: true
      t.date :attended_on

      t.timestamps
    end
  end
end
