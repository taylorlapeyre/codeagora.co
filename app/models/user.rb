class User < ActiveRecord::Base
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }

  before_save { self.email = email.downcase }

end
