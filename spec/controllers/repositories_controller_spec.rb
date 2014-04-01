require 'spec_helper'

describe RepositoriesController do
  include AuthenticationHelper

  let!(:user) { create(:user) }
  let!(:repo) { create(:repository, user: user) }

  before do
    login user
  end

  describe "GET 'index'" do
    before { get :index }

    it 'populates a list of repos' do
      expect(assigns(:repos)).to eq(user.repositories)
    end

    it 'renders the :index view' do
      expect(response).to render_template :index
    end
  end

  describe "GET 'show'" do
    it 'assigns the requested repo to @repo' do
      get :show, id: repo
      expect(assigns(:repo)).to eq(repo)
    end

    it 'renders the :show template' do
      get :show, id: repo
      expect(response).to render_template :show
    end

    it 'prevents different users from viewing' do
      logout
      login create(:user, uid: 123)
      get :show, id: repo
      expect(response).to redirect_to repositories_path
    end

    it 'redirects if a repo does not exist' do
      get :show, id: repo.id - 1
      expect(response).to redirect_to repositories_path
    end
  end

  context 'logged out' do
    before do
      logout
    end

    it "prevents GET 'index'" do
      get :index
      expect(response).to redirect_to '/auth/github'
    end

    it "prevents GET 'show'" do
      get :show, id: repo
      expect(response).to redirect_to '/auth/github'
    end
  end
end
