class User < ActiveRecord::Base
  has_secure_password

  before_save { email.downcase! }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :level, presence: true, inclusion: { in: 0..3 }

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(blob)
    Digest::SHA1.hexdigest(blob.to_s)
  end

  def self.find_all_except(user)
    User.find(:all, conditions: ['id != ?', user.id])
  end

  def delete_remember_token
    self.update_attribute(:remember_token, nil)
  end

  def admin?
    self.level == 0
  end

  def moderator?
    self.level <= 2
  end

  def set_temporary_password
    token = User.new_token
    self.password = token
    self.password_confirmation = token
  end
end

