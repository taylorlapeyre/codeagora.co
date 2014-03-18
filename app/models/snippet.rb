class Snippet < ActiveRecord::Base
  validates :name, :content, :public, presence: true
  validates :permalink, presence: true, uniqueness: true
  validates_presence_of :language

  belongs_to :user
  belongs_to :language

  before_validation :assign_permalink


  def assign_permalink
    self.permalink = SecureRandom.hex(7)
  end

  def pretty_content
    require 'pygmentize'
    Pygmentize.process(content, language.to_pygments)
  end

  def to_param
    permalink
  end
end
