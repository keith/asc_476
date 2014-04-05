class AddEmailedToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :professor_emailed, :boolean, default: false
  end
end
