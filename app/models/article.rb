class Article < ApplicationRecord
  # relationships
  belongs_to :user

  # validation
  validates :title, presence: true, length: { minimum: 1 }

  scope :available, -> { where(deleted_at: nil) }
  # lambda, Callback function
  # def self.available
  #   where(deleted_at: nil)
  # end
end
