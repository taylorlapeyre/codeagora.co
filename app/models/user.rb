class User < ActiveRecord::Base
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }

  before_save { self.email = email.downcase }

  def self.find_or_create_by_omniauth(auth)
    user = User.find_by_email(auth['info']['email'])
    unless user
      new_password = SecureRandom.hex(16)
      user = {
        username: auth["info"]["email"],
        email: auth["info"]["email"],
        password: new_password,
        password_confirmation: new_password
      }
      create! user
    end
  end
end
