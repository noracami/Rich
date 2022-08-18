class Order < ApplicationRecord
  include AASM

  before_create :create_serial

  # relationships
  belongs_to :user

  # validation
  # validates :serial, presence: true
  validates :price, presence: true
  validates :state, presence: true

  aasm(column: 'state', no_direct_assignment: true) do
    state :pending, initial: true
    state :paid, :refunded, :cancelled, :failed

    event :pay do
      transitions from: %i[ pending failed ], to: :paid
      
      after do
        user.update(role: 'vip')
      end
    end

    event :fail do
      transitions from: :pending, to: :failed
    end

    event :cancel do
      transitions from: [:pending, :failed], to: :cancelled
    end

    event :refund do
      transitions from: :paid, to: :refunded
    end
  end

  private

  def create_serial
    # "ORD20220815XXXXXX(0~9a-zA-Z)"
    rand_str = [*(0..9), *('a'..'z'), *('A'..'Z')].sample(6).join
    now = Time.now
    self.serial = "ORD%4d%02d%02d%s" % [now.year, now.month, now.day, rand_str]
  end
end
