require 'faraday'

class WebhookWrapper
  def initialize(repo)
    @repo = repo
    @user = repo.user
  end

  def create
    unless webhook.active?
      gh_id = create_gh_webhook  
      webhook.gh_id = gh_id
      webhook.save
    end
  end

  def delete
    if webhook.active?
      delete_gh_webhook
      webhook.gh_id = nil
      webhook.save
    end
  end

  def webhook
    @repo.webhook || @repo.build_webhook(user: @user)
  end

  private

    def create_gh_webhook
      response = Faraday.post(create_webhook_url, payload)
      json = JSON.parse(response.body)
      json['id']
    end

    def delete_gh_webhook
      Faraday.delete(delete_webhook_url)
    end

    def create_webhook_url
      "https://api.github.com/repos/#{@user.nickname}/#{@repo.name}/hooks?access_token=#{@user.token}"
    end

    def delete_webhook_url
      "https://api.github.com/repos/#{@user.nickname}/#{@repo.name}/hooks/#{webhook.gh_id}?access_token=#{@user.token}"
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
