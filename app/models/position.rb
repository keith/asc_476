class Position < ActiveRecord::Base
  include PositionsHelper

  belongs_to :applicant
  belongs_to :course
  belongs_to :professor
  accepts_nested_attributes_for :professor

  before_create { self.identifier = new_positions_identifier }
  before_create { self.application_status = 0 }

  # TODO: finish validations
  validate :static_identifier, on: :update
  validates :application_status, on: :update, inclusion: { in: 0...Status.names.count }
  validates_presence_of :applicant
  validates_presence_of :professor
  validates_presence_of :course

  def to_param
    identifier
  end

  private
    def static_identifier
      errors[:identifier] = "can't be changed" if self.identifier_changed?
    end
end
