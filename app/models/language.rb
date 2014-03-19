class Language < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :snippets

  def to_pygments
    {
      'Bash' => 'sh',
      'C++' => 'cpp',
      'Assembly' => 'gas'
    }[name] || name.downcase
  end

  def pretty_description
    require 'pygmentize'
    Pygmentize.process(description, to_pygments)
  end

  def to_param
    name
  end
end
