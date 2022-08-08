class Article < ApplicationRecord
  # relationships
  belongs_to :user

  # validation
  validates :title, presence: true, length: { minimum: 1 }

  default_scope -> { where(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.current)
  end
end
