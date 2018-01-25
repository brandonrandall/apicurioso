Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV["GITHUB_APP_ID"], ENV["GITHUB_SECRET"]
  provider :facebook, ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"]
end
