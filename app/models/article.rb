class Article < ApplicationRecord
  acts_as_paranoid

  # relationships
  belongs_to :user
  has_many :comments

  # validation
  validates :title, presence: true, length: { minimum: 1 }
end
