class House < ActiveRecord::Base
  has_many :offers, dependent: :destroy

  validate :address, presence: true
  validate :address, uniqueness: { case_sensitive: false }
end
