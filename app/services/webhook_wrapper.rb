require 'faraday'

class WebhookWrapper
  def initialize(repo)
    @repo = repo
    @user = repo.user
  end

  def create
    response = Faraday.post(webhooks_url, payload)
    json = JSON.parse(response.body)
    Webhook.create(gh_id: json['id'], user: @user, repository: @repo)
    response
  end

  private

    def webhooks_url
      "https://api.github.com/repos/#{@user.nickname}/#{@repo.name}/hooks?access_token=#{@user.token}"
    end

    def payload
      {
        name: 'web',
        config: {
          url: 'https://githubtweets.herokuapp.com/events',
          content_type: 'json'
        },
        events: ['issues', 'pull_request'],
        active: false
      }.to_json
    end
end
