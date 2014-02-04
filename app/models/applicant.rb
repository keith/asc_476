class Applicant < ActiveRecord::Base
  include ApplicantsHelper

  EMAIL_REGEX = /\A\w+\z/i

  has_many :available_times
  has_many :positions
  accepts_nested_attributes_for :positions

  before_create { self.identifier = new_applicant_identifier }
  before_save { email.downcase! }

  validate :gpa_update, on: :update
  validate :static_identifier, on: :update
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates_presence_of :name

  def to_param
    identifier
  end

  private

    def gpa_update
      self.gpa_timestamp = Time.now if self.gpa_changed?
    end

    def static_identifier
      errors[:identifier] = "can't be changed" if self.identifier_changed?
    end
end
