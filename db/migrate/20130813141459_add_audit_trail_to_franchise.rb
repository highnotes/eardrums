class AddAuditTrailToFranchise < ActiveRecord::Migration
  def change
    add_column :franchises, :created_by, :integer
    add_column :franchises, :modified_by, :integer
  end
end
