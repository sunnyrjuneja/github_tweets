require 'spec_helper'

describe RepositorySyncerWorker, worker: true do
  include GithubApi

  describe '#perform' do
    let!(:user) { create(:user) }
    let(:worker) { RepositorySyncerWorker.new }
    
    before do
      stub_get_api(repo_list(user)).
        to_return(status: 200, body: mock_response('github_repos.json'))
    end

    it 'syncs repos with Github' do
      worker.async.perform(user.id)
      expect(get_api repo_list user).to have_been_made
    end
  end
end
