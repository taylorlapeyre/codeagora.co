class Comment < ActiveRecord::Base
    include ApplicationHelper

  belongs_to :snippet
  belongs_to :user

  validates_presence_of :user, :snippet
  validates :content, presence: true

  after_create :notify_snippet_creator

  def pretty_content
    markdown content
  end

  def notify_snippet_creator
    message = "#{user.username} has posted a comment on your snippet #{snippet.name}."
    snippet.user.notify(message)
  end
end
