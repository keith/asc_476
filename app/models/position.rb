class Position < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :course
end
