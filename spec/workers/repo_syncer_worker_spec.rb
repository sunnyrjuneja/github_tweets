require 'spec_helper'

describe RepoSyncWorker, worker: true do
  describe '#perform' do
    let!(:user) { create(:user) }
    let(:worker) { RepoSyncWorker.new }
    
    before do
      stub_github_api("/users/#{user.nickname}/repos").
        to_return(status: 200, body: mock_response('github_repos.json'))
    end

    it 'syncs repos with Github' do
      RepoSyncWorker.new.async.perform(user.id)
      expect(request_github_api("/users/#{user.nickname}/repos")).to have_been_made
    end
  end
end
