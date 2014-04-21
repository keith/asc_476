class Applicant < ActiveRecord::Base
  include ApplicantsHelper

  EMAIL_REGEX = /\A\w+\z/

  has_many :positions, before_add: :initialize_position, dependent: :destroy
  accepts_nested_attributes_for :positions , reject_if: :reject_position?

  before_create { self.identifier = new_applicant_identifier }
  before_save { email.downcase! }
  after_validation :duplicate_email

  validate :gpa_update, on: :update
  validate :static_identifier, on: :update
  validates :phone_number, length: { minimum: 10 }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
    format: { with: EMAIL_REGEX,
              message: 'is invalid (only enter before the @ symbol)' }
  validates :class_standing, inclusion: { in: 0...Standing.names.count,
                                          message: 'is not valid' }
  validates_presence_of :name
  validates_presence_of :wuid

  # For will_paginate
  self.per_page = 25

  def to_param
    identifier
  end

  def send_emails(update=false)
    ApplicantMailer.account_email(self).deliver unless update
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

  def comma_courses
    courses = ''
    self.positions.each do |position|
      courses += "#{ position.course.full_name } (#{ Status.for_number(position.application_status).name }), "
    end

    courses.chomp(', ')
  end

  def self.filtered_with_params(p)
    Applicant.all
  end

  private

    def duplicate_email
      return true if self.errors.empty?
      existing = Applicant.find_by_email(self.email)
      unless existing == self
        error = 'application already exists for this Winthrop username. Check your email for the link to edit your existing application.'
        begin
          ApplicantMailer.account_email(existing).deliver
        rescue
          error += 'The email failed to send. Please contact the ASC for assistance.'
        end

        errors[:another] = error
        false
      end
    end

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
      return false if self.positions.count <= 1
      pos_attr['course_id'].blank? and
      pos_attr['professor_attributes']["name"].blank? and
      pos_attr['professor_attributes']['email'].blank? or
      duplicate_position_course?(pos_attr)
    end

    def duplicate_position_course?(position_attr)
      !!self.positions.find_by_course_id(position_attr['course_id'])
    end
end
