class RemoveAvailableTimes < ActiveRecord::Migration
  def change
    drop_table :available_times
  end
end
