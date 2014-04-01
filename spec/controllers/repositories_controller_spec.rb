require 'spec_helper'

describe RepositoriesController do
  include AuthenticationHelper

  describe "GET 'index'" do
    let!(:user) { create(:user) }
    let!(:repo) { create(:repository) }

    before do
      login user
    end

    it 'blocks unauthenticated users' do
      logout
      get :index
      expect(response).to redirect_to '/auth/github'
    end

    it 'shows a list of repos' do
      get :index
      expect(assigns(:repos)).to eq(user.repositories)
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end
end
