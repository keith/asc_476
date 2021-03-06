class Course < ActiveRecord::Base
  has_many :positions

  before_create :default_values

  COURSE_REGEX = /\A([a-z])*\z/i
  validates :designator, presence: true,
    format: { with: COURSE_REGEX }, length: { is: 4 }

  validates_uniqueness_of :designator, scope: :number, case_sensitive: false,
    message: 'this course has already been added'

  validates :number, presence: true

  def full_name
    name = "#{ designator } #{ number }"
    name.prepend('- ') if self.hidden
    name
  end

  private
    def default_values
      self.hidden = false
      self.designator.upcase!
      nil
    end
end
