class AddIndexToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :index, :integer
  end
end
