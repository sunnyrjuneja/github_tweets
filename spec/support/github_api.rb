module GithubApi
  def stub_get_api(path)
    stub_request(:get, 'https://api.github.com' + path)
  end

  def stub_post_api(path)
    stub_request(:post, 'https://api.github.com' + path)
  end

  def stub_delete_api(path)
    stub_request(:delete, 'https://api.github.com' + path)
  end

  def get_api(path)
    a_request(:get, 'https://api.github.com' + path)
  end

  def post_api(path)
    a_request(:post, 'https://api.github.com' + path)
  end

  def delete_api(path)
    a_request(:delete, 'https://api.github.com' + path)
  end

  def repo_list(user)
    "/users/#{user.nickname}/repos"
  end

  def create_webhook(repo)
    "/repos/#{repo.user.nickname}/#{repo.name}/hooks?access_token=#{repo.user.token}"
  end

  def delete_webhook(repo, webhook)
    "/repos/#{repo.user.nickname}/#{repo.name}/hooks/#{webhook.gh_id}?access_token=#{repo.user.token}"
  end

  def payload(user)
    {
      'name' => 'web',
      'config' => {
        'url' => 'https://githubtweets.herokuapp.com/events',
        'content_type' => 'json'
      },
      'events' => ['issues', 'pull_request'],
      'active' => false
    }.to_json
  end
end
