require 'spec_helper'

describe RepositorySyncer do
  let!(:user) { create(:user) }

  before do
    stub_github_api("/users/#{user.nickname}/repos").
      to_return(status: 200, body: mock_response('github_repos.json'))
  end

  it "should send a request the github api for the user's repos" do
    RepositorySyncer.new(user).sync
    expect(request_github_api("/users/#{user.nickname}/repos")).to have_been_made
  end

  it 'should create repos' do
    expect { RepositorySyncer.new(user).sync }.to change(Repository, :count).by(2)
  end

  it 'should not create duplicate repos' do
    RepositorySyncer.new(user).sync
    expect { RepositorySyncer.new(user).sync }.to change(Repository, :count).by(0)
  end
end

