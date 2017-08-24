class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |user|
      user.uid            = auth_info.uid
      user.nickname       = auth_info.info.nickname
      user.oauth_token    = auth_info.credentials.token
      user.image          = auth_info.extra.raw_info.avatar_url
      # user.followers      = auth_info.
      # binding.pry
      user.save
      user
    end
  end
end
