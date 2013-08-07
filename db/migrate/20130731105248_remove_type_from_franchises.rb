class RemoveTypeFromFranchises < ActiveRecord::Migration
  def change
    remove_column :franchises, :type
  end
end
