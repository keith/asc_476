class Course < ActiveRecord::Base
  before_save { designator.upcase! }

  validates_presence_of :designator
  validates_presence_of :number
  validates_uniqueness_of :designator, case_sensitive: false, scope: :number

  def hidden?
    self.hidden || self.disabled
  end

  def disabled?
    self.disabled
  end
end
