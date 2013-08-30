class ChangeTimeFormatsInBatch < ActiveRecord::Migration
  def change
    change_column :batches, :day, :string
    change_column :batches, :start_time, :string
  end
end
