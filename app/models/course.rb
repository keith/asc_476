class Course < ActiveRecord::Base
  has_many :positions

  before_create :default_values
  before_save :save_action

  COURSE_REGEX = /\A([a-z])*\z/i
  validates :designator, presence: true, format: { with: COURSE_REGEX }, length: { is: 4 }
  validates_uniqueness_of :designator, scope: :number, case_sensitive: false, message: 'this course has already been added'
  validates :number, presence: true, length: { is: 3 }, numericality: { only_integer: true }

  def hidden?
    !!self.hidden || disabled?
  end

  def disabled?
    !!self.disabled
  end

  def full_name
    if self.hidden
      "-#{ designator } #{ number }"
    else
      "#{ designator } #{ number }"
    end
  end

  private
    def default_values
      self.hidden ||= false
      self.disabled ||= false
      self.designator.upcase!
      nil
    end

    def save_action
      self.hidden = true if disabled?
    end
end
