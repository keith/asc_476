class CreateAvailableTimes < ActiveRecord::Migration
  def change
    create_table :available_times do |t|
      t.integer :day
      t.time :start
      t.time :finish

      t.timestamps
    end
  end
end
