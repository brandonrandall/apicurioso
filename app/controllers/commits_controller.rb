class CommitsController < ApplicationController
  def index
    @commits = GithubService.new.get_commits(params[:repo_id], current_user.oauth_token)
  end
end
