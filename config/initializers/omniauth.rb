Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GH_BASIC_CLIENT_ID'], ENV['GH_BASIC_SECRET_ID'], scope: 'user:email,admin:repo_hook'
  provider :twitter, ENV['TW_BASIC_CLIENT_ID'], ENV['TW_BASIC_SECRET_ID']
end

OmniAuth.config.logger = Rails.logger
