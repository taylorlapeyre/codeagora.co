class Snippet < ActiveRecord::Base
  include ApplicationHelper

  validates :name, :content, presence: true
  validates :permalink, presence: true, uniqueness: true
  validates_presence_of :language

  belongs_to :user
  belongs_to :language
  has_many   :comments
  has_and_belongs_to_many :tags

  before_validation :assign_permalink, if: proc { |s| s.permalink.blank? }
  before_validation :assign_name,      if: proc { |s| s.name.blank? }

  default_scope -> { where public: true }
  default_scope -> { order 'created_at DESC' }

  scope :tagged_with, ->(tag) { select { |s| s.tags.pluck(:name).include? tag } }
  scope :page,        ->(n) { offset((n - 1) * PAGE_SIZE).limit(PAGE_SIZE) }

  PAGE_SIZE = 10

  def to_param
    permalink
  end

  def self.page_count
    Snippet.count / PAGE_SIZE
  end

  def pretty_content
    require 'pygmentize'
    Pygmentize.process(content, language.to_pygments)
  end

  def tag_list
    tags.pluck(:name).join(',')
  end

  def tag_list=(string)
    self.tags = string.split(',').map(&:strip).map do |tag|
      Tag.find_or_create_by name: tag
    end
  end

  private

  def assign_permalink
    self.permalink = SecureRandom.hex(7)
  end

  def assign_name
    self.name = permalink
  end
end
