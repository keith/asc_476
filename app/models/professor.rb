class Professor < ActiveRecord::Base
  include ProfessorsHelper

  before_create { self.identifier = new_professor_identifier }
  before_save { email.downcase! }

  validate :static_identifier, on: :update
  validates_presence_of :name
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  private

    def static_identifier
      errors[:identifier] = "can't be changed" if self.identifier_changed?
    end
end
