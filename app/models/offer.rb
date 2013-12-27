class Offer < ActiveRecord::Base
  belongs_to :house, counter_cache: true, touch: true
  belongs_to :user
end
