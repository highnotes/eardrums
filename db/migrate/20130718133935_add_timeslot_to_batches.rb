class AddTimeslotToBatches < ActiveRecord::Migration
  def change
    add_column :batches, :day, :integer
    add_column :batches, :start_time, :time
    add_column :batches, :duration, :integer
  end
end
