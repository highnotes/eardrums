class AddBranchToUsers < ActiveRecord::Migration
  def change
    add_column :users, :branch_id, :integer
    add_index :users, :branch_id
  end
end
