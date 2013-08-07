class CreateCoursesAndBranches < ActiveRecord::Migration
  def change
    create_table :branches_courses, id: false do |t|
      t.belongs_to :branch
      t.belongs_to :course
    end
  end
end
