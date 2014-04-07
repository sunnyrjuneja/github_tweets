class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.find_by(provider: auth['provider'], uid: auth['uid']) || 
      User.create_with_omniauth(auth)
    RepositorySyncerWorker.new.async.perform(user.id)
    sign_in user
    redirect_to repositories_path
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
