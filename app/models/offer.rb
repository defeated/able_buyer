class Offer < ActiveRecord::Base
  belongs_to :house, counter_cache: true, touch: true
  belongs_to :user

  validates :reason, presence: true
  validates :offered_at, presence: true
  validates :replied_at, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
