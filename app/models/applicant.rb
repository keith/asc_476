class Applicant < ActiveRecord::Base
  include ApplicantsHelper

  EMAIL_REGEX = /\A\w+\z/

  has_many :available_times
  has_many :positions
  accepts_nested_attributes_for :positions, :available_times

  before_create { self.identifier = new_applicant_identifier }
  before_save { email.downcase! }

  validate :gpa_update, on: :update
  validate :static_identifier, on: :update
  validates :phone_number, length: { minimum: 10 }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
    format: { with: EMAIL_REGEX }
  validates :class_standing, on: :update, inclusion: { in: 0...Standing.names.count }
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
