class User < ActiveRecord::Base
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }


  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(blob)
    Digest::SHA1.hexdigest(blob.to_s)
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
end
