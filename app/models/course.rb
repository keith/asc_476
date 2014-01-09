class Course < ActiveRecord::Base
  before_save { designator.upcase! }

  validates_presence_of :designator
  validates_presence_of :number
  validates_format_of :designator, with: /\A([a-zA-Z]){4}\z/
  validates_uniqueness_of :number, { scope: :designator, message: "Course has already been added" }

  def hidden?
    self.hidden || self.disabled
  end

  def disabled?
    self.disabled
  end
end
