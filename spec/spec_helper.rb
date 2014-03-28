# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryGirl::Syntax::Methods

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end

omniauth_hash = {
  'provider' => 'github',
  'uid' => '12345',
  'info' => {
    'nickname' => 'whatasunnyday',
    'email' => 'jr.sunny@gmail.com',
    'name' => 'Sunnynbsp;Juneja',
    'image' => 'https://avatars.githubusercontent.com/u/12345?',
    'urls' => {
      'GitHub' => 'https://github.com/whatasunnyday',
      'Blog' => 'sunnyjuneja.com'
    }
  },
  'credentials' => {
    'token' => 'abcd1234',
    'expires' => false
  },
  'extra' => {
    'raw_info' => {
      'login' => 'whatasunnyday',
      'id' => 12345,
      'avatar_url' => 'https://avatars.githubusercontent.com/u/12345?',
      'gravatar_id' => '54321',
      'url' => 'https://api.github.com/users/whatasunnyday',
      'html_url' => 'https://github.com/whatasunnyday',
      'followers_url' => 'https://api.github.com/users/whatasunnyday/followers',
      'following_url' => 'https://api.github.com/users/whatasunnyday/following{/other_user}',
      'gists_url' => 'https://api.github.com/users/whatasunnyday/gists{/gist_id}',
      'starred_url' => 'https://api.github.com/users/whatasunnyday/starred{/owner}{/repo}',
      'subscriptions_url' => 'https://api.github.com/users/whatasunnyday/subscriptions',
      'organizations_url' => 'https://api.github.com/users/whatasunnyday/orgs',
      'repos_url' => 'https://api.github.com/users/whatasunnyday/repos',
      'events_url' => 'https://api.github.com/users/whatasunnyday/events{/privacy}',
      'received_events_url' => 'https://api.github.com/users/whatasunnyday/received_events',
      'type' => 'User',
      'site_admin' => false,
      'name' => 'Sunny&nbsp;Juneja',
      'company' => 'None',
      'blog' => 'sunnyjuneja.com',
      'location' => 'SF&nbsp;Bay&nbsp;Area',
      'email' => 'jr.sunny@gmail.com',
      'hireable' => false,
      'bio' => nil,
      'public_repos' => 37,
      'public_gists' => 1,
      'followers' => 5,
      'following' => 18,
      'created_at' => '2011-10-06T18:38:46Z',
      'updated_at' => '2014-03-26T17:03:40Z'
    }
  }
} 

OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:github, omniauth_hash)
