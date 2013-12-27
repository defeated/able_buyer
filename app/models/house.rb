class House < ActiveRecord::Base
  validate :address, presence: true
  validate :address, uniqueness: { case_sensitive: false }
end
