class Snippet < ActiveRecord::Base
  validates :name, :content, :public, presence: true
  validates :permalink, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :language
end
