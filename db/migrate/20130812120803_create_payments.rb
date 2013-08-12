class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :mode
      t.string :transaction
      t.decimal :registration_fee
      t.decimal :course_fee
      t.decimal :total
      t.string :narration
      t.string :status
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
