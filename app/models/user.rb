class User < ActiveRecord::Base
  has_many :offers, dependent: :destroy

  class Name
    attr_reader :first, :last

    def initialize(user)
      @first, @last = user.first_name, user.last_name
    end

    def full
      "#{ first } #{ last }"
    end

    def short
      "#{ first } #{ last[0] }."
    end
  end

  def name
    @name ||= Name.new(self)
  end

  def self.from_omniauth(auth)
    key   = auth.slice(:provider, :uid)
    attrs = auth[:info].slice(:email, :first_name, :last_name, :image)

    find_or_initialize_by(key).tap do |user|
      user.update! attrs
    end
  end
end
