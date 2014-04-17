class Position < ActiveRecord::Base
  include PositionsHelper

  belongs_to :applicant
  belongs_to :course
  belongs_to :professor
  accepts_nested_attributes_for :professor, reject_if: :check_professor

  before_create { self.identifier = new_positions_identifier }
  before_create { self.application_status = 0 }
  before_save { status_update }

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
    def status_update
      return unless self.application_status_changed?
      self.applicant.email_acceptance if self.application_status == 3
    end

    def static_identifier
      errors[:identifier] = "can't be changed" if self.identifier_changed?
    end

    def check_professor(prof_attr)
      if prof = Professor.find_by_email(prof_attr['email'])
        self.professor = prof
        return true
      else
        return false
      end
    end
end
