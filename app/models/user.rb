class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    uid = auth.fetch("uid").to_s
    provider = auth.fetch("provider")
    where(provider: provider, uid: uid).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end
