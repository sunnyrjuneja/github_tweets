require 'spec_helper'

describe RepoSyncWorker, worker: true do
  include GithubApi

  describe '#perform' do
    let!(:user) { create(:user) }
    let(:worker) { RepoSyncWorker.new }
    
    before do
      stub_get_api(repo_list(user)).
        to_return(status: 200, body: mock_response('github_repos.json'))
    end

    it 'syncs repos with Github' do
      RepoSyncWorker.new.async.perform(user.id)
      expect(get_api repo_list user).to have_been_made
    end
  end
end
