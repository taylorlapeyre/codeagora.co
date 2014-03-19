class User < ActiveRecord::Base
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }

  before_save { self.email = email.downcase }

	def self.find_by_omniauth(auth)
		user = User.find_by_email(auth["info"]["email"])
		user ? user : User.create_with_omniauth(auth)
	end

	def self.create_with_omniauth(auth)
		require 'securerandom'
		create! do |user|
			user.username = auth["info"]["email"]
			user.email = auth["info"]["email"]
			user.password = SecureRandom.hex(16)
			user.password_confirmation = user.password
		end
	end

end
