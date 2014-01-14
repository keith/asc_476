class Course < ActiveRecord::Base
  before_save :save_action

  COURSE_REGEX = /\A([a-z])*\z/i
  validates :designator, presence: true, format: { with: COURSE_REGEX }, length: { is: 4 }
  validates :number, presence: true, uniqueness: { scope: :designator }

  def hidden?
    self.hidden || self.disabled
  end

  def disabled?
    self.disabled
  end

  private
    def save_action
      designator.upcase!
      self.hidden = true if self.disabled
    end
end

