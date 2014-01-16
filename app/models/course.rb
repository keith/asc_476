class Course < ActiveRecord::Base
  has_many :positions

  before_create :default_values
  before_save :save_action

  COURSE_REGEX = /\A([a-z])*\z/i
  validates :designator, presence: true, format: { with: COURSE_REGEX }, length: { is: 4 }
  validates :number, presence: true, uniqueness: { scope: :designator }

  def hidden?
    !!self.hidden || disabled?
  end

  def disabled?
    !!self.disabled
  end

  def full_name
    "#{ designator } #{ number }"
  end

  private
    def default_values
      self.hidden ||= false
      self.disabled ||= false
      nil
    end

    def save_action
      designator.upcase!
      self.hidden = true if disabled?
    end
end

