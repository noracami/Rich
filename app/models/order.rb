class Order < ApplicationRecord
  include AASM

  # relationships
  belongs_to :user

  # validation
  validates :serial, presence: true
  validates :price, presence: true
  validates :state, presence: true

  aasm(column: 'state', no_direct_assignment: true) do
    state :pending, initial: true
    state :paid, :refunded, :cancelled, :fail

    event :pay do
      transitions from: %i[ pending fail ], to: :paid
      after do
        puts "text"
      end
    end

    event :fail do
      transitions from: :pending, to: :fail
    end

    event :cancel do
      transitions from: [:pending, :fail], to: :cancelled
    end

    event :refund do
      transitions from: :paid, to: :refunded
    end
  end
end
