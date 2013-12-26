class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    for_omniauth(auth) || via_omniauth(auth)
  end

  def self.for_omniauth(auth)
    where(auth.slice(:provider, :uid)).first
  end

  def self.via_omniauth(auth)
    info  = auth[:info]
    attrs = {}.merge(auth.slice(:provider, :uid))
              .merge(info.slice(:email, :first_name, :last_name, :image))
    create! attrs
  end
end
