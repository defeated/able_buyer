class User < ActiveRecord::Base
  def self.for_omniauth(auth)
    where(auth.slice(%w(provider uid))).first
  end
end
