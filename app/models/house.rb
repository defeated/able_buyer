class House < ActiveRecord::Base
  has_many :offers, dependent: :destroy

  validates :address, presence: true
  validates :address, uniqueness: { case_sensitive: false }
end
