class RemoveTypeFromBranches < ActiveRecord::Migration
  def change
    remove_column :branches, :type
  end
end
