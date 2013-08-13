class AddAuditTrailToBranch < ActiveRecord::Migration
  def change
    add_column :branches, :created_by, :integer
    add_column :branches, :modified_by, :integer
  end
end
