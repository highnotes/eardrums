class AddIndexToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :index, :integer
  end
end
