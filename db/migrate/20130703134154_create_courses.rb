class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.integer :duration
      t.decimal :price
      t.string :status

      t.timestamps
    end
  end
end
