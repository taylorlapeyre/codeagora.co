class Language < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :snippets

  def to_pygments
    {
      'Bash' => 'sh'
    }[name] || name.downcase
  end

  def syntax_colored_description
    require 'pygmentize'
    Pygmentize.process(description, to_pygments)
  end

  def to_param
    name
  end
end
