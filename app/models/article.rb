class Article < ApplicationRecord
  # relationships
  belongs_to :user

  # validation
  validates :title, presence: true, length: { minimum: 1 }
end
