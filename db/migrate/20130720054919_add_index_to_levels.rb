class AddIndexToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :index, :integer
  end
end
