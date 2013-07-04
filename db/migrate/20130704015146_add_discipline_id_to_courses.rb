class AddDisciplineIdToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :discipline_id, :integer
  end
end
