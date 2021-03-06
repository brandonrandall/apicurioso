class GithubService

  def initialize
    @_connection = Faraday.new("https://api.github.com")
  end

  def followers(access_token)
    response = conn.get("/user/followers?access_token=#{access_token}")
    followers = JSON.parse(response.body, symbolize_names: true)
    followers.map do |follower|
      follower[:login]
    end
  end

  def self.get_followers(followers)
    followers.map { |follower| follower[:login] }
  end

  def following(access_token)
    response = conn.get("/user/following?access_token=#{access_token}")
    following = JSON.parse(response.body, symbolize_names: true)
    following.map { |followed| followed[:login]}
  end

  def self.get_following(following)
    following.map { |followed| followed[:login]}
  end

  def starred_repos(access_token)
    response = conn.get("/user/starred?access_token=#{access_token}")
    starred_repos = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_starred_repos(starred_repos)
    following.map { |followed| followed[:login]}
  end

  def get_commits(repo_id, access_token)
    binding.pry
    response = conn.get("/repos/user/#{repo_id}/commits?access_token=#{access_token}")
    commits = JSON.parse(response.body, symbolize_names: true)
  end

  def repos(access_token)
    response = conn.get("/user/repos?access_token=#{access_token}")
    repos = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    @_connection
  end
end
