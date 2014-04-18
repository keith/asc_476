class Professor < ActiveRecord::Base
  include ProfessorsHelper

  EMAIL_REGEX = /\A\w+\z/

  before_create { self.identifier = new_professor_identifier }
  before_save { email.downcase!; email_changed }
  has_many :positions
  validate :static_identifier, on: :update
  validates_presence_of :name
  validates :email, presence: true, uniqueness: { case_sensitive: false },
    format: { with: EMAIL_REGEX }

  def to_param
    identifier
  end

  def pending_positions
    self.positions.select do |position|
      return false unless position
      position.professor_verdict.nil?
    end
  end

  private

    def static_identifier
      errors[:identifier] = "can't be changed" if self.identifier_changed?
    end

    def email_changed
      return unless self.persisted?
      return if self.email.downcase == self.email_was.downcase
      ProfessorMailer.pending_recommendation(self).deliver
      true
    end
end