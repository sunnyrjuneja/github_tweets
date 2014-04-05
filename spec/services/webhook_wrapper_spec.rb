require 'spec_helper'

describe WebhookWrapper do
  include GithubApi

  let(:repo) { create(:repository) }
  let(:wrapper) { WebhookWrapper.new(repo) }

  before do
    stub_post_api(webhook(repo)).with({body: payload(repo.user)}).
      to_return(status: 200, body: mock_response('create_hook.json'))
  end

  context '.create' do
    it 'should post the correct url' do
      wrapper.create
      expect(post_api(webhook(repo)).with({body: payload(repo.user)})).to have_been_made
    end

    it 'should create a webhook' do
      expect { wrapper.create }.to change(Webhook, :count).by(1)
    end
  end
end
