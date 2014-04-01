class ApplicantsChangeClassStandingToInteger < ActiveRecord::Migration
  def change
    change_column :applicants, :class_standing, :integer
  end
end
