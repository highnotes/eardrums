class CreateBatchSchedules < ActiveRecord::Migration
  def change
    create_table :batch_schedules do |t|
      t.references :batch, index: true
      t.string :status
      t.date :scheduled_on

      t.timestamps
    end
  end
end
