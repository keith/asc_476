class AddHashToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :hash, :string
  end
end
