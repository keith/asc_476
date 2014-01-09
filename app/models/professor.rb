class Professor < ActiveRecord::Base
  include ProfessorsHelper

  before_save { email.downcase! }
  before_validation { self.identifier = new_professor_identifier }

  validates_presence_of :name
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :identifier, { presence: true, uniqueness: true }
end
