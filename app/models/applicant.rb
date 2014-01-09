class Applicant < ActiveRecord::Base
  include ApplicantsHelper

  has_many :available_times

  before_create { self.identifier = new_applicant_identifier }
  before_save { email.downcase! }

  validate :gpa_update, on: :update
  validate :static_identifier, on: :update
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_presence_of :name

  private

    def gpa_update
      if self.gpa_changed?
        self.gpa_timestamp = Time.now
      end
    end

    def static_identifier
      errors[:identifier] = "can't be changed" if self.identifier_changed?
    end
end
