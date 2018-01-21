class User < ApplicationRecord
  def self.from_github_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |user|
      user.uid            = auth_info.uid
      user.nickname       = auth_info.info.nickname
      user.oauth_token    = auth_info.credentials.token
      user.image          = auth_info.extra.raw_info.avatar_url
      user.save!
    end
  end

  def self.from_facebook_omniauth(auth_info)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
