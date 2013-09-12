class AddStudentDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :membership_no, :string
    add_column :users, :name, :string
    add_column :users, :batch_id, :integer
    add_column :users, :phone, :string
    add_column :users, :gender, :string
    
    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end
