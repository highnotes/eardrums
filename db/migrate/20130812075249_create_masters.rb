class CreateMasters < ActiveRecord::Migration
  def change
    create_table :masters do |t|
      t.string :group
      t.integer :index
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
