class Article < ApplicationRecord
  acts_as_paranoid

  acts_as_taggable_on :tags

  # relationships
  has_one_attached :cover_image
  
  belongs_to :user
  has_many :comments
  has_many :like_articles
  has_many :users, through: :like_articles

  # validation
  validates :title, presence: true, length: { minimum: 1 }

  def self.search(keyword)
    where("title like ? or content like ?",
          "%#{keyword}%",
          "%#{keyword}%"
    )
  end
end
