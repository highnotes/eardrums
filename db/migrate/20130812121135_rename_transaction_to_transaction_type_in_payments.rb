class RenameTransactionToTransactionTypeInPayments < ActiveRecord::Migration
  def change
    rename_column :payments, :transaction, :transaction_type
  end
end
