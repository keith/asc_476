class AddHashToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :identifier, :string
  end
end
