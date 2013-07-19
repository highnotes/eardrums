class CreateBatchesAndUsers < ActiveRecord::Migration
  def change
    create_table :batches_users, id: false do |t|
      t.belongs_to :batch
      t.belongs_to :user
    end
  end
end
