class House < ActiveRecord::Base
  to_param :address

  has_many :offers, dependent: :destroy

  validates :address, presence: true
  validates :address, uniqueness: { case_sensitive: false }
end
