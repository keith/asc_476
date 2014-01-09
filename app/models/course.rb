class Course < ActiveRecord::Base
  before_save { designator.upcase! }

  COURSE_REGEX = /\A([a-z]){4}\z/i
  validates :designator, presence: true, format: { with: COURSE_REGEX }
  validates_presence_of :number
  validates_uniqueness_of :number, { scope: :designator, message: "Course has already been added" }

  def hidden?
    self.hidden || self.disabled
  end

  def disabled?
    self.disabled
  end
end
