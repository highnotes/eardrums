class CreateRolls < ActiveRecord::Migration
  def change
    create_table :rolls do |t|
      t.integer :student_id
      t.references :course, index: true
      t.references :branch, index: true
      t.integer :duration
      t.integer :attended
      t.date :to_end_on
      t.date :ended_on

      t.timestamps
    end
  end
end
