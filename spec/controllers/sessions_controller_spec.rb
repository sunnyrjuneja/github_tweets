require 'spec_helper'

describe SessionsController, worker: true do
  include AuthenticationHelper
  include GithubApi

  before do
    set_omniauth_callback
    stub_get_api(repo_list(create(:user))).
      to_return(status: 200, body: mock_response('github_repos.json'))
  end

  describe '#create' do
    it 'should successfully create a user' do
      expect {
        post :create, provider: :github
      }.to change { User.count }.by(1)
    end

    it 'should successfully create a session' do
      expect(cookies[:remember_token]).to be_blank
      post :create, provider: :github
      expect(cookies[:remember_token]).not_to be_blank
    end

    it 'should redirect the user to the root url' do
      post :create, provider: :github
      expect(response).to redirect_to repositories_path
    end

    it 'create a job to sync repos with github' do
      job = double('job')
      RepositorySyncerWorker.stub_chain(:new, :async).and_return(job)
      expect(job).to receive(:perform)
      post :create, provider: :github
    end
  end

  describe '#destroy' do
    before do
      post :create, provider: :github
    end

    it 'should clear the session' do
      expect(cookies[:remember_token]).not_to be_blank
      delete :destroy
      expect(cookies[:remember_token]).to be_blank
    end

    it 'should redirect to the home page' do
      delete :destroy
      expect(response).to redirect_to root_url
    end
  end
end
