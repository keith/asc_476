class AddDefaultValueToInterviewed < ActiveRecord::Migration
  def change
    change_column :applicants, :interviewed, :boolean, :default => false
  end
end
