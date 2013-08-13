class CreateInstallments < ActiveRecord::Migration
  def change
    create_table :installments do |t|
      t.references :course, index: true
      t.integer :index
      t.integer :no_of_installments
      t.integer :interval
      t.decimal :amount
      t.integer :created_by
      t.integer :modified_by

      t.timestamps
    end
  end
end
