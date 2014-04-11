class Snippet < ActiveRecord::Base
  include ApplicationHelper

  validates :name, :content, presence: true
  validates :permalink, presence: true, uniqueness: true
  validates_presence_of :language

  belongs_to :user
  belongs_to :language
  has_many   :comments

  before_validation :assign_permalink, if: proc { |s| s.permalink.blank? }
  before_validation :assign_name,      if: proc { |s| s.name.blank? }

  default_scope -> { where public: true }
  default_scope -> { order 'created_at DESC' }

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
    self.name = permalink
  end
end
