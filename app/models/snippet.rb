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

  # Calculates training data for a snippet
  def to_training_data num_letters = 50
    # Get first n chars and count them by ascii value
    first_letters = content[0..num_letters]
    letter_count = Array.new(128, 0.0)
    first_letters.split("").each do |l|
      ascii = l.ord
      if ascii >= 0 && ascii < 128
        letter_count[ascii] = letter_count[ascii] + 1
      end
    end

    # Calculate ascii char frequency by diving by # letters counted
    letter_freq = letter_count.map { |n| n / first_letters.length }

    # Output training data is a zero array with 1 at the language  id of currecnt snippet
    num_languages = Language.all.count
    language = Array.new(num_languages, 0)
    language[self.language.id-1] = 1

    # Return training data
    train_data = [letter_freq, language]
  end

  private

  def assign_permalink
    self.permalink = SecureRandom.hex(7)
  end

  def assign_name
    self.name = permalink
  end
end
