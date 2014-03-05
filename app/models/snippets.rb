class Snippets < ActiveRecord::Base
  validates :name, presence: true
  validates :public, presence: true
  validates :permalink, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :language
end
