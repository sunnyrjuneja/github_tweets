module AuthenticationHelper
  def set_omniauth_callback
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  end

  def login(user)
    token = User.new_remember_token
    user.remember_token = User.hash(token)
    user.save
    cookies[:remember_token] = token
  end

  def logout(user)
    cookies[:remember_token] = nil
  end
end
