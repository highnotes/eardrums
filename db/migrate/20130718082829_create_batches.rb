class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :status
      t.references :discipline, index: true
      t.integer :teacher_id, index: true

      t.timestamps
    end
  end
end
