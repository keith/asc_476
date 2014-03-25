class Position < ActiveRecord::Base
  include PositionsHelper

  belongs_to :applicant
  belongs_to :course
  belongs_to :professor
  accepts_nested_attributes_for  :professor

  before_create { self.identifier = new_positions_identifier }

  validate :static_identifier, on: :update
  validates :application_status, inclusion: { in: 0...Status.names.count }
  # TODO: Validate status integer range

  def to_param
    identifier
  end
  # TODO: Default status integer to something
  private
    def static_identifier
      errors[:identifier] = "can't be changed" if self.identifier_changed?
    end
end
