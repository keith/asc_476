class Applicant < ActiveRecord::Base
  include ApplicantsHelper

  EMAIL_REGEX = /\A\w+\z/

  has_many :positions, before_add: :initialize_position, dependent: :destroy
  accepts_nested_attributes_for :positions , reject_if: :reject_position?

  before_create { self.identifier = new_applicant_identifier }
  before_save { email.downcase! }

  validate :gpa_update, on: :update
  validate :static_identifier, on: :update
  validates :phone_number, length: { minimum: 10 }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
    format: { with: EMAIL_REGEX }
  validates :class_standing, on: :update, inclusion: { in: 0...Standing.names.count }
  validates_presence_of :name
  validates_presence_of :wuid

  # For will_paginate
  self.per_page = 5

  def to_param
    identifier
  end

  def send_emails
    ApplicantMailer.account_email(self).deliver
    self.positions.each do |position|
      next if position.professor_emailed
      professor = position.professor
      ProfessorMailer.pending_recommendation(professor).deliver
      position.professor_emailed = true
      position.save
    end
  end

  def email_acceptance
    ApplicantMailer.acceptance_email(self).deliver
  end

  def self.filtered_with_params(p)
    Applicant.all
  end

  private

    def gpa_update
      self.gpa_timestamp = Time.now if self.gpa_changed?
    end

    def static_identifier
      errors[:identifier] = "can't be changed" if self.identifier_changed?
    end

    def initialize_position(position)
      position.applicant ||= self
    end

    # Ignore extra fields in the form
    def reject_position?(pos_attr)
      pos_attr['course_id'].blank? and
      pos_attr['professor_attributes']["name"].blank? and
      pos_attr['professor_attributes']['email'].blank? or
      duplicate_position_course?(pos_attr)
    end

    def duplicate_position_course?(position_attr)
      if self.positions.find_by_course_id(position_attr['course_id'])
        return true
      else
        return false
      end
    end
end
