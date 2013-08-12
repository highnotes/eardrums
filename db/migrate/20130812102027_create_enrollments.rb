class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :application_no
      t.string :membership_no
      t.references :branch, index: true
      t.references :course, index: true
      t.references :batch, index: true
      t.integer :student_id, index: true
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.date :enrolled_on
      t.integer :duration
      t.string :status
      t.decimal :registration_fee
      t.decimal :course_fee
      t.decimal :total
      t.string :mode
      t.string :details
      t.integer :created_by
      t.integer :modified_by
      t.string :txn_status
      t.string :reversal_reason_id
      t.date :date_of_birth
      t.string :gender
      t.text :experience
      t.text :additional_courses
      t.integer :source_id

      t.timestamps
    end
  end
end
