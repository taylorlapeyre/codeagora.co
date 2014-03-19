class Snippet < ActiveRecord::Base
    include ApplicationHelper

  validates :name, :content, :public, presence: true
  validates :permalink, presence: true, uniqueness: true
  validates_presence_of :language

  belongs_to :user
  belongs_to :language

  before_validation :assign_permalink
  before_validation :assign_name, if: Proc.new { |s| s.name.blank? }


  def to_param
    permalink
  end

  def pretty_content
    require 'pygmentize'
    Pygmentize.process(content, language.to_pygments)
  end

  private

  def assign_permalink
    self.permalink = SecureRandom.hex(7)
  end

  def assign_name
    self.name = unique_name_for content, user.username
  end
end
