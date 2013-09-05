class AddCapacityToBatch < ActiveRecord::Migration
  def change
    add_column :batches, :capacity, :integer
  end
end
