require 'faraday' 
require 'pp'

class RepositorySyncer
  def initialize(user)
    @user = user
  end

  def sync
    fetch.each { |gh_repo| create_or_update gh_repo }
  end

  private

    def fetch
      response = Faraday.get(repo_url)
      JSON.parse(response.body)
    end

    def create_or_update(gh_repo)
      Repository.find_or_create_by(gh_id: gh_repo['id']) do |repo|
        repo.name = gh_repo['name']
        repo.fork = gh_repo['fork']
        repo.user = @user
      end
    end

    def repo_url
      "https://api.github.com/users/#{@user.nickname}/repos"
    end
end
