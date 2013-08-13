class CreatePaymentSchedules < ActiveRecord::Migration
  def change
    create_table :payment_schedules do |t|
      t.references :enrollment, index: true
      t.date :due_on
      t.string :status
      t.references :payment, index: true
      t.integer :created_by
      t.integer :modified_by

      t.timestamps
    end
  end
end
