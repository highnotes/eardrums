class AddTransactableToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :transactable, polymorphic: true, index: true
  end
end
