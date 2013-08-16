class AddAuditTrailToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :created_by, :integer
    add_column :courses, :modified_by, :integer
  end
end
