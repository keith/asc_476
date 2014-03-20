class Position < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :course
  belongs_to :professor
  accepts_nested_attributes_for  :professor

  # TODO: Default status integer to something
end
