class AvailableTimesBelongsToApplicant < ActiveRecord::Migration
  def change
    add_belongs_to(:available_times, :applicant)
  end
end
