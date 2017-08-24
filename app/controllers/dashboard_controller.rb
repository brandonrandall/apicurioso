class DashboardController < ApplicationController
  def index
    @followers = GithubService.new.followers(current_user.oauth_token)
    binding.pry
    @following = GithubService.new.following(current_user.oauth_token)

  end
end
