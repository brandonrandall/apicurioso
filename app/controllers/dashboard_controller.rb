class DashboardController < ApplicationController
  def index
    @followers = GithubService.new.followers(current_user.oauth_token)
    @following = GithubService.new.following(current_user.oauth_token)
    @repos = GithubService.new.repos(current_user.oauth_token)
    # binding.pry
  end
end
