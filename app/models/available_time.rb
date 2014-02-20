class AvailableTime < ActiveRecord::Base
  belongs_to :applicant

  def day_name
    Date::DAYNAMES[day]
end
end
