class AddIdentifierToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :identifier, :string
  end
end
