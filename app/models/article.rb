class Article < ApplicationRecord
  acts_as_paranoid

  # relationships
  belongs_to :user
  has_many :comments
  has_many :like_articles
  has_many :users, through: :like_articles

  # validation
  validates :title, presence: true, length: { minimum: 1 }
end
