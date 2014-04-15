class Applicant < ActiveRecord::Base
  include ApplicantsHelper

  EMAIL_REGEX = /\A\w+\z/

  has_many :positions, dependent: :destroy
  accepts_nested_attributes_for :positions , reject_if: :reject_posts

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

  private

    def gpa_update
      self.gpa_timestamp = Time.now if self.gpa_changed?
    end

    def static_identifier
      errors[:identifier] = "can't be changed" if self.identifier_changed?
    end
  
    def reject_posts(attributed)
      attributed['course_id'].blank? and 
          attributed['professor_attributes']["name"].blank? and attributed['professor_attributes']['email'].blank?
    end
end
