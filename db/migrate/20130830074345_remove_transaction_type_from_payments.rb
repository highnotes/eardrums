class RemoveTransactionTypeFromPayments < ActiveRecord::Migration
  def change
    remove_column :payments, :transaction_type
  end
end
