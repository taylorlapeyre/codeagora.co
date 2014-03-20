class Comment < ActiveRecord::Base
    include ApplicationHelper

  belongs_to :snippet
  belongs_to :user

  validates_presence_of :user, :snippet

  def pretty_content
    markdown content
  end
end
