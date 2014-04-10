require 'spec_helper'

describe WebhookWrapper do
  include GithubApi

  context '.webhook' do
    let(:repo) { create(:repository) }
    let(:wrapper) { WebhookWrapper.new(repo) }

    it 'return new webhook object if it does not exist' do
      expect(wrapper.webhook.new_record?).to be_true
    end
  end

  context '.create' do
    let(:repo) { create(:repository) }
    let(:wrapper) { WebhookWrapper.new(repo) }

    before do
      stub_post_api(create_webhook(repo)).with({body: payload(repo.user)}).
        to_return(status: 200, body: mock_response('create_hook.json'))
    end

    it 'should post the correct url' do
      wrapper.create
      expect(post_api(create_webhook(repo)).with({body: payload(repo.user)})).to have_been_made
    end

    it 'should create a webhook' do
      expect { wrapper.create }.to change(Webhook, :count).by(1)
    end
  end

  context '.delete' do
    let(:webhook) { create(:webhook) }
    let(:wrapper) { WebhookWrapper.new(webhook.repository) }

    before do
      stub_delete_api(delete_webhook(webhook.repository, webhook.gh_id))
    end

    it 'should post the correct url' do
      gh_id = webhook.gh_id
      wrapper.delete
      expect(delete_api(delete_webhook(webhook.repository, gh_id))).to have_been_made
    end

    it 'unless the webhook is not active' do
      gh_id = webhook.gh_id
      webhook.gh_id = nil
      expect(delete_api(delete_webhook(webhook.repository, gh_id))).not_to have_been_made
    end

    it 'should not remove a webhook' do
      expect { wrapper.delete }.not_to change(Webhook, :count).by(-1)
    end
  end
end
