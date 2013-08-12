class RenameUpdatedByToModifiedByInPayments < ActiveRecord::Migration
  def change
    rename_column :payments, :updated_by, :modified_by
  end
end
