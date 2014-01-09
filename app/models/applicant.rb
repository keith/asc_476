class Applicant < ActiveRecord::Base
  has_many :available_times
end
