class AddHashToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :identifier, :string
  end
end
