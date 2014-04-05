require 'spec_helper'

describe RepositorySyncer do
  include GithubApi

  let!(:user) { create(:user) }

  before do
    stub_get_api(repo_list(user)).
      to_return(status: 200, body: mock_response('github_repos.json'))
  end

  it "should send a request the github api for the user's repos" do
    RepositorySyncer.new(user).sync
    expect(get_api repo_list user).to have_been_made
  end

  it 'should create repos' do
    expect { RepositorySyncer.new(user).sync }.to change(Repository, :count).by(2)
  end

  it 'should not create duplicate repos' do
    RepositorySyncer.new(user).sync
    expect { RepositorySyncer.new(user).sync }.to change(Repository, :count).by(0)
  end
end

