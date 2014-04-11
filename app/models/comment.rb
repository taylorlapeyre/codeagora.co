class Comment < ActiveRecord::Base
  include ApplicationHelper

  belongs_to :snippet
  belongs_to :user

  validates_presence_of :user, :snippet
  validates :content, presence: true

  after_create :notify_snippet_creator
  after_create :notify_other_commentors

  def pretty_content
    markdown content
  end

  def notify_snippet_creator
    message = "#{user.username} posted a comment on your snippet: #{snippet.name}."

    snippet.user.notify(message)
  end

  def notify_other_commentors
    message = "#{user.username} posted a comment on a snippet you've discussed before: #{snippet.name}."

    snippet.comments.map(&:user).each do |dude|
      dude.notify(message) unless dude == user
    end
  end
end
