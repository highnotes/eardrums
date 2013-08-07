class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.string :subdomain
      t.string :status
      t.string :type
      t.date :opened_on
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :phones
      t.integer :franchise_id
      t.date :closed_on

      t.timestamps
    end
    add_index :branches, :franchise_id
  end
end
