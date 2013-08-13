class AddAuditTrailToBatch < ActiveRecord::Migration
  def change
    add_column :batches, :created_by, :integer
    add_column :batches, :modified_by, :integer
  end
end
