class AddInterviewedToApplicant < ActiveRecord::Migration
  def change
    add_column :applicants, :interviewed, :boolean
  end
end
