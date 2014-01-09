class AddHashToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :hash, :string
  end
end
