class User < ActiveRecord::Base
  has_many :offers, dependent: :destroy

  def self.from_omniauth(auth)
    key   = auth.slice(:provider, :uid)
    attrs = auth[:info].slice(:email, :first_name, :last_name, :image)

    find_or_initialize_by(key).tap do |user|
      user.update! attrs
    end
  end
end
