require 'spec_helper'

describe SessionsController do
  include AuthenticationHelper

  before do
    set_omniauth_callback
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
