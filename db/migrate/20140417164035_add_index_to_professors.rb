class AddIndexToProfessors < ActiveRecord::Migration
  def change
    add_index :professors, :email, unique: true
  end
end
