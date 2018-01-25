class User < ApplicationRecord
  def self.from_github_omniauth(auth_info)
    user = where(uid: auth_info[:uid]).first_or_create do |user|
      user.provider       = auth_info.provider
      user.uid            = auth_info.uid
      user.nickname       = auth_info.info.nickname
      user.image          = auth_info.extra.raw_info.avatar_url
    end
    user.oauth_token    = auth_info.credentials.token
    user.save!
    user
  end

  def self.from_facebook_omniauth(auth)
    where(provider: auth[:provider], uid: auth[:uid], name: auth[:info][:name], image: auth[:info][:image]).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.save!
    end
  end
end
