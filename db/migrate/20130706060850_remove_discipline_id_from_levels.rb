class RemoveDisciplineIdFromLevels < ActiveRecord::Migration
  def change
    remove_column :levels, :discipline_id
  end
end
