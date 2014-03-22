class User < ActiveRecord::Base
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :snippets
  has_many :comments
  has_many :votes

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }

  before_save { self.email = email.downcase }

  def self.find_or_create_by_omniauth(auth)
    user = User.find_by_email(auth['info']['email'])

    unless user
      new_password = SecureRandom.hex(16)
      user = {
        username: auth["info"]["nickname"],
        email: auth["info"]["email"],
        password: new_password,
        password_confirmation: new_password
      }
      user = create! user
    end

    user
  end

  def upvote! snippet
    vote = votes.find_or_create_by_snippet_id(snippet.id)
    direction = (vote.direction == 1) ? 0 : 1
    vote.update direction: direction
  end

  def downvote! snippet
    vote = votes.find_or_create_by_snippet_id(snippet.id)
    direction = (vote.direction == -1) ? 0 : -1
    vote.update direction: direction
  end

  def upvoted? snippet
    vote = votes.find_by_snippet_id(snippet.id)
    vote.present? && vote.direction == 1
  end

  def downvoted? snippet
    vote = votes.find_by_snippet_id(snippet.id)
    vote.present? && vote.direction == -1
  end

  def to_param
    username
  end
end
