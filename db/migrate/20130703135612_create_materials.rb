class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.string :type
      t.references :lesson, index: true

      t.timestamps
    end
  end
end
