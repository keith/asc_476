class Email < ActiveRecord::Base
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :reply_to, presence: true, format: { with: EMAIL_REGEX, message: 'email address is invalid' }
end
