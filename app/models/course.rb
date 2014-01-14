class Course < ActiveRecord::Base
  before_save { designator.upcase! }

  COURSE_REGEX = /\A([a-z])*\z/i
  validates :designator, presence: true, format: { with: COURSE_REGEX }, length: { is: 4 }
  validates :number, presence: true, uniqueness: { scope: :designator }

  def hidden?
    self.hidden || self.disabled
  end

  def disabled?
    self.disabled
  end
end

