class Professor < ActiveRecord::Base
  include ProfessorsHelper

  EMAIL_REGEX = /\A\w+\z/

  before_create { self.identifier = new_professor_identifier }
  before_save { email.downcase! }
  has_many :positions
  validate :static_identifier, on: :update
  validates_presence_of :name
  validates :email, presence: true, uniqueness: { case_sensitive: false },
    format: { with: EMAIL_REGEX }

  def to_param
    identifier
  end

  private

    def static_identifier
      errors[:identifier] = "can't be changed" if self.identifier_changed?
    end
end
