class CommitsController < ApplicationController
  def index
    # binding.pry
    @commits = GithubService.new.get_commits(params[:repo_id], current_user.oauth_token)
  end
end
